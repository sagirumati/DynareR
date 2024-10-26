#' Include TeX file in R Markdown or Quarto document.
#'
#' Use this function to include TeX file in R Markdown or Quarto document.
#'
#' @param path Object or a character string representing the path to the `TeX` file
#' @param start Numeric. The start line(s) of the `TeX` file to include.
#' @param end Numeric. The last line(s) of the `TeX` file to include.
#' @return Set of \code{TeX} text
#' @family important functions
#' @examples library(DynareR)
#' \dontrun{
#'
#' input_tex("DynareR/TeXFolder/olsTable.tex")
#'}
#' @keywords documentation
#' @export
input_tex <- function(path,start=NA,end=NA) {

    # tex=basename(path) %>% gsub("\\.tex$","",.) %>% paste0(".tex")
    # path=paste0(dirname(path),'/',tex)

  if(!endsWith(path,".tex")) path=paste0(path,".tex") # Same as above code, add ".tex" if the path does not end with it


  if(!is.na(start) && is.na(end)) path=readLines(path) %>% .[start:length(.)]
  if(is.na(start) && !is.na(end)) path=readLines(path) %>% .[(1:end)]
  if(!is.na(start) && !is.na(end)) path=readLines(path) %>% .[start:end]
  if(is.na(start) && is.na(end)) path=readLines(path)
  asis_output(paste0("\\input{",path,"}"))
}
