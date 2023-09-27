#' Include TeX file in R Markdown or Quarto document.
#'
#' Use this function to include TeX file in R Markdown or Quarto document.
#'
#' @param path Object or a character string representing the path(s) to the `TeX` file
#' @param start Numeric. The start line of the `TeX` file to include.
#' @param end Numeric. The last line of the `TeX` file to include.
#' @return Set of \code{Tex} text
#' @family important functions
#' @examples library(DynareR)
#' \dontrun{
#'
#' input_tex("DynareR/TeXFolder/olsTable.tex")
#'}
#' @keywords documentation
#' @export

input_tex <- function(path=".",chunk="",tex="",start=NA,end=NA) {

  if(chunk!="" && tex!=""){
    tex=gsub("\\.tex$","",tex)
    tex1=paste0(tex,".tex")
    path=paste0('DynareR/',chunk,'/',tex1)
    }
if(path!=".") {
  path=gsub("\\.tex","",path)
  path=paste0(path,".tex")
}

  if(!is.na(start) && is.na(end)){
    path=readLines(path)
    path=path[start:length(path)]
    # newTex=basename(tempfile("newTex",".",".tex"))
    # writeLines(path,newTex)
    # path=newTex
    }


  if(is.na(start) && !is.na(end)){
    path=readLines(path)
    path=path[(1:end)]
    # newTex=basename(tempfile("newTex",".",".tex"))
    # writeLines(path,newTex)
    # path=newTex
  }


  if(!is.na(start) && !is.na(end)){
    path=readLines(path)
    path=path[start:end]
    # newTex=basename(tempfile("newTex",".",".tex"))
    # writeLines(path,newTex)
    # path=newTex
  }


if (!is.na(start) || !is.na(end)) asis_output(path) else asis_output(paste0("\\input{",path,"}"))
}
