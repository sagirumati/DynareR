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
#'
#' # If you want to use the development version of Dynare
#'
#' set_dynare_version("6-unstable-2022-04-03-0800-700a0e3a") # The development version of Dynare
#'
#' # If you want to use Dynare version 5.2
#'
#' set_dynare_version("5.2")
#'}
#' @family important functions
#' @keywords documentation
#' @export
set_dynare_version <- function(dynare_version="") {
  if(dynare_version=="") dynare_version=append(c("4.6.1","4.6.2","4.6.3","4.6.4"), format(seq(5.0,7,0.1),2,nsmall = 1)) else dynare_version=dynare_version

  if(dir.exists("C:/dynare")){
  dynare_version=paste0("C:/dynare/",dynare_version,"/matlab")
  dynare_version=dynare_version[dir.exists(dynare_version)]
  dynare_version=dynare_version[length(dynare_version)]
  addPath<<-paste0("addpath ",dynare_version)
  }


  if(dir.exists("/usr/lib/dynare/matlab")) addPath<<-"addpath /usr/lib/dynare/matlab"

  if(dir.exists("/usr/local/lib/dynare/matlab")) addPath<<-"addpath /usr/local/lib/dynare/matlab"



  }
