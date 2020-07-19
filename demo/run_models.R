# It is recommended to enclose your codes within a single quote.

FileName<-c("example1","example2","agtrend","bkk")

library(DynareR)


file<-FileName
code<-DynareCodes
run_models(file)

# You can create an absolute or relative path for the DynareR files.
# The following execute existing mod file in "DynareR/run_model/"  folder
# relative to the current path.


path="DynareR/run_models"

if(!dir.exists(path)) dir.create(path,recursive = T)

run_models(file,path)



