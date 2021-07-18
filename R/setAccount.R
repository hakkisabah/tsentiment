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

  isConfirmOk <- checkConfirmForUSer()

  fileConfirmation <- NULL

  if (isConfirmOk == "y"){

    fileConfirmation <- isConfirmOk

    isVersionOk <- checkVersionForSentiment()

    if (!is.null(isVersionOk)){

      # Setting env
      APIinfo$BEARER_TOKEN = params$BEARER_TOKEN
      APIinfo$query = params$query
      APIinfo$page = params$page
      # User must be given BEARER_TOKEN , query and page parameters

    }else{
      message("version problem")
    }

  }else{
    warning("User file writing confirmation fail,\n permission is needed to print analysis results,\n you can try again to allow it.")
  }

}



