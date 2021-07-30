#' get flow
#'
#' This function runs a GET request for the whole length of a given url and flow.
#' CCL is rate-limited to 2000 results, so this function will continue to make requests until
#' the next link is null
#'
#' @param flow a flow uuid
#' @param url url formatted: "https:://app.communityconnectlabs.com/api/v2/endpoint.json?flow=" url must end in "flow=" can include groups
#' and other queries before "flow="
#' @param key an API token
#' @param sum TRUE/FALSE to sum results or not
#'
#' @return a dataframe
#' @export
#'
#' @examples
#' #NOT RUN get_flow(flow=uuid12345, url="https://app.communityconnectlabs.com/api/v2/contacts_report.json?flow=",
#' #key=myAPIkey)
#'
#' #NOT RUN - With additional query get_flow(flow=uuid12345,url="https://app.communityconnectlabs.com/api/v2/contacts_report.json?group=Opted-Out&flow=",
#' #key = myAPIkey, sum = TRUE)
#'
get_flow <- function(flow=NULL,url,key, sum=TRUE){
  url <- paste(url,flow,sep = "")
  temp_fr<- httr::GET(url,httr::add_headers(AUTHORIZATION = paste(" Token ", key)))
  status<- httr::status_code(temp_fr)
  if(status==504){
    error_504_get(url,key)
  }
  if(status ==200){
    temp_fr <- response_to_list(temp_fr)
    last_one <- check_last(temp_fr)
    if(!last_one){
      counter <- 1
      nextlink <- temp_fr[["next"]]
      temp_fr <- temp_fr$results
      while(nextlink !="NULL"){
        to_append <- httr::GET(nextlink,httr::add_headers(AUTHORIZATION = paste(" Token ", key)))
        status <- httr::status_code(to_append)
        if(status==504){
          error_504_get(nextlink,key)}
        if(status==200){
          to_append <- response_to_list(to_append)
          last_one <- check_last(to_append)
          if(!last_one){
            print(paste("success:",counter))
            nextlink <- to_append[["next"]]
          }else{ #is the last one
            print(paste("last one:",counter))
            nextlink <- "NULL"}#last one
          to_append <- to_append$results
          counter <- counter +1
          temp_fr <- temp_fr %>% dplyr::bind_rows(to_append)
        }

      }
    }else{ # if first is last
      temp_fr <- temp_fr$results
    }
    if(sum){
    temp_fr <- temp_fr %>%  dplyr::transmute_all(~replace(.,is.na(.),0))
    temp_fr <- temp_fr %>% dplyr::summarise_all(dplyr::funs(sum))}
    temp_fr <- temp_fr %>% dplyr::mutate(flow=flow)
  }
  return(temp_fr)
}
