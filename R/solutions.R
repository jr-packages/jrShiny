#' Open a solution
#'
#' \code{solution} opens a solution file in your RStudio scripts pane and saves a copy of the file in your working directory.
#'
#' @param number The number of solution to open. Solution numbers are paired with exercises.
#' @return NULL 
#'
#' @details Heavily based on the code in the \code{reportsWS} package.
#' @seealso \code{\link{exercise}}
#' @export
solution = function(number = 1) {
  if (!(number %in% 1:20)) stop("Unrecognized solution number")
  
  filename = paste0("exercise", number, ".Rmd")
  
  path = system.file("solutions", filename, package = "nclRexercises")
  newpath = file.path(getwd(), filename)
  file.copy(path, newpath, copy.mode = FALSE)
  file.edit(newpath)
}