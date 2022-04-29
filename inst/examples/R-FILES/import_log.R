library(DynareR)

demo(bkk)

import_log(model="bkk")

# Alternatively, use the path to the log file

import_log(path="bkk/bkk.log")

# Access the mported list

dynare$bkk

dynare$bkk$moments

knitr::kable(dynare$bkk$decomposition,format='pandoc')
