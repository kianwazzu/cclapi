
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
library(knitr) #for displaying results
api_results <- get_flow(flow = flow,url = "https://app.communityconnectlabs.com/api/v2/contacts_report.json?flow=",key=key)
```

``` r
kable(api_results)
```

| total\_unique\_contacts | flow                                 |
|------------------------:|:-------------------------------------|
|                  101412 | cf701519-8109-4626-ba0c-2dd9c515ce64 |
