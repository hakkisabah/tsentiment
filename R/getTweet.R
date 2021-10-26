#' Get Tweet
#'
#' This function only get tweet from tsentiment api
#'
#' @return JSON
#' @export
#' @param  fetchParams is variable
#' @examples
#' \dontrun{
#' fetchParams <- list(headers = headers,params = params,url = APIinfo$url)
#' getTweet(fetchParams)
#' }

getTweet <- function(fetchParams){
  # https://stackoverflow.com/questions/12193779/how-to-write-trycatch-in-r
  fetchedTweet <- tryCatch({
    response <-
      httr::GET(
        url = fetchParams$url,
        httr::add_headers(.headers = fetchParams$headers),
        query = fetchParams$params
      )

    recent_search_body <-
      httr::content(
        response,
        as = 'parsed',
        type = 'application/json',
        simplifyDataFrame = TRUE
      )
    if (recent_search_body$status >=400){
      warning(recent_search_body, call. = FALSE)
    }
    nextParams = list(`nextResultLink` = recent_search_body$data$search_metadata$next_results, `word` = APIinfo$query)
    if (recent_search_body$data$remainingRateLimit < 1){
      recent_search_body$data$remainingRateLimit = NULL
    }
    result =
      list(
        `text` = recent_search_body$data$statuses$text,
        `remainingRateLimit` = recent_search_body$data$remainingRateLimit,
        `nextParams` = nextParams
      )

  },
  error = function(err) {
    message("Tweet Fetch Failed ")
    cat(stringi::stri_pad_both(c("Here's the original error message: ",
                        err$message),
                      getOption('width')*0.9), sep='\n')
    return(NULL)
  },
  warning = function(warn) {
    message("Tweet Fetch Warning ")
    cat(stringi::stri_pad_both(c("Here's the original warning message: ",
                        warn$message),
                      getOption('width')*0.9), sep='\n')
  })
  return(fetchedTweet)
}
