#' post flow
#'
#' This function runs a POST request for the whole length of a given url and flow.
#' CCL is rate-limited to 2000 results, so this function will continue to make requests until
#' the next link is null
#'
#' @param url website url with endpoint
#' @param body a POST Body
#' @param key an API token
#' @param sum TRUE/FALSE If results should be summed up
#'
#' @return a Dataframe
#' @export
#'
#' @examples
#' #NOT RUN, API token needed  post_flow("https://app.communityconnectlabs.com/api/v2/flow_variable_report.json",
#' #body = list(flow=5,variables=list(var1 =list(format="category"),var2=list(format="category"))), sum = TRUE, key=myAPIkey)
#'
post_flow <- function(url,body,key, sum = TRUE){
  temp_fr<-httr::POST(url = url,body = body,encode = "json",httr::add_headers(AUTHORIZATION = paste(" Token ", key)))
  status<- httr::status_code(temp_fr)
  if(status==504){
    error_504_post(url = url,body = body,key = key)
  }
  if(status ==200){
    temp_fr <- response_to_list(temp_fr)
    last_one <- check_last(temp_fr)
    flow <- temp_fr$flow
    if(!last_one){
      counter <- 1
      nextlink <- temp_fr[["next"]]
      temp_fr <- temp_fr$results
      while(nextlink !="NULL"){
        to_append <- httr::POST(url = nextlink,body = body,encode="json",httr::add_headers(AUTHORIZATION = paste(" Token ", key)))
        status <- httr::status_code(to_append)
        if(status==504)
          error_504_POST(url=nextlink,body=body,key=key,add_headers(AUTHORIZATION = paste(" Token ",key)))
        if(status==200){
          to_append <- response_to_list(to_append)
          last_one <- check_last(to_append)
          if(!last_one){
            print(paste("success:",counter))
            nextlink <- to_append[["next"]]
          }else{ #is the last one
            print(paste("last one:",counter))
            nextlink <- "NULL"}
          to_append <- to_append$results
          counter <- counter +1
          temp_fr <- temp_fr %>% dplyr::bind_rows(to_append)
        }
      }
    }else{
      temp_fr <- temp_fr$results
    }
    if(sum){
    temp_fr <- temp_fr %>%  dplyr::transmute_all(~replace(.,is.na(.),0))
    temp_fr <- temp_fr %>%  dplyr::summarise_all(dplyr::funs(sum))
    }
    temp_fr <- temp_fr %>% dplyr::mutate(flow=flow)
  }
}
