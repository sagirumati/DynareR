#' Write a new `mod` file.
#'
#' Use `write_mod(code="someCode",model="someModel")` if you want the `Dynare` file to live in the current working directory.
#' Use `write_mod(code="someCode",model="someDirectory/someModel")` if you want the `Dynare` file to live in the path different from the current working directory (for example, `someDirectory`).
#'
#' @inheritParams run_dynare
#' @return Set of \code{Dynare} (open-source software for DSGE modelling) outputs
#' @examples library(DynareR)
#' \dontrun{
#' dynareCodes='var y, c, k, a, h, b;
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
#' # This writes "example1" of the `Dynare` example with mod extension
#'
#' write_mod(code=dynareCodes,model="example1")
#'
#' # This writes "example1" of the `Dynare` example with mod extension in "DynareR/write_mod" folder
#'
#' write_mod(code=dynareCodes,model="DynareR/write_mod/example1")
#'}
#' @family important functions
#' @keywords documentation
#' @export
write_mod <- function(code,model) {

  path=dirname(model)
  dir_create(path)
  model=basename(model)


  dynareFile=paste0(path,'/',model) %>%
    gsub("\\.mod","",.) %>%
    paste0(".mod")

  writeLines(code, dynareFile)
}



