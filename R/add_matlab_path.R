#' A wrapper for `Octave's` `addpath` to add `matlab` folder.
#'
#' Use this function to add `matlab` folder.
#' Use this function if `Dynare` is **NOT** installed in the standard location
#' @param matlab_path Path to the `matlab` folder. Default `path` is `/usr/lib/dynare/matlab` for `Linux`, `/usr/lib/dynare/matlab` for `macOS` and `c:/dynare/x.y/matlab` for `Windows`, where x.y is `Dynare` version number.
#' @return Set of \code{Dynare} (open-source software for DSGE modelling) outputs
#' @examples library(DynareR)
#' \dontrun{
#' add_matlab_path('/usr/lib/dynare/matlab') #  Default for Linux
#'
#' add_matlab_path('c:/dynare/5.1/matlab') # Default for Windows, but 5.1 can change
#' # if later version of `Dynare` is installed.
#'
#' add_matlab_path('/usr/lib/dynare/matlab') # Default for macOS
#'
#'}
#' @family important functions
#' @keywords documentation
#' @export
add_matlab_path <- function(matlab_path) if(dir.exists(matlab_path) && endsWith(matlab_path,"matlab")) matlabPath<<-paste('addpath',matlab_path) else stop(paste0("'",matlab_path,"' is not a valid directory or does not end with 'matlab'"))

