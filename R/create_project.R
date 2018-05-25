move_files = function(chapter, dest) {
  ## Create chapter directory
  chapter = paste0("chapter", chapter)
  dir.create(file.path(dest, chapter), showWarnings = FALSE)
  path = system.file(chapter, package = "jrShiny")
  fnames = list.files(path, full.names = TRUE)
  file.copy(fnames,file.path(dest, chapter))
  
  ## Copy vignette
  path = system.file("doc", package = "jrShiny")
  file.copy(file.path(path, paste0(chapter, ".Rmd")), dest)
  
}


#' Copy files from package to script
#' 
#' A simple function for copying package files to users directory.
#' @export
create_project = function() {
  dir.create("original", showWarnings = FALSE)
  dir.create("exercises", showWarnings = FALSE)
  move_files(chapter = 1, dest="original") 
  move_files(1, dest="exercises") 

  move_files(3, dest = "original") 
  move_files(3, dest = "exercises") 
  move_files(4, dest = "original") 
  move_files(4, dest = "exercises") 
  
  move_files(5, dest = "original") 
  move_files(5, dest = "exercises") 
}