# Twitter API V2 Account Setup
#' @export

# source("R/nextTweetLooper.R")

tweetFetcher <- function(APIinfo) {
  # https://github.com/twitterdev/Twitter-API-v2-sample-code/blob/master/Recent-Search/recent-search.r
  
  headers <-
    c(`Authorization` = sprintf('Bearer %s', APIinfo$BEARER_TOKEN))
  
  params = list(
    `query` = paste(APIinfo$query, "lang:en"),
    `max_results` = APIinfo$max_results,
    `tweet.fields` = 'created_at,lang,conversation_id',
    `page` = APIinfo$page
  )
  fetchInfo <-
    list("headers" = headers,
         "params" = params,
         url = APIinfo$url)
  
  return(fetchInfo)
  
}


# Twitter Recent Search Fetch
tweetFetcher.fetch <- function(APIinfo) {
  # https://stackoverflow.com/questions/12193779/how-to-write-trycatch-in-r
  out <- tryCatch({
    response <-
      httr::GET(
        url = APIinfo$url,
        httr::add_headers(.headers = APIinfo$headers),
        query = APIinfo$params
      )
    
    recent_search_body <-
      httr::content(
        response,
        as = 'parsed',
        type = 'application/json',
        simplifyDataFrame = TRUE
      )
    
    nextParams = list(`query` = APIinfo$params$query,
                      `next_token` = recent_search_body$meta$next_token)
    
    paginateRequested <-
      paste(
        recent_search_body$data$text,
        nextTweetFetcher(APIinfo, nextParams, q = APIinfo$params$page)
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
