utils::globalVariables(names = c("word","phrases"),package = "tsentiment")
#' Clean raw data
#'
#' This function clean fetched tweets
#'
#' @return table
#' @export
#' @param fetchedTweet Fetched tweet has a lot of different characters
#' @import tibble

cleanFetchedTweet <- function(fetchedTweet = NULL){

  if (exists("fetchedTweet")){

    tweet <- tolower(fetchedTweet)

    tweet <- gsub("rt","",tweet)

    tweet <- gsub("@\\w+","",tweet)

    tweet <- gsub("[[:punct:]]","",tweet)

    tweet <- gsub("http\\w+","",tweet)

    tweet <- gsub("[ |\t]{2,}","",tweet)

    tweet <- gsub("^ ","",tweet)

    tweet <- gsub(" $","",tweet)

    # take all the phrases
    docs1 <- tibble(phrases = tweet)

    # add an id, from 1 to n
    docs1$ID <- row.names(docs1)

    # split all the words
    tidy_docs <- docs1 %>% tidytext::unnest_tokens(word, phrases)

    return(tidy_docs)
  }else{
    warning("fetchedTweet does not exists!")
  }


}
