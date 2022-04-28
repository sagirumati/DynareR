#' Import `dynare` log file as a list of R dataframes.
#'
#' Use `write_dyn(model,code)`  if you want the `Dynare` file to live in the current working directory.
#' Use `write_dyn(model,code,path)`  if you want the `Dynare` file to live in the path different from the current working directory.
#' @usage import_log(path=".",model="")
#' @inheritParams run_dynare
#' @param path A character string for the path to the `dynare` log file.
#' @return Set of \code{Dynare} (open-source software for DSGE modelling) outputs
#' @examples library(DynareR)
#' \dontrun{
#' import_log(model="BKK")
#'
#' # Alternatively, use the path to the log file
#'
#' import_log(path="BKK/BKK.log")
#'}
#' @family important functions
#' @keywords documentation
#' @export
import_log <- function(path=".",model="") {


  if(model!="" && path!=".") warning(paste0("Both 'path' and 'model' are not blank. So '",path, "' is used and '",model,"' is ignored."))

  if(path!=".") {
    path=path
    model=basename(path) %>% gsub("\\.log$","",.)
    }

  if(model!="" && path==".") {
    path=gsub("\\.log$","",model) %>%
    paste0(.,"/",.,".log")
}


  log=readLines(path)
  blank=grep("^\\s*$", log)
  outputs=list()

  # STEADY-STATE RESULTS:

  if(any(grepl("STEADY-STATE",log))){
  n1=grep("STEADY-STATE",log)+2
  n2=(blank[blank>n1][1])-1
  steady=log[n1:n2] %>%
  gsub("[[:blank:]]{1,}",",",.)
  outputs$steady=read.csv(text = steady,header = T)
  }

  # EIGENVALUES:

  if(any(grepl("EIGENVALUES:",log))){
    n1=grep("EIGENVALUES:",log)+1
  n2=(blank[blank>n1][2])-1
  eigenvalues=log[n1:n2] %>%
  gsub("[[:blank:]]{1,}",",",.)
if(any(grepl("^\\s*$",eigenvalues)))  eigenvalues=eigenvalues[-grep("^\\s*$", eigenvalues)]
eigenvalues=gsub('^,','',eigenvalues)
outputs$eigenvalues=read.csv(text = eigenvalues,header = T)
}


  # MODEL SUMMARY

  if(any(grepl("MODEL SUMMARY",log))){
  n1=grep("MODEL SUMMARY",log)+2
  n2=(blank[blank>n1][1])-1
  summary=log[n1:n2] %>%
  gsub(":",",",.)
  outputs$summary=read.csv(text = summary,header = T,check.names = F)
    }

  # MATRIX OF COVARIANCE OF EXOGENOUS SHOCKS

  if(any(grepl("MATRIX OF COVARIANCE",log))){
   n1=grep("MATRIX OF COVARIANCE",log)+1
  n2=(blank[blank>n1][1])-1
  shocks=log[n1:n2] %>%
  gsub("[[:blank:]]{1,}",",",.)
  outputs$shocks=read.csv(text = shocks,header = T)
    }


  # POLICY AND TRANSITION FUNCTIONS

  if(any(grepl("POLICY AND TRANSITION",log))){
  n1=grep("POLICY AND TRANSITION",log)+1
  n2=(blank[blank>n1][1])-1
  policy=log[n1:n2] %>%
  gsub("[[:blank:]]{1,}",",",.)
  outputs$policy=read.csv(text = policy,header = T)
  }

  # THEORETICAL MOMENTS (HP filter, lambda = 1600)

  if(any(grepl("THEORETICAL MOMENTS",log))){
   n1=grep("THEORETICAL MOMENTS",log)+1
  n2=(blank[blank>n1][1])-1
  moments=log[n1:n2] %>%
  gsub("[[:blank:]]{1,}",",",.) %>%
  gsub("STD\\.,DEV\\.","STD. DEV.",.)
  outputs$moments=read.csv(text = moments,header = T,check.names = F)
  }


  # VARIANCE DECOMPOSITION (in percent)

  if(any(grepl("VARIANCE DECOMPOSITION",log))){
  n1=grep("VARIANCE DECOMPOSITION",log)+1
  n2=(blank[blank>n1][1])-1
  decomposition=log[n1:n2] %>%
  gsub("[[:blank:]]{1,}",",",.)
  outputs$decomposition=read.csv(text = decomposition,header = T)
  }

  # MATRIX OF CORRELATIONS

  if(any(grepl("MATRIX OF CORRELATIONS",log))){
  n1=grep("MATRIX OF CORRELATIONS",log)+1
  n2=(blank[blank>n1][1])-1
  correlations=log[n1:n2] %>%
  gsub("[[:blank:]]{1,}",",",.)
  outputs$correlations=read.csv(text = correlations,header = T)
  }

   # COEFFICIENTS OF AUTOCORRELATION

  if(any(grepl("COEFFICIENTS OF AUTOCORRELATION",log))){
   n1=grep("COEFFICIENTS OF AUTOCORRELATION",log)+1
  n2=length(log)-1
  autocorrelation=log[n1:n2] %>%
  gsub("[[:blank:]]{1,}",",",.)
   outputs$autocorrelation=read.csv(text = autocorrelation,header = T)
  }



  assign(model,outputs,envir = dynare)

return()
}


