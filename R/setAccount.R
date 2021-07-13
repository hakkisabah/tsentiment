utils::globalVariables(names = c("APIinfo"),package = "tsentiment")
#' Set Twitter Developer Account Api Information
#'
#' This function should be used at the start of each session
#'
#' @return String
#' @export
#' @param params Its have to required Twitter and request informations for using this package
#' @examples
#' params <- list(BEARER_TOKEN = "DSEFS55SSS",query = "binance",page = 300)
#' setAccount(params)

# https://levelup.gitconnected.com/sentiment-analysis-with-twitter-hashtags-in-r-af02655f2113

# Sentiment Analysis

# set Twitter API V2 account informations

setAccount <- function(params){

  isVersionOk <- checkVersionForSentiment()

  if (!is.null(isVersionOk)){

    APIinfo <- NULL

    # Set for global using
    APIinfo <<- params
    # User must be given BEARER_TOKEN , query and page parameters

    APIinfo$max_results <<- 100
    APIinfo$url <<- 'https://api.twitter.com/2/tweets/search/recent'

  }else{
    message("version problem")
  }
}



