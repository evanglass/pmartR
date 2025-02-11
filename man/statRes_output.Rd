% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/statRes_class.R
\name{statRes_output}
\alias{statRes_output}
\title{Function to take raw output of `imd_anova` and create output for `statRes` object}
\usage{
statRes_output(
  imd_anova_out,
  omicsData,
  comparisons,
  test_method,
  pval_adjust_a,
  pval_adjust_g,
  pval_thresh
)
}
\arguments{
\item{imd_anova_out}{data frame containing the results of the
\code{imd_anova} call.}

\item{omicsData}{pmartR data object of any class, which has a `group_df`
attribute that is usually created by the `group_designation()` function}

\item{comparisons}{Tcomparisons made}

\item{test_method}{test method used ("anova", "gtest", or "combined")}

\item{pval_adjust_a}{character string indicating the p-value adjustment
method for ANOVA}

\item{pval_adjust_g}{character string indicating the p-value adjustment
method for G-test}

\item{pval_thresh}{numeric p-value threshold value}
}
\value{
object of class statRes
}
\description{
Function to take raw output of `imd_anova` and create output for `statRes` object
}
