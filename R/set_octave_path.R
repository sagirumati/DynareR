#' Set `Octave` path
#'
#' Use this function to set `Octave` path
#'
#' @usage set_octave_path(octave_system_path="octave")
#' @param octave_system_path Path to the Octave executable
#' @return Character
#'
#' @examples library(DynareR)
#' \dontrun{
#' set_octave_path('C:/Program Files/octave 10/octave10.exe')
#'}
#' @seealso eng_dynare
#' @keywords documentation
#' @export
set_octave_path <- function(octave_system_path="octave") octave_system_path<<-octave_system_path