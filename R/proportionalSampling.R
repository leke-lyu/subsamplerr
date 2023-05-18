#' This function samples and returns the genome ids as a vector.
#'
#' @param sampleM matrix
#' @param seqMeta dataframe
#' @param ... further arguments passed to or from other methods
#'
#' @return vector
#' @export

proportionalSampling <- function(sampleM, seqMeta, ...){
  samples <- vector()
  for(i in 1:nrow(sampleM)){
    for(j in 1:ncol(sampleM)){
      samples <- c(samples, sample(seqMeta[seqMeta$location == rownames(sampleM)[i] & seqMeta$epiweek == colnames(sampleM)[j], 1], sampleM[i,j], replace = FALSE))
    }
  }
  paste0("Given the basline equals ", (attributes(sampleM)$comment), ", ", sum(rowSums(sampleM)), " genomes are sampled.") %>% print()
  seqMeta[is.element(seqMeta$gisaid_epi_isl, samples), "location"] %>% table() %>% sort(decreasing = TRUE) %>% print()
  return(samples)
}
