#' error 504 get
#'
#' This function helps with timeout errors from the
#' API. Will rerun the request that has just timed out
#' after 10 seconds
#'
#' @param url a website url
#' @param key an API token
#'
#' @return a GET response
#'
#'
#' @examples
#' #NOT RUN error_504_get("www.timedoutrequest.com", myapikey)
error_504_get <- function(url,key){
  print(paste("504 timeout:",url))
  response<- httr::GET(url,httr::add_headers(AUTHORIZATION = paste(" Token ", key)))
  status <- httr::status_code(response)
  while(status==504){
    print(paste("504 timeout:",url))
    Sys.sleep(10)#wait 10 seconds
    #try again
    response<- httr::GET(url,httr::add_headers(AUTHORIZATION = paste(" Token ", key)))
    status <- httr::status_code(response)
  }
  if(status != 200){
    print("something went wrong with the request!")
    print(paste("code:",status,"url:",url))
    stop("invalid response code")
  }
  return(response)
}
