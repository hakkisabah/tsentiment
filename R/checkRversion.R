# check R version
#' @export
version <- R.version

checkVersionForSentiment <- function() {
  if ((version$major < 4 && version$major != 4) == TRUE) {
    message("Required R version 4.0.5 or above")
    message("Please update your R environment")
    return(NULL)
  }else{
    return(TRUE)
  }
}
