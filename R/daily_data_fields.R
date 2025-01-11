#' Daily data is obtained from hourly data
#'
#' @description
#' ....
#'
#' @usage daily.data.fields(raster.list, aggregate)
#'
#' @param raster.list Spat Raster variable with several times for a unique variable (T2 or HR2 or ...)
#' @param aggregate Type of aggregation (sum, mean, min, max)
#'
#' @importFrom terra time
#' @importFrom terra names
#' @importFrom terra app
#' @return Spat Raster with daily information
#'
#' @export
daily.data.fields <- function(raster.list = raster.list, aggregate = aggregate){
  output <- c()
  date.string <- unique(as.Date(time(raster.list)))
  
  for (i in 1:length(date.string))
    {
     position.date <- which(as.Date(time(raster.list)) == date.string[i])
     aux.raster <- raster.list[[position.date]]
     if (aggregate == "sum" ) {aux.output <- app(aux.raster, fun = sum)}
     if (aggregate == "mean") {aux.output <- app(aux.raster, fun = mean)}
     if (aggregate == "min" ) {aux.output <- app(aux.raster, fun = min)}
     if (aggregate == "max" ) {aux.output <- app(aux.raster, fun = max)}
     output <- append(output, aux.output)
    }
  names(output) <- paste0(date.string, "_", names(output))
  return(output)
}