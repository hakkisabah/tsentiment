% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/setAccount.R
\name{setAccount}
\alias{setAccount}
\title{Set Twitter Developer Account Api Information}
\usage{
setAccount(params)
}
\arguments{
\item{params}{Its have to required Twitter and request informations for using this package}
}
\value{
String
}
\description{
This function should be used at the start of each session
}
\examples{
params <- list(BEARER_TOKEN = "DSEFS55SSS",query = "binance")
setAccount(params)
}
