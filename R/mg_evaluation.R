#' Evaluation of regression
#'
#' @description
#' Evaluation of the linear multiple regression obtained from the
#' multiple.guidance function
#'
#' @param input.data Data frame with first column as a "POSIXct" class and one or
#' more columns with data values. The predictand and predictors variables should
#' be located in these columns
#' @param predictand Character with column name of the predictand variable
#' @param predictors Character array with one or more elements of the predictors
#' chosen by the user
#' @param var.model Character with column name of the modeled predicting variable
#' @param lmodel Element of class lm obtained from multiple.guidance output
#' function
#'
#' @importFrom stats predict cor
#' @import hydroGOF
#' @return List of two elements. First element is a matrix with the columns of
#' observed data, modeled data and corrected data. Second element is a data
#' frame of the statistical results of the modeled and corrected data versus
#' observed data
#'
#' @export
#'
mg.evaluation <- function(input.data = input.data,
                          predictand = predictand,
                          predictors = predictors,
                          var.model = var.model,
                          lmodel = lmodel)

{
  observation <- as.numeric(input.data[, predictand])
  model <- as.numeric(input.data[, var.model])
  guidance <- as.numeric(predict(lmodel, input.data[, predictors]))
  #guidance <- predict(lmodel, input.data)

  output.series <- cbind(as.character(input.data[, 'Dates']),
                         observation,
                         model,
                         guidance)
  colnames(output.series) <- c('Dates', 'observation', 'model', 'guidance')

  rmse.model <- rmse(model, observation)
  rmse.guida <- rmse(guidance, observation)
  NS.model <- NSE(model, observation)
  NS.guida <- NSE(guidance, observation)
  cor.model <- cor(model, observation, use = "complete.obs", method = "pearson")
  cor.guida <- cor(guidance, observation, use = "complete.obs", method = "pearson")
  KGE.model <- KGE(model, observation, method = "2012")
  KGE.guida <- KGE(guidance, observation, method = "2012")

  output.table <- data.frame(rmse = c(rmse.model, rmse.guida),
                             nash = c(NS.model, NS.guida),
                             corr = c(cor.model, cor.guida),
                             KGE = c(KGE.model, KGE.guida))
  rownames(output.table) <- c('Model', 'Guidance')

  return(list(output.series, output.table))

}
