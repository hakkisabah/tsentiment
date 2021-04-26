# Get Analysis from Twitter
#' @export
#' 
#' 

# source("R/tweetFetcher.R")
# source("R/twitterDataCleaner.R")
# source("R/comparisonCloud.R")
# source("R/barPlot.R")

getAnalysis <- function(){
  
  # tweetFetcher
  
  # Setup Twitter API Informations
  setupFetch <- tweetFetcher(APIinfo)
  message("Analysis started !")
  
  # Send request for tweet content
  fetchedTweet <- tweetFetcher.fetch(setupFetch)
  
  if (!is.null(fetchedTweet)) {
    cleanedDocs <- cleanFetchedTweet(fetchedTweet)
    
    # create tweet sentiments
    getCloudSentiment(cleanedDocs)
    
    getBarSentiment(cleanedDocs)
  }
  
}