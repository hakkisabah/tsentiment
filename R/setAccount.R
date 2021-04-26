#' @export

# source("R/checkRversion.R")
# source("R/packager.R")
# source("R/getAnalysis.R")


packages = c(
  "reshape2",
  "SnowballC",
  "wordcloud",
  "wordcloud2",
  "webshot",
  "RColorBrewer",
  "ggplot2",
  "tm",
  "httr",
  "jsonlite",
  "syuzhet",
  "tidyverse",
  "tidytext",
  "magrittr",
  "dplyr",
  "tibble",
  "grDevices"
)

# https://levelup.gitconnected.com/sentiment-analysis-with-twitter-hashtags-in-r-af02655f2113

# Sentiment Analysis

# https://stackoverflow.com/questions/4216753/check-existence-of-directory-and-create-if-doesnt-exist
# We need results directory and if exist warning false
dir.create(file.path("results/"), showWarnings = FALSE)

# set Twitter API V2 account informations

setAccount <- function(params){
  packager(packages)
  isVersionOk <- checkVersionForSentiment()

  if (!is.null(isVersionOk)){
    
    # Set for global using
    APIinfo <<- params
    # User must be given BEARER_TOKEN , query and page parameters
    
    APIinfo$max_results <<- 100
    APIinfo$url <<- 'https://api.twitter.com/2/tweets/search/recent'
    
  }else{
    message("version problem")
  }
}



