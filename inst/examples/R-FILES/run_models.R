# This file should be the last to execute

library(DynareR)

# Copy the dynare files to the current working directory

lapply(c("agtrend","BKK","example1"),\(x) file.copy(paste0("DynareR/run_dynare/",x,"/",x,".mod"),"."))

run_models(c("agtrend","BKK","example1")) # This should be executed after running "agtrend.R", "BKK.R" and "example1.R" models

run_models() # Run all models in Current Working Directory.

# Copy the dynare files to the 'run_dynare' directory

lapply(c("agtrend","BKK","example1"),\(x) file.copy(paste0("DynareR/run_dynare/",x,"/",x,".mod"),"run_dynare"))

run_models("run_dynare*") # Run all models in 'DynareR/run_models' folder

