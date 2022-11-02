#' Fetch Tweets
#'
#' This function prepare http information for fetching process and working together sub function
#'
#' @return list
#' @export

tweetFetcher <- function() {
  # https://github.com/twitterdev/Twitter-API-v2-sample-code/blob/master/Recent-Search/recent-search.r

  headers <-
    c(`Authorization` = sprintf('Bearer %s', APIinfo$BEARER_TOKEN))

  # word key is required for api query param key
  params = list(`word` = APIinfo$query)
  fetchInfo <-
    list("headers" = headers,
         params = params,
         url = APIinfo$url)

  return(fetchInfo)

}


# Twitter Recent Search Fetch
tweetFetcher.fetch <- function(returnedInfo) {
  message("Analysis started !")
  fetchedTweet <- getTweet(returnedInfo)
  textData <- NULL
  while (length(fetchedTweet$text) > 0) {
    if (!is.null(textData))
      textData <- append(textData, fetchedTweet$text)
    else
      textData <- fetchedTweet$text
    returnedInfo$params = fetchedTweet$nextParams
    fetchedTweet <- getTweet(returnedInfo)
  }
  if (!is.null(fetchedTweet$news)){
    message(news)
  }
  return(textData)
}
