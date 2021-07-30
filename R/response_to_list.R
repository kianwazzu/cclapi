#' response_to_list
#'
#' Converts a GET or POST request from JSON to a list.
#' @param raw_response a result of a GET() or POST() call
#'
#' @return a list
#'
#'
#' @examples
#' #response_to_list(httr::GET("https://app.communityconnectlabs.com/api/v2/contacts.json"))
response_to_list <- function(raw_response){
  raw_response <- httr::content(raw_response,"text")
  raw_response <- jsonlite::fromJSON(raw_response,flatten = TRUE)
  return(raw_response)
}
