#' This function converts date records into epidemiological week (epiweek) records.
#' @importFrom magrittr %>%
#' @importFrom lubridate epiyear
#' @importFrom lubridate epiweek
#' @param matrix matrix
#' @param ... further arguments passed to or from other methods
#'
#' @return matrix
#' @export

dateToEpiweek <- function(matrix, ...){
  Epiweek <- paste0((colnames(matrix) %>% as.Date() %>% lubridate::epiyear()), "_", (colnames(matrix) %>% as.Date() %>% lubridate::epiweek()))
  colnames(matrix) <- Epiweek
  matrix <- t(rowsum(t(matrix), colnames(matrix)))

  return(matrix)
}

