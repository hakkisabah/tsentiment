#' tsentiment environment
#'
#' @param APIinfo Environment
#' @export

APIinfo <- new.env(parent = emptyenv())
APIinfo$BEARER_TOKEN <- new.env(parent = emptyenv())
APIinfo$headers <- new.env(parent = emptyenv())
APIinfo$url <- 'https://api.tsentiment.com/twitter/gettweet/'
APIinfo$fileConfirmation = ''
