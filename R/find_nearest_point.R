#' Title
#'
#' @description
#' Location of nearest point to lon/lat and temporal serie of location
#'
#' @param data.spat.raster Spat Raster of WRF SMN (only one or several)
#' @param lon Longitude location of nearest point to find
#' @param lat Latitude location of nearest point to find
#'
#' @import terra
#' @return a vector with the nearest location (lon/lat) and time serie of point
#' @export
#'
find.nearest.point <- function(data.spat.raster = data.spat.raster,
                               lon = lon, lat = lat){

  aux <- extract(data.spat.raster, vect(cbind(lon, lat)), xy = TRUE, ID = FALSE)

  nearest.point <- data.frame(closest.lon = aux$x, closest.lat = aux$y)

  nearest.serie <- aux[, -c(length(aux)-1, length(aux))]

  return(cbind(nearest.point, nearest.serie))
}
