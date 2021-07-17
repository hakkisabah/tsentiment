#' User file permission checker
#'
#' @return String
#' @export
#' @examples
#' \dontrun{
#' checkConfirmForUser()
#' }

checkConfirmForUSer <- function() {
  if (exists("fileConfirmation")) {
    if (fileConfirmation != 'y') {
      fileConfirmation <- fileConfirmation
      isConfirm <- questionOfPermission()
      isPermission = checkPermission(isConfirm)
      fileConfirmation <<- isPermission
      return(isPermission)
    } else{
      fileConfirmation <<- "y"
      return(fileConfirmation)
    }
  } else{
    isConfirm <- questionOfPermission()
    isPermission = checkPermission(isConfirm)
    return(isPermission)
  }
}

checkPermission <- function(isConfirm) {
  fileConfirmation <- "n"
  if (tolower(isConfirm) != 'y') {
    fileConfirmation <<- isConfirm
    return(isConfirm)
  } else{
    fileConfirmation <<- isConfirm
    return(isConfirm)
  }
}

questionOfPermission <- function() {
  documentsBase <- tools::R_user_dir("tsentiment")
  path = paste(documentsBase, "/", "results", "/", sep = "")
  cat("The tsentiment package will save the analysis results visually and in png format to the",
      paste(path," path.",sep=""),
      "Your approval is required for these transactions",
      "Please enter using the y/n key",
      fill = 10)
  user_input <- readline("Answer : ")
  return(user_input)
}
