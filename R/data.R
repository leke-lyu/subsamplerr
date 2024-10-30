#' Daily case counts of SARS-CoV-2 by subregion in Texas
#' @source <https://www.dshs.texas.gov/covid-19-coronavirus-disease-2019/texas-covid-19-data>
#' @format ## `texasCase` is a matrix with 26 rows and 365 columns:
#' rownames are Metro Areas in TX
#' colnames are date (YYYY-MM-DD)
"texasCase"

#' Metadata for SARS-CoV-2 Delta variant genome samples collected from Texas
#' @format ## `texasSeqMeta`is a data frame with 24593 rows and 3 columns:
#' \describe{
#'   \item{gisaid_epi_isl}{GISAID id}
#'   \item{date}{sampling date}
#'   \item{location}{sampling location}
#'}
"texasSeqMeta"
