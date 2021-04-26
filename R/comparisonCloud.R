#' @export
getCloudSentiment <- function(text) {
  # Create now the cloud: a pair of warnings, because you do not have negative words and it is joining by word(correct)

  pngName <-
    paste(getwd(),"/results/",format(Sys.time(), "%d-%b-%Y %H-%M-%S"),"-AnalysedComparisonCloud.png",sep = "")

  png(pngName, width = 480, height = 480,units = "px", pointsize = 12)

  ready <- text %>%
    inner_join(get_sentiments("bing")) %>%
    dplyr::count(word, sentiment, sort = TRUE) %>%
    acast(word ~ sentiment, value.var = "n", fill = 0) %>%
    comparison.cloud(
      colors = c("gray80", "gray20"),
      max.words = 1000,
      title.size = 3,
      random.order = FALSE,
      match.colors = TRUE
    )

  dev.off()
  message(paste("on",getwd(),"location"))
  message(paste(pngName, "file created!"))
}
