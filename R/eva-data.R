#' Evaporation data (observation and model)
#'
#' Data of evaporation from in-situ observation and several soil model outputs
#'
#' @docType data
#'
#' @usage data(eva)
#'
#' @format An object of class \code{"data.frame"}.
#'  \describe{
#'    \item{Dates}{1st column with dates}
#'    \item{evapo_obs}{2nd column with evaporation observation}
#'    \item{OUT_PREC}{Precipitation}
#'    \item{OUT_EVAP}{Evaporation}
#'    \item{OUT_RUNOFF}{Runoff}
#'    \item{OUT_BASEFLOW}{Baseflow}
#'    \item{OUT_SOIL_MOIST_lyr_1}{Soil moisture from 1st layer}
#'    \item{OUT_EVAP_CANOP}{Evaporation from canopy}
#'    \item{OUT_SURF_TEMP}{Surface temperature}
#'    }
#'
#'
#' @references  Diaz et al. (2024) AAGG 2024
#' Not yet published
#'
#'
#' @examples
#' data(eva)
"eva"
