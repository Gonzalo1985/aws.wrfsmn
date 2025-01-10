#' Calculation of ITH index
#'
#' @description
#' ITH index calculation is made from gridded observational or model data. If the data is needed in lat/lon projection is
#' better to use first the load.by.variable function to change projection
#' 
#' @param raster.list Spat Raster variable with several variables and times or only one Spat Raster field
#' 
#' @importFrom terra names
#' @importFrom terra nlyr
#' @return Spat Raster with ITH calculation for each time
#' 
#' @export
#'
ith <- function(raster.list = raster.list){
  T2.data <- raster.list[[which(names(raster.list) == "T2")]]
  HR2.data <- raster.list[[which(names(raster.list) == "HR2")]]
  
  term.1 <- 1.8 * T2.data
  term.2 <- 32
  term.3 <- (0.55 - (0.55 * HR2.data)) / 100
  term.4 <- (1.8 * T2.data) - 26
  
  ith <- term.1 + term.2 - (term.3 * term.4)
  
  new.names <- as.data.frame(matrix(data = "ITH", nrow = 1, ncol = nlyr(ith)))
  names(ith) <- new.names
  
  return(ith)
}