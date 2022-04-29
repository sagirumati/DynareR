#' Set `Octave` path
#'
#' Use this function to set `Octave` path
#'
#' @usage set_octave_path(engine_path="octave")
#' @param engine_path Path to the Octave executable
#' @return Character
#'
#' @examples library(DynareR)
#' \dontrun{
#' set_octave_path('C:/Program Files/GNU Octave/Octave-6.4.0/mingw64/bin/octave20.exe')
#'}
#' @family important functions
#' @keywords documentation
#' @export
set_octave_path <- function(engine_path="octave") engine_path<<-engine_path
