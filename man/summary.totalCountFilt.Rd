% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/filter_summary.R
\name{summary.totalCountFilt}
\alias{summary.totalCountFilt}
\title{Total Count Filter Summary}
\usage{
\method{summary}{totalCountFilt}(filter_object, min_count = NULL)
}
\arguments{
\item{filter_object}{S3 object of class 'totalCountFilt' created by 
\code{\link{total_count_filter}}.}

\item{min_count}{numeric value greater than 1 and less than the value 
given by filter_object$Total_Count. Values below min_count are filtered out. 
Default value is NULL.}
}
\value{
a summary of the Total Count values, number of zero values, and 
non-zero values. If a min_count is provided the biomolecules that would be 
filtered at this threshold are reported.
}
\description{
Provide summary of a totalCountFilt S3 object
}
\examples{
library(pmartRdata)
myfilt <- total_count_filter(omicsData = rnaseq_object)
summary(filter_object = myfilt, min_count = 2)

}
\seealso{
\code{\link{total_count_filter}}
}
\author{
Rachel Richardson
}
