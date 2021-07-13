#' Looping after first tweet fetching
#'
#' This function should be used at the start of each session
#'
#' @return String
#' @export
#' @param APIinfo sending from tweetFetcher function with final form
#' @param nextParams required after the first tweet fetch process
#' @param q is quantity, so its looping pagination limit
#' @examples

#' headers <- c(`Authorization` = sprintf('Bearer %s', "YOUR BEARER TOKEN"))
#' params <- list(`query` = paste("Your-query", "lang:en"),`max_results` = 100,
#' `tweet.fields` = 'created_at,lang,conversation_id',`page` = 1)
#' APIinfo <- list("headers" = headers,"params" = params,
#' url = "https://api.twitter.com/2/tweets/search/recent")
#' nextParams <- list(`query` = APIinfo$params$query,
#' `next_token` = "After fetching take a token for next tweet fetch")
#' \dontrun{
#' nextTweetFetcher(APIinfo,nextParams,q = APIinfo$params$page)
#' }


nextTweetFetcher <- function(APIinfo = NULL, nextParams = NULL, q = NULL) {

  if (!is.null(APIinfo) && !is.null(nextParams) && !is.null(q)){
    # Always check the correction

    q <- checkPageLimit(q)

    text = NULL

    for (i in 1:q) {
      responseNext <-
        httr::GET(
          url = APIinfo$url,
          httr::add_headers(.headers = APIinfo$headers),
          query = nextParams
        )

      recent_search_bodyNext <- httr::content(
        responseNext,
        as = 'parsed',
        type = 'application/json',
        simplifyDataFrame = TRUE
      )

      text <-
        if (!is.null(text))
          paste(text, recent_search_bodyNext$data$text)
      else
        recent_search_bodyNext$data$text

      # we need new token for pagination
      nextParams$next_token = recent_search_bodyNext$meta$next_token

    }

    message(paste(q,"page scanned !"))
    return(text)
  }else{
    warning("A variable problem from nextTweetLooper")
  }


}
