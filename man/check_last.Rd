% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Check_last.R
\name{check_last}
\alias{check_last}
\title{check last respone}
\usage{
check_last(pull_response)
}
\arguments{
\item{pull_response}{an api response in list form after response_to_list call}
}
\value{
True of False if a next link exists
}
\description{
Check if the API response is the last for a given API Pull.
}
\examples{
#NOT RUN check_last(response_to_list(GET("https://app.communityconnectlabs.com/api/v2/contacts_report.json")))
}
