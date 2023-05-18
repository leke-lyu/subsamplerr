#' This function plots the sequencing percentage.
#' @importFrom magrittr %>%
#' @importFrom magrittr %<>%
#' @import ggplot2
#' @import lubridate
#' @import aweek
#' @import tidyr
#'
#' @param seqM matrix
#' @param caseM matrix
#' @param ... further arguments passed to or from other methods
#'
#' @return plot
#' @export

plotSequencingPercentage <- function(seqM, caseM, ...){
  ratio <- seqM/caseM
  ratio %<>% t() %>% as.data.frame
  year <- row.names(ratio) %>% substr(., 1, 4)
  week <- row.names(ratio) %>% substr(., 6, 7)
  ratio$epiweek <- get_date(week, year)
  ratio %>% gather(key = "variable", value = "value", -epiweek) %>%
    ggplot(., aes(x = epiweek, y = value)) +
    scale_x_date(date_breaks="2 week", date_labels = "%Y-%U") +
    geom_boxplot(aes(group = epiweek), fill = "white", colour = "black", outlier.shape = NA) +
    geom_point(aes(color = variable), alpha = 0.8) +
    theme_classic() +
    theme(legend.position="bottom") %>% return()
}
