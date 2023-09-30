#' Set `Dynare` version
#'
#' Use this function to set `Dynare` version
#'
#' @usage set_dynare_version(dynare_version="")
#' @param dynare_version Character representing `Dynare` version (for example 6.1, 4.6.1 and so on). This has effect on Windows only.
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

  dynareVersion=dynare_version

  if(dynareVersion=="") dynareVersion=append(c("4.6.1","4.6.2","4.6.3","4.6.4"), format(seq(5.0,9.9,0.1))) else dynareVersion=dynareVersion

  if(Sys.info()['sysname']=="Windows"){  # for Windows
    matlabPath=paste0("C:/dynare/",dynareVersion,"/matlab") %>%
      .[dir.exists(.)] %>%
      .[length(.)] %>%
      paste0("addpath ",.)
    if(matlabPath!="addpath ") dynareVersion <<- regmatches(matlabPath, regexpr("(?<=dynare/).*?(?=/matlab)", matlabPath, perl = TRUE)) else dynareVersion<<-""
      # if there is no matlab subdirectory, `matlabPath="addpath "`
    if(matlabPath=="addpath ") warning("The Dynare version does not exist")
    }

  if(Sys.info()['sysname']=="Darwin"){  # for macOS
    matlabPath=paste0("/Applications/Dynare/",dynareVersion,"/matlab") %>%
      .[dir.exists(.)] %>%
      .[length(.)] %>%
      paste0("addpath ",.)
    if(matlabPath!="addpath ") dynareVersion <<- regmatches(matlabPath, regexpr("(?<=dynare/).*?(?=/matlab)", matlabPath, perl = TRUE)) else dynareVersion<<-""
      if(matlabPath=="addpath ") warning("The Dynare version does not exist")
  }

  if(dir.exists("/usr/lib/dynare/matlab")) matlabPath<-"addpath /usr/lib/dynare/matlab" # for Linux
  if(dir.exists(" /usr/lib64/dynare/matlab")) matlabPath<-"addpath  /usr/lib64/dynare/matlab" # for on openSUSE
  if(dir.exists("/usr/local/lib/dynare/matlab")) matlabPath<-"addpath /usr/local/lib/dynare/matlab" # for macOS


  if(exists("matlab_pth")) matlabPath<<-matlabPath else matlabPath<<-""
  set_octave_path()

}


# Dynare dev version
# 6-unstable-2023-09-28-1543-f2abdb6e
