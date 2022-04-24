#' @import knitr
#' @importFrom utils read.csv
#' @importFrom magrittr %>%
# .onload

.onLoad<-function(libname,pkgname){
  knit_engines$set(dynare=eng_dynare)
  set_dynare_version()
  set_octave_path()
if(!exists("dynare") || !is.environment(dynare)) dynare<<-new.env()
}



# dir_create

dir_create=function(x) if(!dir.exists(x)) dir.create(x,recursive = T)


# Run_model

run_model <- function(model) {

  path=dirname(model)
  model=basename(model)


  modelDir=paste0(path,"/",model) %>% dir_create()

  modFile=paste0(path,"/",model,".mod")
  dynFile=paste0(path,"/",model,".dyn")

  if(file.exists(modFile)){
    file.copy(modFile,modelDir,overwrite = T)
    dynarePath=basename(modFile)
  } else{
    file.copy(dynFile,modelDir,overwrite = T)
    dynarePath=basename(dynFile)
  }

  octaveFile<-basename(tempfile(model, '.',".m"))   # m is file extension of octave/matlab

  writeLines(c(addPath,paste0('cd ',modelDir),sprintf("dynare %s",dynarePath)), octaveFile)


  on.exit(unlink(octaveFile),add = T)
  system_exec()
}

# system_exec

system_exec=function(){
  octave_system_path=eval(expression(octave_system_path),envir = parent.frame())
  octaveFile=eval(expression(octaveFile),envir = parent.frame()) # Dynamic scoping
  system2(set_octave_path(octave_system_path),paste("--eval",shQuote(paste("run",octaveFile))))
}

















# ROUGH WORK


# summary,steady,eigenvalues,shocks,policy,moments,decomposition,correlations,autocorrelation

# extract_output=function(path,start,end,adjust=c(),pattern="[[:blank:]]{1,}"){
  # }
# any(grepl("COEFFICIENTS OF AUTOCORRELATION",log))

