#' Import log as R variables
#'
#' Use `write_dyn(model,code)`  if you want the `Dynare` file to live in the current working directory.
#' Use `write_dyn(model,code,path)`  if you want the `Dynare` file to live in the path different from the current working directory.

#' @inheritParams run_dynare
#' @return Set of \code{Dynare} (open-source software for DSGE modelling) outputs
#' @examples library(DynareR)
#' \dontrun{
#' import_log(b)
#'}
#' @family important functions
#' @keywords documentation
#' @export
import_log <- function(path=".",chunk="") {

  if(chunk!="") path
  path="inst/examples/bkk/bkk.log"
  if(chunk!="") path=paste0(chunk,'/',chunk,'.log')

  log=readLines(path)

  # STEADY-STATE RESULTS:

  n1=grep("STEADY-STATE",log)+2
  n2=grep("EIGENVALUES:",log)-2

  steady=log[n1:n2]
  steady1=gsub("[[:blank:]]{1,}",",",steady)

  # EIGENVALUES:
  blank=grep("^\\s*$", log)
  n1=grep("EIGENVALUES:",log)+1
  n2=(blank[blank>n1][2])-1
  eigenvalues=log[n1:n2]
  eigenvalues=gsub("[[:blank:]]{1,}",",",eigenvalues)
  eigenvalues=eigenvalues[-grep("^\\s*$", eigenvalues)]


  # MODEL SUMMARY
  blank=grep("^\\s*$", log)
  n1=grep("MODEL SUMMARY",log)+2
  n2=(blank[blank>n1][1])-1
  summary=log[n1:n2]
  summary=gsub(":",",",summary)


  # MATRIX OF COVARIANCE OF EXOGENOUS SHOCKS

  n1=grep("MATRIX OF COVARIANCE",log)+1
  n2=(blank[blank>n1][1])-1
  shocks=log[n1:n2]
  shocks=gsub("[[:blank:]]{1,}",",",shocks)

  # POLICY AND TRANSITION FUNCTIONS

  n1=grep("POLICY AND TRANSITION",log)+1
  n2=(blank[blank>n1][1])-1
  policy=log[n1:n2]
  policy=gsub("[[:blank:]]{1,}",",",policy)


  # THEORETICAL MOMENTS (HP filter, lambda = 1600)

  n1=grep("THEORETICAL MOMENTS",log)+1
  n2=(blank[blank>n1][1])-1
  moments=log[n1:n2]
  moments=gsub("[[:blank:]]{1,}",",",moments)

  # VARIANCE DECOMPOSITION (in percent)

  n1=grep("VARIANCE DECOMPOSITION",log)+1
  n2=(blank[blank>n1][1])-1
  decomposition=log[n1:n2]
  decomposition=gsub("[[:blank:]]{1,}",",",decomposition)


  # MATRIX OF CORRELATIONS

  n1=grep("MATRIX OF CORRELATIONS",log)+1
  n2=(blank[blank>n1][1])-1
  correlations=log[n1:n2]
  correlations=gsub("[[:blank:]]{1,}",",",correlations)

  # COEFFICIENTS OF AUTOCORRELATION

   n1=grep("COEFFICIENTS OF AUTOCORRELATION",log)+1
  n2=length(log)-1
  autocorrelation=log[n1:n2]
  autocorrelation=gsub("[[:blank:]]{1,}",",",autocorrelation)
  }


