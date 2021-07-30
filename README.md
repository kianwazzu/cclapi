
<!-- README.md is generated from README.Rmd. Please edit that file -->

# cclapi

<!-- badges: start -->
<!-- badges: end -->

The goal of cclapi is to make downloading results from Community Connect
Labs API easier …

## Installation

You can install the released version of cclapi with:

``` r
devtools::install_github("kianwazzu/cclapi")
```

## Example

This is not done yet :):

``` r
library(cclapi)
library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
library(knitr) #for displaying results
api_results <- get_flow(flow = flow,url = "https://app.communityconnectlabs.com/api/v2/contacts_report.json?flow=",key=key)
#> No encoding supplied: defaulting to UTF-8.
#> No encoding supplied: defaulting to UTF-8.
#> [1] "success: 1"
#> No encoding supplied: defaulting to UTF-8.
#> [1] "success: 2"
#> No encoding supplied: defaulting to UTF-8.
#> [1] "success: 3"
#> No encoding supplied: defaulting to UTF-8.
#> [1] "success: 4"
#> No encoding supplied: defaulting to UTF-8.
#> [1] "success: 5"
#> No encoding supplied: defaulting to UTF-8.
#> [1] "success: 6"
#> No encoding supplied: defaulting to UTF-8.
#> [1] "success: 7"
#> No encoding supplied: defaulting to UTF-8.
#> [1] "success: 8"
#> No encoding supplied: defaulting to UTF-8.
#> [1] "success: 9"
#> No encoding supplied: defaulting to UTF-8.
#> [1] "success: 10"
#> No encoding supplied: defaulting to UTF-8.
#> [1] "success: 11"
#> No encoding supplied: defaulting to UTF-8.
#> [1] "success: 12"
#> No encoding supplied: defaulting to UTF-8.
#> [1] "success: 13"
#> No encoding supplied: defaulting to UTF-8.
#> [1] "success: 14"
#> No encoding supplied: defaulting to UTF-8.
#> [1] "success: 15"
#> No encoding supplied: defaulting to UTF-8.
#> [1] "success: 16"
#> No encoding supplied: defaulting to UTF-8.
#> [1] "success: 17"
#> No encoding supplied: defaulting to UTF-8.
#> [1] "success: 18"
#> No encoding supplied: defaulting to UTF-8.
#> [1] "success: 19"
#> No encoding supplied: defaulting to UTF-8.
#> [1] "success: 20"
#> No encoding supplied: defaulting to UTF-8.
#> [1] "success: 21"
#> No encoding supplied: defaulting to UTF-8.
#> [1] "success: 22"
#> No encoding supplied: defaulting to UTF-8.
#> [1] "success: 23"
#> No encoding supplied: defaulting to UTF-8.
#> [1] "success: 24"
#> No encoding supplied: defaulting to UTF-8.
#> [1] "success: 25"
#> No encoding supplied: defaulting to UTF-8.
#> [1] "success: 26"
#> No encoding supplied: defaulting to UTF-8.
#> [1] "success: 27"
#> No encoding supplied: defaulting to UTF-8.
#> [1] "success: 28"
#> No encoding supplied: defaulting to UTF-8.
#> [1] "success: 29"
#> No encoding supplied: defaulting to UTF-8.
#> [1] "success: 30"
#> No encoding supplied: defaulting to UTF-8.
#> [1] "success: 31"
#> No encoding supplied: defaulting to UTF-8.
#> [1] "success: 32"
#> No encoding supplied: defaulting to UTF-8.
#> [1] "success: 33"
#> No encoding supplied: defaulting to UTF-8.
#> [1] "success: 34"
#> No encoding supplied: defaulting to UTF-8.
#> [1] "success: 35"
#> No encoding supplied: defaulting to UTF-8.
#> [1] "success: 36"
#> No encoding supplied: defaulting to UTF-8.
#> [1] "success: 37"
#> No encoding supplied: defaulting to UTF-8.
#> [1] "success: 38"
#> No encoding supplied: defaulting to UTF-8.
#> [1] "success: 39"
#> No encoding supplied: defaulting to UTF-8.
#> [1] "success: 40"
#> No encoding supplied: defaulting to UTF-8.
#> [1] "success: 41"
#> No encoding supplied: defaulting to UTF-8.
#> [1] "success: 42"
#> No encoding supplied: defaulting to UTF-8.
#> [1] "success: 43"
#> No encoding supplied: defaulting to UTF-8.
#> [1] "success: 44"
#> No encoding supplied: defaulting to UTF-8.
#> [1] "success: 45"
#> No encoding supplied: defaulting to UTF-8.
#> [1] "success: 46"
#> No encoding supplied: defaulting to UTF-8.
#> [1] "success: 47"
#> No encoding supplied: defaulting to UTF-8.
#> [1] "success: 48"
#> No encoding supplied: defaulting to UTF-8.
#> [1] "success: 49"
#> No encoding supplied: defaulting to UTF-8.
#> [1] "last one: 50"
#> Warning: `funs()` was deprecated in dplyr 0.8.0.
#> Please use a list of either functions or lambdas: 
#> 
#>   # Simple named list: 
#>   list(mean = mean, median = median)
#> 
#>   # Auto named with `tibble::lst()`: 
#>   tibble::lst(mean, median)
#> 
#>   # Using lambdas
#>   list(~ mean(., trim = .2), ~ median(., na.rm = TRUE))
kable(api_results)
```

| total\_unique\_contacts | flow                                 |
|------------------------:|:-------------------------------------|
|                  101412 | cf701519-8109-4626-ba0c-2dd9c515ce64 |
