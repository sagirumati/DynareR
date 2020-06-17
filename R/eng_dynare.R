#' @export
eng_dynare <- function(options) {

  if(!dir.exists(options$label)) dir.create(options$label)

  # create the model from the chunk name
  file.create(paste(options$label,'/', options$label, '.', "mod", sep = ''))
  f <-paste(options$label,'/',options$label,".mod", sep = '')
  writeLines(options$code, f)
  on.exit(unlink(f))
  # mod is file extension of Dynare program

  m<-basename(tempfile(options$label, '.',paste(".", "m", sep = '')))   # m is file extension of octave/matlab
  m<-paste(options$label,".","m", sep = '')
  writeLines(c("addpath C:/dynare/4.6.1/matlab",paste('cd',' ',options$label, sep = ''),sprintf("dynare %s.mod",options$label)), m)

   on.exit(unlink(m))
    out <- ''

  # if eval != FALSE compile/run the code, preserving output
#shell_command="addpath C:/dynare/4.6.1/matlab"

  if (options$eval) {
    shell(paste("octave --eval",shQuote(sprintf("run %s",m))))
    }

  # spit back stuff to the user

  knitr::engine_output(options, options$code, out)
}
.onLoad<-function(libname,pkgname){
  knitr::knit_engines$set(dynare=eng_dynare)
}
