.onLoad<-function(libname,pkgname){
  knitr::knit_engines$set(dynare=eng_dynare)
  set_dynare_version()
  set_octave_path()
}


system_exec=function(){
  octave_system_path=eval(expression(octave_system_path),envir = parent.frame())
  octaveFile=eval(expression(octaveFile),envir = parent.frame()) # Dynamic scoping
  system2(set_octave_path(octave_system_path),paste("--eval",shQuote(paste("run",octaveFile))))
}

unlink_eviews=function(){

  unlink(list.files(pattern=".~f1"))
  unlink(list.files(pattern=".~rg"))
  unlink(list.files(pattern="_Snapshots"),recursive = T,force = T)


  fileName=eval(expression(fileName), parent.frame())
  if(exists('table_name.csv',envir = parent.frame()))  table_name.csv=eval(expression(table_name.csv), parent.frame()) #for deleting table_name.csv in import_table function

  unlink(fileName)
  if(exists('table_name.csv',envir = parent.frame())) unlink(table_name.csv)
}
