#' Start analysis after defined Twitter API information
#'
#' This function prepare API information and start analysis
#'
#' @return void
#' @export
#' @examples
#' getBarSentiment()


getAnalysis <- function(){

  if (is.environment(APIinfo)){

    # tweetFetcher

    # Setup Twitter API Informations
    setupFetch <- tweetFetcher()
    message("Analysis started !")

    # Send request for tweet content
    fetchedTweet <- tweetFetcher.fetch(setupFetch)

    if (!is.null(fetchedTweet)) {
      cleanedDocs <- cleanFetchedTweet(fetchedTweet)

      # create tweet sentiments
      getCloudSentiment(cleanedDocs)

      getBarSentiment(cleanedDocs)
    }else{
      warning("Tweet fetch error!")
    }

  }else{
    warning("First of use setAccount function correctly")
  }
}
