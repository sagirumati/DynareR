#' Set `Matlab` path
#'
#' Use this function to set `Matlab` path
#'
#' @param matlab_path Path to the Matlab executable
#' @return Character
#'
#' @examples library(DynareR)
#' \dontrun{
#' set_matlab_path('C:/Program Files/GNU Matlab/Matlab-6.4.0/mingw64/bin/matlab20.exe')
#'}
#' @family important functions
#' @keywords documentation
#' @export
set_matlab_path <- function(matlab_path="matlab"){

  matlabPath=Sys.which(matlab_path) # for Linux and macOS

  octavePath<<-""

  matlabPath<<-matlabPath

}

