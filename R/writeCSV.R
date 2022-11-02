#' Create CSV
#'
#' This function create CSV file with parameters
#'
#' @return file
#' @param tweetData fetched first dirty tweet data
#' @export
#' @examples
#' \dontrun{
#' writeToCSV()
#' }
#' @importFrom utils View news write.csv

writeToCSV <- function(tweetData){
  if (!is.null(tweetData)){
  message("Exporting data to CSV file..")
  fileBase <- createFolder()
  csvName <-
    paste(fileBase,format(Sys.time(), "%d-%m-%Y %H-%M-%S"),"-Data.csv",sep = "")

  toMatrix = matrix(unlist(tweetData), nrow=length(tweetData), byrow=TRUE)
  colnames(toMatrix) <- c("Tweets")
  csvData <- data.frame(toMatrix)
  write.csv(csvData,file=csvName, row.names = FALSE)
  cat(stringi::stri_pad_both(c('--CSV DATA--','Saved folder path :,',
                               fileBase,
                               'File name : ',
                               csvName,' '),
                             getOption('width')*0.9), sep='\n')
  View(csvData)
  } else {
    message("Data not found for CSV file !")
  }
}
