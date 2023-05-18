#' SARS-CoV-2 Epi trends in TX
#' @source <https://www.dshs.texas.gov/covid-19-coronavirus-disease-2019/texas-covid-19-data>
#' @format ## `texasCase` is a matrix with 26 rows and 365 columns:
#' rownames are Metro Areas in TX
#' colnames are date
"texasCase"

#' The metadata of SARS-CoV-2 genome samples
#' @format ## `texasSeqMeta`is a data frame with 24593 rows and 3 columns:
#' \describe{
#'   \item{gisaid_epi_isl}{GISAID id}
#'   \item{date}{sampling date}
#'   \item{location}{sampling location}
#'}
"texasSeqMeta"
