#' Set `Dynare` path
#'
#' Use this function to set `Dynare` path
#'
#' @usage set_dynare_version(dynare_version="")
#' @param dynare_version Path to the Dynare executable
#' @return Character
#'
#' @examples library(DynareR)
#' \dontrun{
#' set_dynare_version("6-unstable-2022-04-03-0800-700a0e3a") # The development version of Dynare
#' set_dynare_version("5.2")
#'}
#' @seealso eng_dynare
#' @keywords documentation
#' @export
set_dynare_version <- function(dynare_version="") {
  if(dynare_version=="") dynare_version=append(c("4.6.1","4.6.2","4.6.3","4.6.4"), format(seq(5.0,7,0.1),2,nsmall = 1)) else dynare_version=dynare_version
  dynare_version=paste0("C:/dynare/",dynare_version,"/matlab")
  dynare_version=dynare_version[dir.exists(dynare_version)]
  dynare_version<<-paste0("addpath ",dynare_version)
}