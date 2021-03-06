% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_infotables.R
\name{create_infotables}
\alias{create_infotables}
\title{Create WOE/NWOE tables and rank variables by IV/NIV}
\usage{
create_infotables(data = NULL, valid = NULL, y = NULL, bins = 10,
  trt = NULL, ncore = NULL, parallel = TRUE)
}
\arguments{
\item{data}{input data.frame for analysis (this is typically your training dataset).}

\item{valid}{validation data.frame (default is NULL). Must have the same variables as the training dataset.}

\item{y}{dependent variable.}

\item{bins}{number of bins (default is 10).}

\item{trt}{binary treatment variable for uplift analysis (Default is NUL).}

\item{ncore}{number of cores used. Default is to use available cores - 1.}

\item{parallel}{set to TRUE for parallel processing. Number of cores is determined by the ncore parameter.}
}
\description{
\code{create_infotables} returns WOE or NWOE tables (as data.frames), and a data.frame with IV or NIV values for all
predictive variables.
}
\examples{
 
##------------------------------------------------------------
## WOE analysis, no cross validation
##------------------------------------------------------------
library(Information)
data(train, package="Information")
train <- subset(train, TREATMENT==1)
IV <- Information::create_infotables(data=train, y="PURCHASE", parallel=FALSE)
print(head(IV$Summary), row.names=FALSE)
print(IV$Tables$N_OPEN_REV_ACTS, row.names=FALSE)
closeAllConnections()
}

