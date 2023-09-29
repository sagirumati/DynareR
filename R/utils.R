#' @import kableExtra magrittr knitr utils



# .onload

.onLoad<-function(libname,pkgname){
  knit_engines$set(dynare=eng_dynare)
  set_dynare_version()
if(!exists("dynare") || !is.environment(dynare)) dynare<<-new.env()
}

.onAttach <- function(libname, pkgname) {
  packageStartupMessage("Thank you for using DynareR!

          To acknowledge our work, please cite the package:

                        PLAIN TEXT:

  Sagiru Mati (2019). DynareR: Bringing the Power of Dynare to R, R
  Markdown, and Quarto. CRAN. https://CRAN.R-project.org/package=DynareR

              BIBTEX:


  @Article{Mati2019,
    title = {DynareR: Bringing the Power of {Dynare} to {R}, {R Markdown}, and {Quarto}},
    author = {Sagiru Mati},
    year = {2019},
    journal = {CRAN},
    url = {https://CRAN.R-project.org/package=DynareR},
  }")
}



# dir_create

dir_create=function(x) if(!dir.exists(x)) dir.create(x,recursive = T)

#  globalVariables

globalVariables(c("." ))

# run_model

run_model <- function(model,import_log=F) {

  path=dirname(model)
  model=basename(model)%>%
    gsub("(\\.mod|\\.dyn)$","",.)


  modelDir=paste0(path,"/",model)
  dir_create(modelDir)

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

  if(!exists("addPath")) set_dynare_version()

  writeLines(c(addPath,paste0('cd ',modelDir),sprintf("dynare %s",dynarePath)), octaveFile)


  on.exit(unlink(octaveFile),add = T)
  system_exec()

  if(import_log) import_log(paste0(modelDir,'/',model,'.log'))
  }

# system_exec

system_exec=function(){
  if(!exists("engine_path")) set_octave_path()
  engine_path=eval(expression(engine_path),envir = parent.frame())
  octaveFile=eval(expression(octaveFile),envir = parent.frame()) # Dynamic scoping
  system2(set_octave_path(engine_path),paste("--eval",shQuote(paste("run",octaveFile))))
}

















# ROUGH WORK


# summary,steady,eigenvalues,shocks,policy,moments,decomposition,correlations,autocorrelation

# extract_output=function(path,start,end,adjust=c(),pattern="[[:blank:]]{1,}"){
  # }
# any(grepl("COEFFICIENTS OF AUTOCORRELATION",log))

