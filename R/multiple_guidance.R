#' Multiple lineal regression of data
#'
#' @description
#' Definition of linear multiple regression adjustment based on predictor
#' variables that fit a predicting variable
#'
#' @param input.data Data frame with first column as a "POSIXct" class and one or
#' more columns with data values. The predictand and predictors variables should
#' be located in these columns
#' @param predictand Character with column name of the predictand variable
#' @param predictors Character array with one or more elements of the predictors
#' chosen by the user
#'
#' @importFrom stats lm as.formula
#' @importFrom lubridate is.POSIXct
#' @return an element of class lm
#'
#'
#' @export
#'
multiple.guidance <- function(input.data = input.data,
                              predictand = predictand,
                              predictors = predictors)
{
  if (is.POSIXct(input.data[,1]) == TRUE)
    {lmodel <- lm(as.formula(paste0(predictand, " ~ ",
                                    paste(predictors, collapse = "+"))),
                  data = input.data)

     return(lmodel)} else {stop("The first column should be POSIXct class")}


}
