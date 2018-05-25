#' Open an exercise
#'
#' \code{exercise} opens an exercise file in your RStudio scripts pane and 
#' saves a copy of the file in your working directory.
#' 
#' @details Heavily based on the code in the reportsWS package.
#'
#' @param chapter The chapter
#' @param fname The filename
#' @return NULL 
#' @importFrom utils file.edit
#' @import ggplot2movies
#' @export
exercise = function(chapter, fname) {
  dir = paste0("chapter", chapter)

  path = system.file(dir, fname, package = "jrShiny")
  newpath = file.path(getwd(), fname)
  file.copy(path, newpath, copy.mode = FALSE)
  file.edit(newpath)
  
}