#' This function calculates and returns the expected number of genome samples by Epiweek and location, given a baseline.
#'
#' @param baseline numeric
#' @param seqM matrix
#' @param caseM matrix
#' @param ... further arguments passed to or from other methods
#'
#' @return matrix
#' @export

expectedSampleMatrix <- function(baseline, seqM, caseM, ...){
  for(i in 1:nrow(caseM)){
    for(j in 1:ncol(caseM)){
      if(ceiling(caseM[i, j]*baseline) < seqM[i, j]){
        seqM[i, j] = ceiling(caseM[i, j]*baseline)
      }
    }
  }
  comment(seqM) <- baseline %>% as.character()
  return(seqM)
}
