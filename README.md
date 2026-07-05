
<!-- README.md is generated from README.Rmd. Please edit that file -->

# aws.wrfsmn

<!-- badges: start -->

<!-- badges: end -->

This R package (library) was created to handle WRF SMN data obtained
from Amazon (AWS) services
(<https://registry.opendata.aws/smn-ar-wrf-dataset/>). The operational
version can be obtained from
<https://cran.r-project.org/web/packages/aws.wrfsmn/index.html>.

## Installation

You can install the development version of aws.wrfsmn from
[GitHub](https://github.com/) with:

### Option 1

First, the repository containing the files needed to install the package
must be cloned. From an OS terminal, run the following command:

    $ git clone https://github.com/Gonzalo1985/aws.wrfsmn

From the folder cloned with the files of the repository, execute the
following command from an R console:

``` r
devtools::install()
#> ℹ Loading metadata database
#> ✔ Loading metadata database ... done
#> 
#> 
#> → Will download 1 package with unknown size.
#> ✔ All system requirements are already installed.
#> 
#> ℹ No downloads are needed
#> ✔ 56 deps: kept 15 [4.5s]
#> Registered S3 methods overwritten by 'callr':
#>   method                    from
#>   format.callr_status_error     
#>   print.callr_status_error
```

### Option 2

From an R console run the following command:

``` r
devtools::install_github("Gonzalo1985/aws.wrfsmn")
#> Warning: `install_github()` was deprecated in devtools 2.5.0.
#> ℹ Please use pak::pak("user/repo") instead.
#> This warning is displayed once per session.
#> Call `lifecycle::last_lifecycle_warnings()` to see where this warning was
#> generated.
#> Downloading GitHub repo Gonzalo1985/aws.wrfsmn@HEAD
#> Installing 34 packages: zoo, cpp11, proxy, timechange, classInt, e1071, xts, glue, viridisLite, withr, vctrs, utf8, pillar, magrittr, base64enc, digest, openssl, curl, hydroTSM, scales, S7, isoband, gtable, tibble, generics, Rcpp, xml2, httr, hydroGOF, ggplot2, dplyr, terra, lubridate, aws.s3
#> Installing packages into '/tmp/Rtmp3ifWkS/temp_libpath4e7d62dc18ee'
#> (as 'lib' is unspecified)
#> Installing package into '/tmp/Rtmp3ifWkS/temp_libpath4e7d62dc18ee'
#> (as 'lib' is unspecified)
```

Contact: Gonzalo M. Díaz (<gonzalomartindiaz22@gmail.com>)
