#' User file permission checker
#'
#' @return String
#' @export
#' @examples
#' \dontrun{
#' checkConfirmForUser()
#' }

checkConfirmForUSer <- function() {
  if (length(APIinfo$fileConfirmation) > 0) {
    if (APIinfo$fileConfirmation != 'y') {
      isConfirm <- questionOfPermission()
      isPermission = checkPermission(isConfirm)
      return(isPermission)
    } else{
      return(APIinfo$fileConfirmation)
    }
  } else{
    isConfirm <- questionOfPermission()
    isPermission = checkPermission(isConfirm)
    return(isPermission)
  }
}

checkPermission <- function(isConfirm) {
  if (tolower(isConfirm) != 'y') {
    return(isConfirm)
  } else{
    APIinfo$fileConfirmation = isConfirm
    return(isConfirm)
  }
}

questionOfPermission <- function() {
  documentsBase <- tools::R_user_dir("tsentiment")
  path = paste(documentsBase, "/", "results", "/", sep = "")
  #https://rdrr.io/cran/stringi/man/stri_pad.html
  cat(stringi::stri_pad_both(c('The tsentiment package will save the analysis results in png and csv format to the',
                      paste(path," path.",sep=""),
                      'Your approval is required for these transactions',
                      'Please enter using the y/n key'),
                    getOption('width')*0.9), sep='\n')
  user_input <- readline("Answer : ")
  return(user_input)
}
