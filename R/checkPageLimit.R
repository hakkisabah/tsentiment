#' Check page limit
#'
#' This function looping for pagination calling while looping
#'
#' @return integer
#' @export
#' @param q is quantity for tweet
#' @examples
#' q <- 300
#' checkPageLimit(q)

checkPageLimit <- function(q){
  minPageLimit <- 100
  maxPageLimit <- 300

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

