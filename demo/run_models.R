
library(DynareR)

# This file should be the last to execute

library(DynareR)

# Copy the dynare files to the current working directory

demo(agtrend)
demo(bkk)
demo(example1)

lapply(c("agtrend","bkk","example1"),\(x) file.copy(paste0("DynareR/run_dynare/",x,"/",x,".mod"),"."))

run_models(c("agtrend","bkk","example1")) # This should be executed after running the demo or after running "agtrend.R", "bkk.R" and "example1.R" models

run_models() # Run all models in Current Working Directory.

# Copy the dynare files to the 'DynareR/run_dynare' directory

lapply(c("agtrend","bkk","example1"),\(x) file.copy(paste0(x,".mod"),"DynareR/run_dynare"))

run_models("DynareR/run_dynare*") # Run all models in 'DynareR/run_dynare' folder


