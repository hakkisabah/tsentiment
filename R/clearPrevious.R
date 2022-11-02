#' Help for delete save files folder
#'
#' @return Void
#' @export
clearPrevious <- function(){
  unlink(paste(tools::R_user_dir("tsentiment"),'/results',sep=''),recursive = TRUE)
}
