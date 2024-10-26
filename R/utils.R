#' @import magrittr knitr utils
#' @importFrom magick image_read image_read_pdf image_trim image_write



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

  if(!exists("matlabPath")) set_dynare_version()

  writeLines(c(matlabPath,paste0('cd ',modelDir),sprintf("dynare %s",dynarePath)), octaveFile)


  on.exit(unlink(octaveFile),add = T)

  if(octaveExecPath=="") matlab_exec() else octave_exec()

  if(import_log) import_log(paste0(modelDir,'/',model,'.log'))
  }

# octave_exec

octave_exec=function(){
  if(!exists("octaveExecPath")) set_octave_path()
  octaveExecPath=eval(expression(octaveExecPath),envir = parent.frame())
  octaveFile=eval(expression(octaveFile),envir = parent.frame()) # Dynamic scoping
  if(octaveExecPath=="")  stop('Please provide the correct path to the Octave executable compatible with the Dynare Version')
  system2(set_octave_path(octaveExecPath),paste("--eval",shQuote(paste("run",octaveFile))))
  }



# matlab_exec

matlab_exec=function(){
  if(!exists("matlabExecPath")) set_matlab_path()
  matlabExecPath=eval(expression(matlabExecPath),envir = parent.frame())
  octaveFile=eval(expression(octaveFile),envir = parent.frame()) # Dynamic scoping
  if(matlabExecPath=="")  stop('Please provide the correct path to the Matlab executable compatible with the Dynare Version')

  octaveFile=gsub(".m$","",octaveFile)

  system2(set_matlab_path(matlabExecPath),paste("-batch",octaveFile))
}
# Convert pdf to png

pdf2png <- function(path) {
  # only do the conversion for non-LaTeX output
  if (knitr::is_latex_output())
    return(path)
  path2 <- with_ext(path, "png")
  img <- image_read_pdf(path)
  image_write(img, path2, format = "png")
  path2
}

# Imported xfun

with_ext=function (x, ext, extra = "")
{
  if (anyNA(ext))
    stop("NA is not allowed in 'ext'")
  n1 = length(x)
  n2 = length(ext)
  if (n1 * n2 == 0)
    return(x)
  i = !grepl("^[.]", ext) & ext != ""
  ext[i] = paste0(".", ext[i])
  if (all(ext == ""))
    ext = ""
  r = sub("[$]$", "?$", reg_ext(extra))
  if (length(ext) == 1)
    return(sub(r, ext, x))
  if (n1 > 1 && n1 != n2)
    stop("'ext' must be of the same length as 'x'")
  mapply(sub, r, ext, x, USE.NAMES = FALSE)
}


# Imported xfun

reg_ext=function (extra = "")
{
  sprintf("([.](([%s[:alnum:]]+|tar[.](gz|bz2|xz)|nb[.]html)[~#]?))$",
          extra)
}


# Crop white space of images

plot_crop=function (x){
  if(endsWith(x,".pdf")){
    img = image_read_pdf(x,density = 600)

    x=gsub(".pdf$", "_cropped.pdf", x)
    image_write(image_trim(img),x,format = "pdf",density = 600, quality = 100)
}  else{
  img = image_read(x)
  image_write(image_trim(img), x,quality = 100)
}

 }







# ROUGH WORK


# summary,steady,eigenvalues,shocks,policy,moments,decomposition,correlations,autocorrelation

# extract_output=function(path,start,end,adjust=c(),pattern="[[:blank:]]{1,}"){
  # }
# any(grepl("COEFFICIENTS OF AUTOCORRELATION",log))

