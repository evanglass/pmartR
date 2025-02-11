% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/seqData_wrappers.R
\name{get_group_formula}
\alias{get_group_formula}
\title{Get formula for group design}
\usage{
get_group_formula(omicsData)
}
\arguments{
\item{omicsData}{an object of type 'seqData', created by \code{\link{as.seqData}}}
}
\description{
For generating group design formulas and correctly ordered group data for 
seqData statistical functions
}
\examples{
\dontrun{

library(pmartRdata)
myseqData <- rnaseq_object
myseqData <- group_designation(omicsData = myseqData, main_effects = "Virus")
grouping_info <- pmartR:::get_group_formula(omicsData = myseqData)

}

}
