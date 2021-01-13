move_files = function(chapter, dest) {
  ## Create chapter directory
  chapter = paste0("chapter", chapter)
  dir.create(file.path(dest, chapter), showWarnings = FALSE)
  path = system.file(chapter, package = "jrShiny")
  fnames = list.files(path, full.names = TRUE)
  file.copy(fnames, file.path(dest, chapter))

}


#' Copy files from package to script
#'
#' A simple function for copying package files to users directory.
#' @export
create_project = function() {
  ## copy build an app
  path_bap = system.file("build_an_app", package = "jrShiny")
  file.copy(path_bap, ".", recursive = TRUE)
  ## copy soultions
  path_solutions = system.file("solutions", package = "jrShiny")
  file.copy(path_solutions, to = ".", recursive = TRUE)
  ## copy exercises
  path_exercises = system.file("exercises", package = "jrShiny")
  file.copy(path_exercises, to = ".", recursive = TRUE)
  ## copy exercises into original
  folders_to_original = list.files(path_exercises, full.names = TRUE)
  dir.create("original")
  file.copy(folders_to_original, "original", recursive = TRUE)
}
