% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/import_log.R
\name{import_log}
\alias{import_log}
\title{Import log as R variables}
\usage{
import_log(model = "", path = ".")
}
\arguments{
\item{model}{Object or a character string representing the name of the model excluding \code{.mod} or \code{.dyn} file extension}

\item{path}{Object or a character string representing the path to the folder for the \code{Dynare} file. The current working directory is the default \code{path}. Specify the \code{path} only if the \code{Dynare} files live in different path from the current working directory.}
}
\value{
Set of \code{Dynare} (open-source software for DSGE modelling) outputs
}
\description{
Use \code{write_dyn(model,code)}  if you want the \code{Dynare} file to live in the current working directory.
Use \code{write_dyn(model,code,path)}  if you want the \code{Dynare} file to live in the path different from the current working directory.
}
\examples{
library(DynareR)
\dontrun{
import_log(b)
}
}
\seealso{
Other important functions: 
\code{\link{add_path}()},
\code{\link{eng_dynare}()},
\code{\link{include_IRF}()},
\code{\link{run_dynare}()},
\code{\link{run_models}()},
\code{\link{set_dynare_version}()},
\code{\link{set_octave_path}()},
\code{\link{write_dyn}()},
\code{\link{write_mod}()}
}
\concept{important functions}
\keyword{documentation}