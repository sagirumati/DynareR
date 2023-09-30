#' Set `Octave` path
#'
#' Use this function to set `Octave` path
#'
#' @param octave_path Path to the Octave executable
#' @return Character
#'
#' @examples library(DynareR)
#' \dontrun{
#' set_octave_path('C:/Program Files/GNU Octave/Octave-6.4.0/mingw64/bin/octave20.exe')
#'}
#' @family important functions
#' @keywords documentation
#' @export
set_octave_path <- function(octave_path="octave"){

  octavePath=Sys.which(octave_path) # for Linux and macOS

 if (Sys.info()['sysname']=="Windows"){

   if (dynare_version %in% c("4.6.1","4.6.2","4.6.3")) octavePath=Sys.which("C:/Octave/Octave-5.2.0.0/mingw64/bin/octave-cli.exe")
   if (dynare_version=="4.6.4")                        octavePath=Sys.which("C:/Program Files/GNU Octave/Octave-6.2.0/mingw64/bin/octave-cli.exe")
   if (dynare_version %in% c("5.0","5.1","5.2"))       octavePath=Sys.which("C:/Program Files/GNU Octave/Octave-6.4.0/mingw64/bin/octave-cli.exe")
   if (dynare_version=="5.3")                          octavePath=Sys.which("C:/Program Files/GNU Octave/Octave-7.3.0/mingw64/bin/octave.exe")
   if (dynare_version=="5.4")                          octavePath=Sys.which("C:/Program Files/GNU Octave/Octave-8.1.0/mingw64/bin/octave.exe")

   # if (!dynare_version %in% c("4.6.1","4.6.2","4.6.3","4.6.4","5.0","5.1","5.2","5.3","5.4")) octavePath=Sys.which(octave_path)


    # octavePath <- switch(dynare_version,
   #                       "4.6.1" | "4.6.2" | "4.6.3", Sys.which("C:/Octave/Octave-5.2.0.0/mingw64/bin/octave-cli.exe"),
   #                       "4.6.4", Sys.which("C:/Program Files/GNU Octave/Octave-6.2.0/mingw64/bin/octave.exe"),
   #                       "5.0" | "5.1" | "5.2", Sys.which("C:/Program Files/GNU Octave/Octave-6.4.0/mingw64/bin/octave.exe"),
   #                       "5.3", Sys.which("C:/Program Files/GNU Octave/Octave-7.3.0/mingw64/bin/octave.exe"),
   #                       "5.4", Sys.which("C:/Program Files/GNU Octave/Octave-8.1.0/mingw64/bin/octave.exe"))

 }


  # if (tolower(Sys.info()['sysname']) == "darwin"){
  #
  #   if (dynare_version %in% c("4.6.1","4.6.2","4.6.3")) octavePath=Sys.which("/usr/local/Cellar/octave/4.4.1/bin/octave-cli.exe")
  # }

  if(octavePath=="")  warning('Please provide the correct path to the Octave executable compatible with the Dynare Version')

  octavePath<<-octavePath

}


# FOR UBUNTU

# ERROR MESSAGE: /usr/lib/R/bin/config: 1: eval: make: not found
# sudo apt-get update
# sudo apt-get install r-base-dev


# ERROR MESSAGE: Package "fontconfig" not found
# sudo apt-get install libfontconfig-dev
