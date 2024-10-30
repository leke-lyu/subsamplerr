#' This function plots the sequencing ratio.
#' @importFrom magrittr %>%
#' @importFrom magrittr %<>%
#' @importFrom aweek get_date
#' @importFrom tidyr gather
#' @import ggplot2
#' @param seqM matrix
#' @param caseM matrix
#' @param ... further arguments passed to or from other methods
#'
#' @return plot
#' @export

plotSequencingRatio <- function(seqM, caseM, ...){
  colN <- intersect(colnames(caseM), colnames(seqM)) %>% sort()
  rowN <- intersect(rownames(caseM), rownames(seqM)) %>% sort()
  ratio <- seqM[rowN, colN]/caseM[rowN, colN]
  ratio %<>% t() %>% as.data.frame
  year <- row.names(ratio) %>% substr(., 1, 4)
  week <- row.names(ratio) %>% substr(., 6, 7)
  ratio$epiweek <- aweek::get_date(week, year)
  ratio %>% tidyr::gather(key = "variable", value = "value", -epiweek) %>%
    ggplot(., aes(x = epiweek, y = value)) +
    scale_x_date(date_breaks="2 week", date_labels = "%Y-%U") +
    geom_boxplot(aes(group = epiweek), fill = "white", colour = "black", outlier.shape = NA) +
    geom_point(aes(color = variable), alpha = 0.8) +
    theme_classic() +
    theme(legend.position="bottom") %>% return()
}
