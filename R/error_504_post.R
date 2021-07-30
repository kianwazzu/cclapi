#' error 504 post
#'
#' This function helps with timeout errors from the
#' API. Will rerun the request after 10 seconds
#'
#' @param url a website url
#' @param key an API token
#' @param body a body for the POST request
#'
#' @return a POST response
#' @export
#'
#' @examples
#' #NOT RUN error_504_post("www.timedoutrequest.com", body= list(flow=1,variables=list(name=list(format="category"))),myapikey)
error_504_post <- function(url,key,body){
  print(paste("504 timeout:",url))
  response<- httr::POST(url,body = body,encode = "json",httr::add_headers(AUTHORIZATION = paste(" Token ", key)))
  status <- httr::status_code(response)
  while(status==504){
    print(paste("504 timeout:",url))
    Sys.sleep(10)#wait 10 seconds
    #try again
    response<- httr::POST(url,body = body,encode = "json",httr::add_headers(AUTHORIZATION = paste(" Token ", key)))
    status <- httr::status_code(response)
  }
  if(status != 200){
    print("something went wrong with the request!")
    print(paste("code:",status,"url:",url))
    stop("invalid response code")
  }
  return(response)
}
