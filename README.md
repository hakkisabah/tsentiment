# tsentiment

## Introduction
tsentiment is a sentiment analysis package created with R programming language.
A Twitter Developer Account will be required to use this tool.
For sentiment analysis, tsentiment scans the keyword you want to search for, and presents two visual results to the user as a result of the process.

## Limitation
- page limit range 100-300 ( Decided by Twitter, requests per 15-minute limited to 450 )
- accept only english words for search

## Requirements
- R (>=4.0.5)
- R devtools library
- Twitter Developer Account
- - Twitter App Bearer Token

## Setup Case
- library(devtools) // after the installation, more information => https://www.r-project.org/nosvn/pandoc/devtools.html
- install_github("hakkisabah/tsentiment")
- library(tsentiment)

## Use Case
In R console typing this conditions
```
setAccount(list(
    BEARER_TOKEN = "Your-Bearer-Token",
    query = "Your-Keyword",
    page = pagenumber(numeric)
))

getAnalysis()

```

Its simple !

After complete analysis check your workspace and you will see results directory. All succesful results saving this location.

## Example Results
![SetupIndex](AnalysedBarPlot.png)
![SetupIndex](AnalysedComparisonCloud.png)