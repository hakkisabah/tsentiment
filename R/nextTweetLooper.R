#' Looping after first tweet fetching
#'
#' This function should be used at the start of each session
#'
#' @return String
#' @export
#' @param nextInfo sending from tweetFetcher function with final form
#' @param nextParams required after the first tweet fetch process
#' @param q is quantity, so its looping pagination limit
#' @examples
#' headers <- c(`Authorization` = sprintf('Bearer %s', "YOUR BEARER TOKEN"))
#' params <- list(`query` = paste("Your-query", "lang:en"),`max_results` = 100,
#' `tweet.fields` = 'created_at,lang,conversation_id',`page` = 1)
#' nextInfo <- list("headers" = headers,"params" = params, url = "url")
#' nextParams <- list(`query` = nextInfo$params$query,
#' `next_token` = "After fetching take a token for next tweet fetch")
#' \dontrun{
#' nextTweetFetcher(nextInfo,nextParams,q = nextInfo$params$page)
#' }


nextTweetFetcher <- function(nextInfo = NULL, nextParams = NULL, q = NULL) {

  if (!is.null(nextInfo) && !is.null(nextParams) && !is.null(q)){
    # Always check the correction

    q <- checkPageLimit(q)

    text = NULL

    for (i in 1:q) {
      responseNext <-
        httr::GET(
          url = nextInfo$url,
          httr::add_headers(.headers = nextInfo$headers),
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
