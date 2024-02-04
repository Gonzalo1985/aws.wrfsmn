#' Title
#'
#' @description
#' Download of WRF SMN data from AWS
#'
#' @param wrf.name list of names to download from get.wrf.files
#'
#' @import aws.s3
#' @return downloaded netcdf files
#' @export
#'
wrf.download <- function(wrf.name = wrf.name){
  for (i in 1:length(wrf.name))
  {
    save_object(
      object = wrf.name[i],
      bucket = "s3://smn-ar-wrf/",
      region = "us-west-2",
      file = substring(wrf.name[i], 28),
      overwrite = TRUE)
  }
}
