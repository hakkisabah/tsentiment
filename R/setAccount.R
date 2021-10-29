#' Set Twitter Developer Account Api Information
#'
#' This function should be used at the start of each session
#'
#' @return String
#' @export
#' @param params Its have to required Twitter and request informations for using this package
#' @examples
#' params <- list(BEARER_TOKEN = "DSEFS55SSS",query = "binance")
#' setAccount(params)

# https://levelup.gitconnected.com/sentiment-analysis-with-twitter-hashtags-in-r-af02655f2113

# Sentiment Analysis


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
      # User must be given BEARER_TOKEN , query and page parameters

    }else{
      message("version problem")
    }

  }else{
    message("Permission Need!")
    cat(stringi::stri_pad_both(c('User file writing confirmation fail,',
                        'permission is needed to print analysis results,',
                        'you can try again to allow it.'),
                      getOption('width')*0.9), sep='\n')
  }

}



