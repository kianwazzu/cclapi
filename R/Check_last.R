#' check last respone
#'
#' Check if the API response is the last for a given API Pull.
#'
#' @param pull_response an api response in list form after response_to_list call
#'
#' @return True of False if a next link exists
#'
#'
#' @examples #NOT RUN check_last(response_to_list(GET("https://app.communityconnectlabs.com/api/v2/contacts_report.json")))
check_last <- function(pull_response){
  last_one <- FALSE
  if(purrr::is_null(pull_response[["next"]])){
    last_one <- TRUE}
  return (last_one)
}
