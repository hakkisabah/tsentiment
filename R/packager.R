# packager
#' @export
# https://vbaliga.github.io/verify-that-r-packages-are-installed-and-loaded/
packager <-
  function(packages) {
    ## First specify the packages of interest

    ## If a package is installed, it will be loaded. If any
    ## are not, the missing package(s) will be
    ## from CRAN and then loaded.installed

    ## Now load or install&load all
    package.check <- lapply(
      packages,
      FUN = function(x) {
          library(x, character.only = TRUE)
      }
    )
  }

