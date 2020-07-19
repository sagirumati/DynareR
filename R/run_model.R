#' Run a single \bold{existing} `mod` or `dyn` file.
#'
#' Use `run_model(file)` if the `Dynare` files live in the current working directory.
#' Use `run_model(file,path)` if the `Dynare` files live in the path different from the current working directory.
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
#' file<-"example1" # This is "example1" of the `Dynare` example files
#' code<-DynareCodes
#' write_mod(file,code)
#' run_model(file)
#'
#'}
#' @seealso write_mod write_dynare eng_dynare run_dynare
#' @keywords documentation
#' @export
run_model <- function(file,path="") {
  #file=paste0("DynareR_",file)
   if(path==""){
    if(!dir.exists(file)) dir.create(file)
    }else{
  if(!dir.exists(paste0(path,"/",file))) dir.create(paste0(path,"/",file))
}


if(path==""){
  if(file.exists(paste0(file, '.', "mod"))){
    file.copy(paste0(file, '.', "mod"),paste0(file,"/",file,'.', "mod"),overwrite = T)
  } else{
  file.copy(paste0(file, '.', "dyn"),paste0(file,"/",file,'.', "dyn"),overwrite = T)
    }
  }

if(path!=""){
if(file.exists(paste0(path,"/",file, '.', "mod"))){
  file.copy(paste0(path,"/",file, '.', "mod"),paste0(path,"/",file,"/",file,'.', "mod"),overwrite = T)
  f <-paste0(path,"/",file,"/",file, '.', "mod")
   } else{
    file.copy(paste0(path,"/",file, '.', "dyn"),paste0(path,"/",file,"/",file,'.', "dyn"),overwrite = T)
   f <-paste0(path,"/",file,"/",file, '.', "dyn")
   }
}


  # Creating a new path to run the mod or dyn files
if(path==""){
  new.path <-file
}else{
  new.path <-shQuote(paste0(path,"/",file))
}


  m<-basename(tempfile(file, '.',paste(".", "m", sep = '')))   # m is file extension of octave/matlab
 if (path==""){
   writeLines(c("addpath C:/dynare/4.6.1/matlab",paste('cd',' ',file, sep = ''),sprintf("dynare %s",file)), m)
 }else{

   writeLines(c("addpath C:/dynare/4.6.1/matlab",paste('cd',' ',new.path, sep = ''),sprintf("dynare %s",file)), m)

 }
   on.exit(unlink(m))

shell(paste("octave --eval",shQuote(sprintf("run %s",m))))
}

