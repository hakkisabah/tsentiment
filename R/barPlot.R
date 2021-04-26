# https://levelup.gitconnected.com/sentiment-analysis-with-twitter-hashtags-in-r-af02655f2113
#' @export
getBarSentiment <- function(tweet){



  tweet_sentiment <- get_nrc_sentiment(as.character(tweet))

  tweet_sentiment_score <- data.frame(colSums(tweet_sentiment[,]))

  names(tweet_sentiment_score)<- "Score"

  tweet_sentiment_score <- cbind("sentiment"=rownames(tweet_sentiment_score),tweet_sentiment_score)

  rownames(tweet_sentiment_score)<- NULL


  plotted <- ggplot(data = tweet_sentiment_score, aes(x = sentiment, y = Score)) + geom_bar(aes(fill =
                                                                                                    sentiment), stat = "identity") +
    theme(legend.position = "none") +
    xlab("sentiments") + ylab("scores")

  pngName <-
    paste(getwd(),"results/",format(Sys.time(), "%d-%b-%Y %H-%M-%S"),"-AnalysedBarPlot.png",sep = "")

  png(pngName)

  # https://www.datanovia.com/en/blog/how-to-save-a-ggplot/#:~:text=You%20can%20either%20print%20directly,graphics%20device%20from%20the%20extension.
  print(plotted)

  dev.off()
  message(paste("on",getwd(),"location"))
  message(paste(pngName, "file created!"))

}
