#' Fetch Tweets
#'
#' This function prepare http information for fetching process and working together sub functin
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
  # https://stackoverflow.com/questions/12193779/how-to-write-trycatch-in-r
  text = NULL
  pb <- NULL
  #scanned start 1 because also fetchedTweet variable have a fetched tweet
  scanned <- 1
  fetchedTweet <- getTweet(returnedInfo)
  isRate = fetchedTweet$remainingRateLimit
  isRemain = if (is.numeric(isRate)) isRate else 1

  if (is.numeric(isRate)){
    # isRemain + 1 give correct percent information, because fetching one before start progress bar
    pb = progress::progress_bar$new(format = "[:bar] :current/:total (:percent)", total = isRemain + 1)
  }
  if (!is.null(pb)){
    # loop condition order is important, first of every time check fetchedTweet
    while(!is.null(fetchedTweet) && scanned <= isRemain){
      scanned = scanned + 1
      text <- if (!is.null(text))
        paste(text, fetchedTweet$text)
      else
        fetchedTweet$text
      returnedInfo$params = fetchedTweet$nextParams
      fetchedTweet <- getTweet(returnedInfo)
      pb$tick()
      Sys.sleep(1 / isRate)
    }
    # need completed %100 percent
    pb$tick(isRemain + 1)
    Sys.sleep(1 / isRate)
    message(paste("\nScaning result :",scanned,"page scanned !"))
    return(text)
  }else{
      return(NULL)
  }
}
