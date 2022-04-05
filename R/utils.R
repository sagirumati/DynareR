
# .onload

.onLoad<-function(libname,pkgname){
  knitr::knit_engines$set(dynare=eng_dynare)
  set_dynare_version()
  set_octave_path()

}


# system_exec

system_exec=function(){
  octave_system_path=eval(expression(octave_system_path),envir = parent.frame())
  octaveFile=eval(expression(octaveFile),envir = parent.frame()) # Dynamic scoping
  system2(set_octave_path(octave_system_path),paste("--eval",shQuote(paste("run",octaveFile))))
}


# Run_model

run_model <- function(model,path=".") {

  modelDir=paste0(path,"/",model)
  if(!dir.exists(modelDir)) dir.create(modelDir)

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

  writeLines(c(dynare_version,paste0('cd ',modelDir),sprintf("dynare %s",dynarePath)), octaveFile)


  on.exit(unlink(octaveFile),add = T)
  system_exec()
}

