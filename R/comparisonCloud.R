utils::globalVariables(names = c("sentiment","png","dev.off"),package = "tsentiment")
#' Export word cloud
#'
#' This function export a word cloud with analysed data
#'
#' @return file
#' @export
#' @param text Cleaned tweet data
#' @importFrom wordcloud comparison.cloud
#' @importFrom reshape2 acast
#' @importFrom dplyr count inner_join
#' @importFrom tidytext get_sentiments
#' @importFrom graphics strwidth


getCloudSentiment <- function(text) {
  # Create now the cloud: a pair of warnings, because you do not have negative words and it is joining by word(correct)

  imageBase <- createFolder()

  pngName <-
    paste(imageBase,format(Sys.time(), "%d-%m-%Y %H-%M-%S"),"-AnalysedComparisonCloud.png",sep = "")

  png(pngName, width = 480, height = 480,units = "px", pointsize = 12)

  joinedWord <-  text %>%
    inner_join(get_sentiments("bing"))
  countedWord <- count(joinedWord, sentiment, sort = TRUE)
  if (nrow(countedWord) > 1){
  ready <- joinedWord %>%
    count(word, sentiment, sort = TRUE) %>%
    acast(word ~ sentiment, value.var = "n", fill = 0) %>%
    comparison.cloud(
      colors = c("gray80", "gray20"),
      max.words = 1000,
      title.size = 3,
      random.order = FALSE,
      match.colors = TRUE
    )

  dev.off()
  cat(stringi::stri_pad_both(c('--Comparison Cloud--','Saved folder path :,',
                               imageBase,
                               'File name : ',
                               pngName,' '),
                             getOption('width')*0.9), sep='\n')
  } else {
    cat(stringi::stri_pad_both(c('--Comparison Cloud--','no words to compare',' '),
                               getOption('width')*0.9), sep='\n')
  }
}
