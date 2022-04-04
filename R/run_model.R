#' Run a single \bold{existing} `mod` or `dyn` file.
#'
#' Use `run_model(model)` if the `Dynare` files live in the current working directory.
#' Use `run_model(model,path)` if the `Dynare` files live in the path different from the current working directory.
#'
#' @inheritParams run_dynare
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
#' model<-"example1" # This is "example1" of the `Dynare` example files
#' code<-DynareCodes
#' write_mod(model,code)
#' run_model(model)
#'
#'}
#' @seealso write_mod write_dynare eng_dynare run_dynare
#' @keywords documentation
run_model <- function(model,path="") {
  #model=paste0("DynareR_",model)
   if(path==""){
    if(!dir.exists(model)) dir.create(model)
    }else{
  if(!dir.exists(paste0(path,"/",model))) dir.create(paste0(path,"/",model))
}


if(path==""){
  if(file.exists(paste0(model, '.', "mod"))){
    file.copy(paste0(model, '.', "mod"),paste0(model,"/",model,'.', "mod"),overwrite = T)
  } else{
  file.copy(paste0(model, '.', "dyn"),paste0(model,"/",model,'.', "dyn"),overwrite = T)
    }
  }

if(path!=""){
if(file.exists(paste0(path,"/",model, '.', "mod"))){
  file.copy(paste0(path,"/",model, '.', "mod"),paste0(path,"/",model,"/",model,'.', "mod"),overwrite = T)
  dynareFile <-paste0(path,"/",model,"/",model, '.', "mod")
   } else{
    file.copy(paste0(path,"/",model, '.', "dyn"),paste0(path,"/",model,"/",model,'.', "dyn"),overwrite = T)
     dynareFile <-paste0(path,"/",model,"/",model, '.', "dyn")
   }
}


  # Creating a new path to run the mod or dyn files
if(path==""){
  new.path <-model
}else{
  new.path <-shQuote(paste0(path,"/",model))
}


  octaveFile<-basename(tempfile(model, '.',".m"))   # m is file extension of octave/matlab
 if (path==""){
   writeLines(c(dynare_version,paste0('cd ',model),sprintf("dynare %s",model)), octaveFile)
 }else{

   writeLines(c(dynare_version,paste0('cd ',new.path),sprintf("dynare %s",model)), octaveFile)

 }
   on.exit(unlink(octaveFile),add = T)
system_exec()
}

