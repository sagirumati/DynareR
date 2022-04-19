#' A wrapper for `addpath` to add `matlab` folder.
#'
#' Use this function to add `matlab` folder.
#' Use this function if `Dynare` is not installed in the standard location
#' @usage add_path(path)
#' @param path Path to the `matlab` folder. Default `path` is `/usr/lib/dynare/matlab` for `Linux`, `/usr/lib/dynare/matlab` for `macOs` and `c:/dynare/x.y/matlab` for `Windows`, where x.y is `Dynare` version number.
#' @return Set of \code{Dynare} (open-source software for DSGE modelling) outputs
#' @examples library(DynareR)
#' \dontrun{
#' app_path('path/to/matlab')
#'}
#' @family important functions
#' @keywords documentation
#' @export
add_path <- \(path) addPath<<-paste('addpath',path)

