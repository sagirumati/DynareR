#' Set `Matlab` path
#'
#' Use this function to set `Matlab` path
#'
#' @param matlab_path Path to the Matlab executable. This overwrites `set_octave_path()` function.
#' @return Character
#'
#' @examples library(DynareR)
#' \dontrun{
#' set_matlab_path('C:/Program Files/MATLAB/R2024a/bin/matlab')
#'}
#' @family important functions
#' @keywords documentation
#' @export
set_matlab_path <- function(matlab_path="matlab"){

  matlabExecPath=Sys.which(matlab_path) # for Linux and macOS

  octaveExecPath<<-""

  matlabExecPath<<-matlabExecPath

}

