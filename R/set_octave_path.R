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
set_octave_path <- function(engine_path="octave"){
  engine_path=Sys.which(engine_path)

  octave_version=c('7.3.0','8.1.0')
  C:/Program Files/GNU Octave/Octave-7.3.0/mingw64/bin/octave.exe

  if(engine_path=="") engine_path=Sys.which("EViews13_x64")
  if(engine_path=="") engine_path=Sys.which("EViews13_x86")
  if(engine_path=="") engine_path=Sys.which("EViews12_x64")
  if(engine_path=="") engine_path=Sys.which("EViews12_x86")
  if(engine_path=="") engine_path=Sys.which("EViews11_x64")
  if(engine_path=="") engine_path=Sys.which("EViews11_x86")
  if(engine_path=="") engine_path=Sys.which("EViews10_x64")
  if(engine_path=="") engine_path=Sys.which("EViews10_x86")
  if(engine_path=="") engine_path=Sys.which("EViews9_x64")
  if(engine_path=="") engine_path=Sys.which("EViews9_x86")
  if(engine_path=="") engine_path=Sys.which("EViews10")
  if(engine_path=="") stop("EViews executable cannot be found, please use 'set_eviews_path' function to set the path to the EViews executable")
  engine_path<<-engine_path
}
