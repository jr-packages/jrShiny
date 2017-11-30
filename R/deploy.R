## So I don't forget how to deploy.
## Not of use to anyone else.
## Not exported
#' @importFrom drat addRepo
deploy = function(fname) {
  if(!file.exists(fname)) stop("File does not exist")
  drat::addRepo("rcourses")
  rsconnect::deployApp(fname,
                       account="csgillespie")
}

