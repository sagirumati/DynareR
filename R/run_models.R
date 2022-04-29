#' Run multiple \bold{existing} `mod` or `dyn` files.
#'
#' Use this function to execute multiple \bold{existing} \code{Dynare} files.
#' Use `run_models(model='someModel')`  if the Dynare files live in the current working directory.
#' Use `run_models(model='someDirectory/someModel')`  if the Dynare files live in the path different from the current working directory (for example, `someDirectory`).
#'
#' @param model Object or a  vector of character strings representing the names of the \code{Dynare} model files excluding `.mod` or `.dyn` file extension
#' @inheritParams run_dynare
#' @return Set of \code{Dynare} (open-source software for DSGE modelling) outputs
#' @examples library(DynareR)
#'
#' \dontrun{
#' demo(agtrend)
#' demo(bkk)
#' demo(example1)
#'
#' # Provide the list of the `Dynare` files in a vector
#' # Ensure that "agtrend.mod", "bkk.mod" and "example1.mod"
#' # live in the current working directory
#'
#' # Copy the dynare files to the current working directory
#'
#' lapply(c("agtrend","bkk","example1"),\(x) file.copy(paste0(x,"/",x,".mod"),"."))
#'
#' run_models(c("agtrend","bkk","example1")) # Run the models in the vector.
#'
#' run_models() # Run all models in Current Working Directory.
#'
#' # You can run all models that live in "DynareR/run_dynare/" folder
#'
#' # Copy the dynare files to the 'DynareR/run_dynare' directory
#'
#' lapply(c("agtrend","bkk","example1"),\(x) file.copy(paste0(x,".mod"),"DynareR/run_dynare"))
#'
#' run_models("DynareR/run_dynare*") # Note the * at the end.
#'}
#' @family important functions
#' @keywords documentation
#' @export
run_models=function(model="*",import_log=FALSE){

 if (length(model)==1 && endsWith(model,"*")) {
   modelDir=gsub("\\*","",model)
   if(modelDir=="") modelDir="."

    model=list.files(path = modelDir,pattern = "(\\.mod|\\.dyn)$") %>%
     gsub("(\\.mod|\\.dyn)$","",.) %>% unique()

    if(length(model)==0) stop(paste0("Dynare mod/dyn files are not available in '",normalizePath(modelDir),"'"))

    if(modelDir!=".") model= paste0(modelDir,'/',model)
 }


    for(i in model)  run_model(i,import_log=import_log)
}

