#' Folder creator
#'
#' This function create a folder in project path
#'
#' @return String
#' @export
#' @examples
#' createFolder()

# https://stackoverflow.com/questions/4216753/check-existence-of-directory-and-create-if-doesnt-exist
# We need results directory and if exist warning false

createFolder <- function(){
  documentsBase = Sys.getenv("R_USER")
  path = paste(documentsBase,"/","results","/",sep = "")
  dir.create(file.path(path), recursive = TRUE, showWarnings = FALSE)
  return(path)
}
