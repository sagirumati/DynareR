#' Set `Octave` path
#'
#' Use this function to set `Octave` path
#'
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

 if (Sys.info()['sysname']=="Windows"){

   if (dynare_version %in% c("4.6.1","4.6.2","4.6.3")) engine_path=Sys.which("C:/Octave/Octave-5.2.0.0/mingw64/bin/octave-cli.exe")
   if (dynare_version=="4.6.4")                        engine_path=Sys.which("C:/Program Files/GNU Octave/Octave-6.2.0/mingw64/bin/octave-cli.exe")
   if (dynare_version %in% c("5.0","5.1","5.2"))       engine_path=Sys.which("C:/Program Files/GNU Octave/Octave-6.4.0/mingw64/bin/octave-cli.exe")
   if (dynare_version=="5.3")                          engine_path=Sys.which("C:/Program Files/GNU Octave/Octave-7.3.0/mingw64/bin/octave.exe")
   if (dynare_version=="5.4")                          engine_path=Sys.which("C:/Program Files/GNU Octave/Octave-8.1.0/mingw64/bin/octave.exe")

   # if (!dynare_version %in% c("4.6.1","4.6.2","4.6.3","4.6.4","5.0","5.1","5.2","5.3","5.4")) engine_path=Sys.which(engine_path)


    # engine_path <- switch(dynare_version,
   #                       "4.6.1" | "4.6.2" | "4.6.3", Sys.which("C:/Octave/Octave-5.2.0.0/mingw64/bin/octave-cli.exe"),
   #                       "4.6.4", Sys.which("C:/Program Files/GNU Octave/Octave-6.2.0/mingw64/bin/octave.exe"),
   #                       "5.0" | "5.1" | "5.2", Sys.which("C:/Program Files/GNU Octave/Octave-6.4.0/mingw64/bin/octave.exe"),
   #                       "5.3", Sys.which("C:/Program Files/GNU Octave/Octave-7.3.0/mingw64/bin/octave.exe"),
   #                       "5.4", Sys.which("C:/Program Files/GNU Octave/Octave-8.1.0/mingw64/bin/octave.exe"))

 }


  if (tolower(Sys.info()['sysname']) == "darwin"){

    if (dynare_version %in% c("4.6.1","4.6.2","4.6.3")) engine_path=Sys.which("/usr/local/Cellar/octave/4.4.1/bin/octave-cli.exe")
  }

  if(engine_path=="") stop('Please use provide the correct path to octave executable')

  engine_path<<-engine_path

}


# FOR UBUNTU

# ERROR MESSAGE: /usr/lib/R/bin/config: 1: eval: make: not found
# sudo apt-get update
# sudo apt-get install r-base-dev


# ERROR MESSAGE: Package "fontconfig" not found
# sudo apt-get install libfontconfig-dev
