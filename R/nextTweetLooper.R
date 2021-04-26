# Twitter next token looper
#' @export

# source("R/checkPageLimit.R")

nextTweetFetcher <- function(APIinfo, nextParams, q) {
  
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
}