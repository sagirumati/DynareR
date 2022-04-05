library(DynareR)

# Ensure that "example1.mod","example2.mod","agtrend.mod"
# and "bkk.mod" live in the path.




run_models(c("example1","example2","agtrend","bkk"))

# You can create an absolute or relative path for the DynareR files.
# The following execute existing mod files in "DynareR/run_model/"  folder
# relative to the current path.




# You can run all models that live in particular path as follows

run_models(path="DynareR/run_models")



