\name{eng_dynare}
\alias{eng_dynare}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
DynareR: A Seamless Integration of R and Dynare
}
\description{
This package runs on top of knitr to facilitate communication with Dynare. Run Dynare scripts from R Markdown document.
}
\usage{
eng_dynare(options)
}
\arguments{
\item{options}{Chunk options, as provided by \code{knitr} during chunk execution. Chunk option for this is \code{dynare}}
}
\value{
Set of \code{Dynare} (open-source software for DSGE modelling) codes
}
\details{
The \code{dynare} can be activated via \preformatted{knitr::knit_engines$set(dynare = DynareR::eng_dynare)
}

This will be set within an R Markdown document's setup chunk.
}
%- maybe also 'usage' for other objects documented here.

\author{
*Sagiru Mati, ORCID: 0000-0003-1413-3974, https://smati.com.ng

* Yusuf Maitama Sule (Northwest) University Kano, Nigeria

* SMATI Academy
}


%% ~Make other sections like Warning with \section{Warning }{....} ~

\examples{
knitr::knit_engines$set(dynare = DynareR::eng_dynare)
library(DynareR)
}

\references{
Bob Rudis (2015).Running Go language chunks in R Markdown (Rmd) files. Available at:  https://gist.github.com/hrbrmstr/9accf90e63d852337cb7
Yihui Xie (2019). knitr: A General-Purpose Package for Dynamic Report Generation in R. R package version 1.24.

Yihui Xie (2015) Dynamic Documents with R and knitr. 2nd edition. Chapman and Hall/CRC. ISBN 978-1498716963

Yihui Xie (2014) knitr: A Comprehensive Tool for Reproducible Research in R. In Victoria Stodden, Friedrich Leisch and Roger D. Peng, editors, Implementing Reproducible Computational Research. Chapman and Hall/CRC. ISBN 978-1466561595
}

\keyword{documentation}% use one of  RShowDoc("KEYWORDS")

