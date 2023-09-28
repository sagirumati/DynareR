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
set_octave_path <- function(engine_path=""){
  engine_path=Sys.which(engine_path)

 if (Sys.info()['sysname']=="Windows" & engine_path==""){

   if (dynare_version %in% c("4.6.1","4.6.2","4.6.3")) engine_path=Sys.which("C:/Octave/Octave-5.2.0.0/mingw64/bin/octave-cli.exe")
   if (dynare_version=="4.6.4")                        engine_path=Sys.which("C:/Program Files/GNU Octave/Octave-6.2.0/mingw64/bin/octave.exe")
   if (dynare_version %in% c("5.0","5.1","5.2"))       engine_path=Sys.which("C:/Program Files/GNU Octave/Octave-6.4.0/mingw64/bin/octave.exe")
   if (dynare_version=="5.3")                          engine_path=Sys.which("C:/Program Files/GNU Octave/Octave-7.3.0/mingw64/bin/octave.exe")
   if (dynare_version=="5.4")                          engine_path=Sys.which("C:/Program Files/GNU Octave/Octave-8.1.0/mingw64/bin/octave.exe")

   # engine_path <- switch(dynare_version,
   #                       "4.6.1" | "4.6.2" | "4.6.3", Sys.which("C:/Octave/Octave-5.2.0.0/mingw64/bin/octave-cli.exe"),
   #                       "4.6.4", Sys.which("C:/Program Files/GNU Octave/Octave-6.2.0/mingw64/bin/octave.exe"),
   #                       "5.0" | "5.1" | "5.2", Sys.which("C:/Program Files/GNU Octave/Octave-6.4.0/mingw64/bin/octave.exe"),
   #                       "5.3", Sys.which("C:/Program Files/GNU Octave/Octave-7.3.0/mingw64/bin/octave.exe"),
   #                       "5.4", Sys.which("C:/Program Files/GNU Octave/Octave-8.1.0/mingw64/bin/octave.exe"))


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
 }


  engine_path<<-engine_path



}
