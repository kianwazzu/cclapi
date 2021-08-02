#' get flow manual
#'
#' Runs an entire flow get request. Pass in a url manually formatted. Particularly useful when
#' running an endpoint for just 1 flow.
#'
#' @param url url
#' @param key an API token
#' @param sum TRUE/FALSE if wish to sum values
#'
#' @return a dataframe
#' @export
#'
#' @examples
#' #NOT RUN
#' #get_flow_manual("https://app.communityconnectlabs.com/api/v2/contacts_report.json?flow=uuid124",key=myAPIkey)
#'
get_flow_manual <- function(url,key,sum=TRUE){

  temp_fr<-httr::GET(url,httr::add_headers(AUTHORIZATION = paste(" Token ", key)))
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
  }
  return(temp_fr)
}
