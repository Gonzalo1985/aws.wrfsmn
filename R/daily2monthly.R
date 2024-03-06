#' Daily data to monthly
#'
#' @description
#' Data transformation from daily to monthly scale
#'
#' @param data matrix with daily data from mg.evaluation output function
#'
#' @importFrom dplyr as_tibble group_by summarize
#' @importFrom lubridate floor_date
#' @importFrom magrittr %>%
#' @name %>%
#' @rdname daily2monthly
#' @return Data frame with monthly data
#'
#' @export
#'
daily2monthly <- function(data = data)
{
  observation <- model <- guidance <- NULL
  data <- as_tibble(data)
  data$Dates <- as.Date(data$Dates)
  data$observation <- as.numeric(data$observation)
  data$model <- as.numeric(data$model)
  data$guidance <- as.numeric(data$guidance)

  # round dates down to month
  data$months <- floor_date(data$Dates, "month")

  # find mean by month
  data.monthly <- data %>% group_by(months) %>% summarize(mean = mean(observation, na.rm = TRUE))
  data.monthly <- cbind(data.monthly, data %>% group_by(months) %>% summarize(mean = mean(model, na.rm = TRUE)))
  data.monthly <- cbind(data.monthly, data %>% group_by(months) %>% summarize(mean = mean(guidance, na.rm = TRUE)))

  data.monthly <- data.monthly[,c(-3, -5)]

  colnames(data.monthly) <- c("Dates", "observation", "model", "guidance")

  return(data.monthly)

}
