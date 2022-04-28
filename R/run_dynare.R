#' Create and run `Dynare` `mod` file
#'
#' Use this function to create and run `Dynare` `mod` file.
#' Use `run_dynare(model,code)`  if you want the `Dynare` files to live in the current working directory.
#' Use `run_dynare(model,code,path)` if you want the `Dynare` files to live in the path different from the current working directory.
#'
#' @param model Object or a character string representing the name of the `Dynare` model file (`.mod` or `.dyn` extension)
#' @param code Object or a character string representing the set of `Dynare` codes
#' @param import_log Logical. Whether or not to import `dynare` log file.
#' @return Set of \code{Dynare} (open-source software for DSGE modelling) outputs
#' @examples library(DynareR)
#' \dontrun{
#' DynareCodes='var y, c, k, a, h, b;
#' varexo e, u;
#' parameters beta, rho, alpha, delta, theta, psi, tau;
#' alpha = 0.36;
#' rho   = 0.95;
#' tau   = 0.025;
#' beta  = 0.99;
#' delta = 0.025;
#' psi   = 0;
#' theta = 2.95;
#' phi   = 0.1;
#' model;
#' c*theta*h^(1+psi)=(1-alpha)*y;
#' k = beta*(((exp(b)*c)/(exp(b(+1))*c(+1)))
#'           *(exp(b(+1))*alpha*y(+1)+(1-delta)*k));
#' y = exp(a)*(k(-1)^alpha)*(h^(1-alpha));
#' k = exp(b)*(y-c)+(1-delta)*k(-1);
#' a = rho*a(-1)+tau*b(-1) + e;
#' b = tau*a(-1)+rho*b(-1) + u;
#' end;
#' initval;
#' y = 1.08068253095672;
#' c = 0.80359242014163;
#' h = 0.29175631001732;
#' k = 11.08360443260358;
#' a = 0;
#' b = 0;
#' e = 0;
#' u = 0;
#' end;
#'
#' shocks;
#' var e; stderr 0.009;
#' var u; stderr 0.009;
#' var e, u = phi*0.009*0.009;
#' end;
#'
#' stoch_simul;'
#'
#' # This is "example1" of the `Dynare` example files executed in current working directory
#'
#' run_dynare(code=DynareCodes,model="example1",import_log=T)
#'
#' # import_log=T returns the `dynare` log file as a list of dataframes in an environment `dynare`,
#' which can be accessed using `dynare$example1`
#'
#' # This is "example1" of the `Dynare` example files executed in "DynareR/run_dynare"
#'
#' run_dynare(code=DynareCodes,model="DynareR/run_dynare/example1")
#'}
#' @family important functions
#' @keywords documentation
#' @export
run_dynare <- function(code,model,import_log=FALSE) {


  dynareFile=model %>%
    gsub("\\.mod$","",.) %>%
    paste0(".mod")

  write_mod(code,dynareFile)
  run_models(dynareFile,import_log = import_log)

  on.exit(unlink(dynareFile),add = T)

}






