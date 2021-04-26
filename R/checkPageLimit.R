# check page limit
#' @export
minPageLimit <- 100
maxPageLimit <- 300

checkPageLimit <- function(q){
  
  if (!is.numeric(q) || q < minPageLimit || q > maxPageLimit) {
    q <- if (q >= minPageLimit)
      maxPageLimit
    else
      minPageLimit
    message(
      paste(
        "quantity set to",
        q ,
        "because your quantity parameter not according to the rules"
      )
    )
  }
  
  return(q)
  
}

