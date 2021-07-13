#' Check r Version
#'
#' This function checking using current R version
#'
#' @return boolean
#' @export
#' @examples
#' checkVersionForSentiment()

checkVersionForSentiment <- function() {
  currentVersion <- R.version
  if ((currentVersion$major < 4 && currentVersion$major != 4) == TRUE) {
    message("Required R version 4.0.5 or above")
    message("Please update your R environment")
    return(NULL)
  }else{
    return(TRUE)
  }
}
