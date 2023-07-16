#' This function calculates and returns the expected number of genome samples by Epiweek and location, given a baseline.
#' @importFrom magrittr %>%
#' @param baseline numeric
#' @param seqM matrix
#' @param caseM matrix
#' @param ... further arguments passed to or from other methods
#'
#' @return matrix
#' @export

expectedSampleMatrix <- function(baseline, seqM, caseM, ...){
  colN <- intersect(colnames(caseM), colnames(seqM)) %>% sort()
  rowN <- intersect(rownames(caseM), rownames(seqM)) %>% sort()
  sampleM <- matrix(0, length(rowN), length(colN))
  rownames(sampleM) <- rowN
  colnames(sampleM) <- colN

  for(i in 1:nrow(sampleM)){
    for(j in 1:ncol(sampleM)){
      if(ceiling(caseM[rowN[i], colN[j]]*baseline) < seqM[rowN[i], colN[j]]){
        sampleM[i, j] = ceiling(caseM[rowN[i], colN[j]]*baseline)
      }else{
        sampleM[i, j] = seqM[rowN[i], colN[j]]
      }
    }
  }
  comment(sampleM) <- baseline %>% as.character()
  return(sampleM)
}
