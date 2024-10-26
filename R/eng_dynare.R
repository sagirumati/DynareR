#' DynareR: A Seamless Integration of R and Dynare
#'
#' The \code{dynare} engine can be activated via
#'
#' ```
#' knitr::knit_engines$set(dynare = DynareR::eng_dynare)
#' ```
#'
#' This will be set within an R Markdown document's setup chunk.
#'
#' @description This package runs on top of knitr to facilitate communication with Dynare. Run Dynare scripts from R Markdown document.
#' @usage eng_dynare(options)
#' @param options Chunk options, as provided by \code{knitr} during chunk execution. Chunk option for this is \code{dynare}
#' @return Set of \code{Dynare} (open-source software for DSGE modelling) codes
#' @author Sagiru Mati, ORCID: 0000-0003-1413-3974, https://smati.com.ng
#' * Yusuf Maitama Sule (Northwest) University Kano, Nigeria
#' * SMATI Academy
#' @examples knitr::knit_engines$set(dynare = DynareR::eng_dynare)
#' library(DynareR)
#' @references
#'
#' Mati S. 2020a. “DynareR: Bringing the Power of Dynare to R, R Markdown, and Quarto.” CRAN. https://CRAN.R-project.org/package=DynareR.
#'
#' Mati S. 2020b. EviewsR: A Seamless Integration of EViews and R. <https://CRAN.R-project.org/package=EviewsR>.
#'
#' Mati S. 2020c. gretlR: A Seamless Integration of Gretl and R. <https://CRAN.R-project.org/package=gretlR>.
#'
#' Mati S. 2023a. URooTab: Tabular Reporting of EViews Unit Root Tests. <https://CRAN.R-project.org/package=URooTab>.
#'
#' Mati S, Civcir I., and Abba S. I. 2023. “EviewsR: An r Package for Dynamic and Reproducible Research Using EViews, r, r Markdown and Quarto.” The R Journal 15 (2): 169–205. \doi{10.32614/rj-2023-045}.
#'
#' Bob Rudis (2015).Running Go language chunks in R Markdown (Rmd) files. Available at:  https://gist.github.com/hrbrmstr/9accf90e63d852337cb7
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
eng_dynare <- function(options) {
  model=options$label
  code=options$code
  if(options$eval) {
    run_dynare(code,model,import_log=T)
    }
}
