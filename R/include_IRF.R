#' Embed the graphs Impulse Response Function (IRF) in R Markdown document
#'
#' Use this function to include \code{Dynare} IRF into the R Markdown document
#'
#' @usage include_IRF(model="",IRF="",path="")
#' @param IRF A character string for the name of the Impulse Response Function as defined in the `Dynare` codes.
#' @inheritParams run_dynare
#' @return Set of \code{Dynare} (open-source software for DSGE modelling) outputs
#' @author Sagiru Mati, ORCID: 0000-0003-1413-3974, https://smati.com.ng
#' * Yusuf Maitama Sule (Northwest) University Kano, Nigeria
#' * SMATI Academy
#' @examples
#' \dontrun{
#' library(DynareR)
#' # include_IRF(model="BKK",IRF="E_H2",path=".")
#'}# The above code fetches the IRF graph from "BKK/BKK/graphs/BKK_IRF_E_H2.pdf"
#' @references Bob Rudis (2015).Running Go language chunks in R Markdown (Rmd) files. Available at:  https://gist.github.com/hrbrmstr/9accf90e63d852337cb7
#'
#' Yihui Xie (2019). knitr: A General-Purpose Package for Dynamic Report Generation in R. R package version 1.24.
#'
#' Yihui Xie (2015) Dynamic Documents with R and knitr. 2nd edition. Chapman and Hall/CRC. ISBN 978-1498716963
#'
#' Yihui Xie (2014) knitr: A Comprehensive Tool for Reproducible Research in R. In Victoria Stodden, Friedrich Leisch and Roger D. Peng, editors, Implementing Reproducible Computational Research. Chapman and Hall/CRC. ISBN 978-1466561595
#'
#' @family important functions
#' @keywords documentation
#' @export
include_IRF <- function(model="",IRF="",path=".") {
    IRFPath=paste0(path,"/",model,"/",model,"/","graphs/",model,"_IRF_",IRF,".pdf")
    # if(!exists(IRFPath)) IRFPath=paste0(path,"/",model,"/",model,"/","graphs/",model,"_IRF_",IRF,".eps")
    # if(!exists(IRFPath)) IRFPath=paste0(path,"/",model,"/",model,"/",model,"/","graphs/",model,"_IRF_",IRF,".pdf")
    # if(!exists(IRFPath)) IRFPath=paste0(path,"/",model,"/",model,"/",model,"/","graphs/",model,"_IRF_",IRF,".eps")
    IRFPath=gsub("^\\./","",IRFPath)
    include_graphics(IRFPath)
}

