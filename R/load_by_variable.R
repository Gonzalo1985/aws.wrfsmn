#' Load and projection of data
#'
#' @description
#' Open of netcdf files of WRF SMN from AWS and optional projection
#'
#' @usage load.by.variable(nc.filenames, variable, transform, method)
#'
#' @param nc.filenames netcdf files
#' @param variable name of variable from https://odp-aws-smn.github.io/documentation_wrf_det/Formato_de_datos/ as character
#' @param transform TRUE to project data to longlat datum=WGS84
#' @param method if transform is set TRUE define projection method taken from project function of terra package
#'
#' @importFrom terra rast
#' @importFrom terra project
#' @return Spat Raster with the chosen variable (optional: with the projection changed)
#'
#' @export
#'
load.by.variable <- function(nc.filenames = nc.filenames,
                             variable = variable,
                             transform = transform,
                             method = method){

  nc.aux <- rast(nc.filenames)

  position.variable <- which(names(nc.aux) == variable)

  nc.aux <- nc.aux[[position.variable]]

  if (transform == TRUE) {nc.aux <- project(nc.aux,
                                            "+proj=longlat +datum=WGS84",
                                            method = method)}

  return(nc.aux)
}
