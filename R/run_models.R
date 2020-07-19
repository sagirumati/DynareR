#' Run multiple \bold{existing} `mod` or `dyn` files.
#'
#' Use this function to execute multiple \bold{existing} \code{Dynare} files.
#' Use `run_models(file)`  if the Dynare files live in the current working directory.
#' Use `run_models(file,path)`  if the Dynare files live in the path different from the current working directory.
#'
#' @param file Object or a  vector of character strings representing the names of the \code{Dynare} files excluding `.mod` or `.dyn` file extension
#' @inheritParams run_dynare
#' @return Set of \code{Dynare} (open-source software for DSGE modelling) outputs
#' @examples library(DynareR)
#'
#' # Provide the list of the `Dynare` files in a vector
#' file=c("example1","example2","agtrend","bkk")
#' \dontrun{
#'
#' run_models(file)
#'}
#' @seealso write_mod write_dynare eng_dynare run_dynare
#' @keywords documentation
#' @export
run_models=function(file,path=""){
  for(i in file)  run_model(i,path)
}

