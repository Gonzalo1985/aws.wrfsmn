#' Title
#'
#' @description
#' Character string with the filenames of WRF SMN located in AWS Bucket
#'
#' @param anual character or numeric of year
#' @param mes character or numeric of month
#' @param dia character or numeric of day
#' @param ciclo cycle of forecast, "00", "06", "12" or "18"
#' @param time selection of datasets, "01H", "24H" or "10M"
#'
#' @import aws.s3
#' @return string of the list of elements in the Bucket
#' @export
#'
get.wrf.files <- function(anual = anual, mes = mes, dia = dia,
                          ciclo = ciclo, time = time){

  mes <- sprintf("%02d", mes)
  dia <- sprintf("%02d", dia)

  # filenames of the Bucket
  wrf.names <- get_bucket_df(
    bucket = "s3://smn-ar-wrf/",
    prefix = paste0("DATA/WRF/DET/", anual, "/", mes, "/", dia, "/", ciclo),
    max = Inf,
    region = "us-west-2")

  wrf.names <- wrf.names$Key[grepl(time, wrf.names$Key)]

  return(wrf.names)
}
