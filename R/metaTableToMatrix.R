#' This function transforms the metadata, which is in the form of a data frame, into a matrix.
#' @importFrom magrittr %>%
#' @importFrom dplyr group_by_at
#' @importFrom dplyr summarise
#' @param texasSeqMeta data frame
#' @param columnNameForLocation character string
#' @param columnNameForDate character string
#' @param ... further arguments passed to or from other methods
#'
#' @return matrix
#' @export

metaTableToMatrix <- function(texasSeqMeta, columnNameForLocation, columnNameForDate, ...){

  texasSeqCount <- texasSeqMeta %>%
    dplyr::group_by_at(c(columnNameForLocation, columnNameForDate)) %>%
    dplyr::summarise(total_count=n(), .groups = 'drop') %>%
    as.data.frame()
  MetroAreas <- texasSeqCount$location %>% unique() %>% sort()
  SamplingDate <- texasSeqCount$date %>% unique() %>% sort()
  texasSeq <- matrix(0, length(MetroAreas), length(SamplingDate))
  rownames(texasSeq) <- MetroAreas
  colnames(texasSeq) <- SamplingDate
  for (i in 1:nrow(texasSeqCount)) {
    texasSeq[texasSeqCount[i, "location"] == MetroAreas, texasSeqCount[i, "date"] == SamplingDate] <- texasSeqCount[i, "total_count"]
  }

  return(texasSeq)

}



