#' Folder creator
#'
#' This function create a folder in project path
#'
#' @return String
#' @export

# https://stackoverflow.com/questions/4216753/check-existence-of-directory-and-create-if-doesnt-exist
# We need results directory and if exist warning false

createFolder <- function(){
  documentsBase <- tools::R_user_dir("tsentiment")
  path = paste(documentsBase,"/","results","/",sep = "")
  dir.create(file.path(path), recursive = TRUE, showWarnings = FALSE)
  return(path)
}
