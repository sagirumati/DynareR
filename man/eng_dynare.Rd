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
\references{
Bob Rudis (2015).Running Go language chunks in R Markdown (Rmd) files. Available at:  https://gist.github.com/hrbrmstr/9accf90e63d852337cb7
Yihui Xie (2019). knitr: A General-Purpose Package for Dynamic Report Generation in R. R package version 1.24.

Yihui Xie (2015) Dynamic Documents with R and knitr. 2nd edition. Chapman and Hall/CRC. ISBN 978-1498716963

Yihui Xie (2014) knitr: A Comprehensive Tool for Reproducible Research in R. In Victoria Stodden, Friedrich Leisch and Roger D. Peng, editors, Implementing Reproducible Computational Research. Chapman and Hall/CRC. ISBN 978-1466561595
}
\author{
*Sagiru Mati, ORCID: 0000-0003-1413-3974, https://smati.com.ng

* Yusuf Maitama Sule (Northwest) University Kano, Nigeria

* SMATI Academy
}


%% ~Make other sections like Warning with \section{Warning }{....} ~

\examples{
knitr::knit_engines$set(dynare = DynareR::eng_dynare)
\dontrun{

library(DynareR)

# Copy and paste the following chunk (adopted from Dynare example file BKK) in R Markdown document

```{dynare example1,eval=T,echo=F,comment=NULL}
var y, c, k, a, h, b;
varexo e, u;

parameters beta, rho, alpha, delta, theta, psi, tau;

alpha = 0.36;
rho   = 0.95;
tau   = 0.025;
beta  = 0.99;
delta = 0.025;
psi   = 0;
theta = 2.95;

phi   = 0.1;

model;
c*theta*h^(1+psi)=(1-alpha)*y;
k = beta*(((exp(b)*c)/(exp(b(+1))*c(+1)))
    *(exp(b(+1))*alpha*y(+1)+(1-delta)*k));
y = exp(a)*(k(-1)^alpha)*(h^(1-alpha));
k = exp(b)*(y-c)+(1-delta)*k(-1);
a = rho*a(-1)+tau*b(-1) + e;
b = tau*a(-1)+rho*b(-1) + u;
end;

initval;
y = 1.08068253095672;
c = 0.80359242014163;
h = 0.29175631001732;
k = 11.08360443260358;
a = 0;
b = 0;
e = 0;
u = 0;
end;

shocks;
var e; stderr 0.009;
var u; stderr 0.009;
var e, u = phi*0.009*0.009;
end;

stoch_simul;
```

}
}

\keyword{documentation}% use one of  RShowDoc("KEYWORDS")

