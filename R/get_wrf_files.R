#' Title
#'
#' @description
#' Character string with the filenames of WRF SMN located in AWS Bucket
#'
#' @usage get.wrf.files(year = year, month = month, day = day, cycle = cycle, time = time)
#'
#' @param year character or numeric of year
#' @param month character or numeric of month
#' @param day character or numeric of day
#' @param cycle cycle of forecast, "00", "06", "12" or "18"
#' @param time selection of datasets, "01H", "24H" or "10M"
#'
#' @import aws.s3
#' @return string of the list of elements in the Bucket
#'
#' @export
#'
get.wrf.files <- function(year = year, month = month, day = day,
                          cycle = cycle, time = time){

  month <- sprintf("%02d", month)
  day <- sprintf("%02d", day)

  # filenames of the Bucket
  wrf.names <- get_bucket_df(
    bucket = "s3://smn-ar-wrf/",
    prefix = paste0("DATA/WRF/DET/", year, "/", month, "/", day, "/", cycle),
    max = Inf,
    region = "us-west-2")

  wrf.names <- wrf.names$Key[grepl(time, wrf.names$Key)]

  return(wrf.names)
}
