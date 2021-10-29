utils::globalVariables(names = c("sentiment","Score","png","dev.off"),package = "tsentiment")
#' Export bar plot
#'
#' This function export a bar plot with analysed data
#'
#' @return file
#' @export
#' @param tweet Cleaned tweet data
#' @importFrom syuzhet get_nrc_sentiment
#' @importFrom ggplot2 ggplot aes geom_bar theme xlab ylab
#' @importFrom graphics strwidth

# https://levelup.gitconnected.com/sentiment-analysis-with-twitter-hashtags-in-r-af02655f2113
getBarSentiment <- function(tweet = NULL){

  if (!is.null(tweet)){

    tweet_sentiment <- get_nrc_sentiment(as.character(tweet))

    tweet_sentiment_score <- data.frame(colSums(tweet_sentiment[,]))

    names(tweet_sentiment_score)<- "Score"

    tweet_sentiment_score <- cbind("sentiment"=rownames(tweet_sentiment_score),tweet_sentiment_score)

    rownames(tweet_sentiment_score)<- NULL

    plotted <- ggplot(data = tweet_sentiment_score, aes(x = sentiment, y = Score)) + geom_bar(aes(fill =
                                                                                                    sentiment), stat = "identity") +
      theme(legend.position = "none") +
      xlab("sentiments") + ylab("scores")

    imageBase <- createFolder()

    pngName <-
      paste(imageBase,format(Sys.time(), "%d-%b-%Y %H-%M-%S"),"-AnalysedBarPlot.png",sep = "")

    png(pngName)

    # https://www.datanovia.com/en/blog/how-to-save-a-ggplot/#:~:text=You%20can%20either%20print%20directly,graphics%20device%20from%20the%20extension.
    print(plotted)

    dev.off()
    cat(stringi::stri_pad_both(c('--Bar Plot--','Saved folder path :,',
                                 imageBase,
                                 'File name : ',
                                 pngName),
                               getOption('width')*0.9), sep='\n')
  }else{
    warning("Bar plot not created because tweet param do not exist")
  }

}
