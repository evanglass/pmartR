% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/helper_fn.R
\name{set_filter}
\alias{set_filter}
\title{Sets/updates the filters attribute with a filter class object.}
\usage{
set_filter(type, threshold, filtered, method)
}
\arguments{
\item{threshold}{}

\item{filtered}{}

\item{filter_type}{}

\item{filter_method}{}
}
\value{
A list containing all the elements in the filters attribute:
        (list all attributes)
}
\description{
This function will create a filter class object. The output will always have
the same elements but not all of them will be used for every filter type. This
object will be appended to the list in the filters attribute for an omicsData
object.
}
