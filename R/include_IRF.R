#' Embed the graphs Impulse Response Function (IRF) in R Markdown document
#'
#' Use this function to include \code{Dynare} IRF into the R Markdown document
#'
#' @param IRF A character string for the name of the Impulse Response Function as defined in the `Dynare` codes.
#' @param path A character string for the path to the IRF graph.
#' @inheritParams run_dynare
#' @return Set of \code{Dynare} (open-source software for DSGE modelling) outputs
#' @author [Sagiru Mati](https://smati.com.ng), [ORCID: 0000-0003-1413-3974](https://orcid.org/0000-0003-1413-3974)
#' * Yusuf Maitama Sule (Northwest) University Kano, Nigeria
#' * SMATI Academy
#' @examples
#' \dontrun{
#' library(DynareR)
#'
#' demo(bkk)
#'
#' include_IRF(model="bkk",IRF="E_H2")
#'
#' # The above code fetches the IRF graph from "bkk/bkk/graphs/bkk_IRF_E_H2.pdf"
#'
#' # Alternatively, the `path` argument can be used as follows
#'
#' include_IRF(path="bkk/bkk/graphs/bkk_IRF_E_H2.pdf")
#'}
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
include_IRF <- function(path=".",model="",IRF="") {

  if(path!=".") IRFPath=path

  if(path=="." && model!="" && IRF!="") IRFPath=paste0(model,"/",model,"/","graphs/",model,"_IRF_",IRF,".pdf")

  include_graphics(IRFPath)
}

