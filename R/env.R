#' tsentiment environment
#'
#' @param APIinfo Environment
#' @export

APIinfo <- new.env(parent = emptyenv())
APIinfo$BEARER_TOKEN <- new.env(parent = emptyenv())
APIinfo$headers <- new.env(parent = emptyenv())
APIinfo$query <- as.character()
APIinfo$page <- new.env(parent = emptyenv())
APIinfo$max_results <- 100
APIinfo$url <- 'https://api.twitter.com/2/tweets/search/recent'
APIinfo$tweet.fields <- 'created_at,lang,conversation_id'
APIinfo$fileConfirmation = new.env(parent = emptyenv())
