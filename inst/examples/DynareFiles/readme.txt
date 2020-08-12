This a development version of DynareR, an R package created by
Dr. Sagiru Mati to run Dynare files/


Please note that Dynare 4.6.1 and Octave 5.2.0 have to be installed on your system



The folder "Dynare_files" contains Dynare example files


STEPS to run the Dynare files


1) If R package "devtools" is not installed on your system
please install it using the following R code

install.packages("devtools",repos = "http://cran.rstudio.com")


2) If DynareR package is not installed on your R, please install it
using the following codes

devtools::install_github("sagirumati/DynareR")


3) Please load the DynareR package in R using the following code

library(DynareR)

4) Please enusre that the "current working directory" is "Dynare_files" folder.


5) Please run a single model using the following code:

run_models("example1")

6) Please run multiple models using the following code

run_models(c("agtrend","example1","bkk","example2"))

7) If the files live in different folder from the R "current working directory",
please provide the folder as follows:

path="path/to/the/Dynare_files"

Then use the following codes to run the models:

run_models("example1",path) to run a single Dynare model

run_models(c("agtrend","example1","bkk","example2"),path) to run multiple Dynare models




The outputs of each model (example1, bkk, agtrend etc) will be saved in a new folder with the model's name 
created in the current working directory (Dynare_files).
