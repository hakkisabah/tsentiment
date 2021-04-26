# clean twitter data
#' @export
cleanFetchedTweet <- function(fetchedTweet){
  
  tweet <- tolower(fetchedTweet)
  
  tweet <- gsub("rt","",tweet)
  
  tweet <- gsub("@\\w+","",tweet)
  
  tweet <- gsub("[[:punct:]]","",tweet)
  
  tweet <- gsub("http\\w+","",tweet)
  
  tweet <- gsub("[ |\t]{2,}","",tweet)
  
  tweet <- gsub("^ ","",tweet)
  
  tweet <- gsub(" $","",tweet)
  
  # take all the phrases
  docs1 <- tibble::tibble(phrases = tweet)
  
  # add an id, from 1 to n
  docs1$ID <- row.names(docs1)
  
  # split all the words
  tidy_docs <- docs1 %>% unnest_tokens(word, phrases)

  return(tidy_docs)
  
  
}
