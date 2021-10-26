#' Start analysis after defined Twitter API information
#'
#' This function prepare API information and start analysis
#'
#' @return file
#' @export
#' @examples
#' \dontrun{
#' getBarSentiment()
#' }


getAnalysis <- function(){

  if (is.environment(APIinfo) &&
      length(APIinfo$BEARER_TOKEN) > 0 &&
      APIinfo$fileConfirmation == 'y'){

    # tweetFetcher

    # Setup Twitter API Informations
    setupFetch <- tweetFetcher()

    # Send request for tweet content
    fetchedTweet <- tweetFetcher.fetch(setupFetch)

    if (!is.null(fetchedTweet)) {
      cleanedDocs <- cleanFetchedTweet(fetchedTweet)

      #clear previous results

      clearPrevious()

      # create tweet sentiments
      getCloudSentiment(cleanedDocs)

      getBarSentiment(cleanedDocs)
    }

  }else{
    warning("First of use setAccount function correctly")
  }
}
