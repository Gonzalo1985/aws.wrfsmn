#' Plot of data
#'
#' @description
#' Plot of observed, modeled and corrected guidance series
#'
#' @param data Data frame from daily2monthly output function or any other
#' temporal series
#'
#' @import dplyr ggplot2
#' @return ggplot element
#'
#' @export
#'
ploting <- function(data = data)

{
  obs <- mod <- guid <- NULL
  data.tbl <- as_tibble(data)
  colnames(data.tbl) <- c('date', 'obs', 'mod', 'guid')
  data.tbl$date <- as.Date(data.tbl$date)
  data.tbl$obs <- as.numeric(data.tbl$obs)
  data.tbl$mod <- as.numeric(data.tbl$mod)
  data.tbl$guid <- as.numeric(data.tbl$guid)

  fig <- ggplot(data.tbl) + ggtitle("Model correction (Guidance)") +
    theme(panel.background = element_rect(fill = '#ececec', colour = 'black')) +
    theme(plot.title = element_text(hjust = 1)) +
    geom_line(aes(date, obs, colour = "observation", group = 1), size = 0.9) +
    geom_point(aes(date, obs), size = 1.5) +
    geom_line(aes(date, mod, colour = "model"), size = 0.9) +
    geom_line(aes(date, guid, colour = "guidance"), size = 0.9) +
    theme(axis.text = element_text(size = 14))

  print(fig)

}
