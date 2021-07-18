#' Fetch Tweets
#'
#' This function prepare http information for fetching process and working together sub functin
#'
#' @return list
#' @export
#' @usage APIinfo
#' @param  APIinfo is environment
#' @examples
#' APIinfo <- list(BEARER_TOKEN = "token",query = "love",page = 100)
#' tweetFetcher()


tweetFetcher <- function() {
  # https://github.com/twitterdev/Twitter-API-v2-sample-code/blob/master/Recent-Search/recent-search.r

  headers <-
    c(`Authorization` = sprintf('Bearer %s', APIinfo$BEARER_TOKEN))

  params = list(
    `query` = paste(APIinfo$query, "lang:en"),
    `max_results` = APIinfo$max_results,
    `tweet.fields` = APIinfo$tweet.fields,
    `page` = APIinfo$page
  )
  fetchInfo <-
    list("headers" = headers,
         "params" = params,
         url = APIinfo$url)

  return(fetchInfo)

}


# Twitter Recent Search Fetch
tweetFetcher.fetch <- function(returnedInfo) {
  # https://stackoverflow.com/questions/12193779/how-to-write-trycatch-in-r
  out <- tryCatch({
    response <-
      httr::GET(
        url = returnedInfo$url,
        httr::add_headers(.headers = returnedInfo$headers),
        query = returnedInfo$params
      )

    recent_search_body <-
      httr::content(
        response,
        as = 'parsed',
        type = 'application/json',
        simplifyDataFrame = TRUE
      )

    nextParams = list(`query` = returnedInfo$params$query,
                      `next_token` = recent_search_body$meta$next_token)

    nextInfo = returnedInfo
    paginateRequested <-
      paste(
        recent_search_body$data$text,
        nextTweetFetcher(nextInfo, nextParams, q = returnedInfo$params$page)
      )

    return(paginateRequested)

  },
  error = function(err) {
    message("Tweet Fetch Failed ")
    message("Here's the original error message:")
    message(err)
    return(NULL)
  },
  warning = function(warn) {
    message("Tweet Fetch Warning ")
    message("Here's the original error message:")
    message(warn)
  },
  finally = {
    message(paste("Processed URL:", APIinfo$url))
    message("Processing end")
  })

  return(out)
}
