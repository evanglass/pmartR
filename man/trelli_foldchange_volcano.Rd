% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/trelliPlots.R
\name{trelli_foldchange_volcano}
\alias{trelli_foldchange_volcano}
\title{Volcano trelliscope building function for fold_change}
\usage{
trelli_foldchange_volcano(
  trelliData,
  comparison,
  cognostics = c("n"),
  p_value_test = TRUE,
  p_value_thresh = 0.05,
  ggplot_params = NULL,
  interactive = FALSE,
  path = .getDownloadsFolder(),
  name = "Trelliscope",
  test_mode = FALSE,
  test_example = 1,
  single_plot = FALSE,
  ...
)
}
\arguments{
\item{trelliData}{A trelliscope data object with omicsData and statRes
results. Required.}

\item{comparison}{The specific comparison to visualize in the fold_change
volcano. See attr(statRes, "comparisons") for the available options.
Required.}

\item{cognostics}{A vector of cognostic options for each plot. Valid entry is
n.}

\item{p_value_test}{A logical to indicate whether specific significant
biomolecules are to be indicated with a changed color if an imd-anova was
run. Default is FALSE.}

\item{p_value_thresh}{A value between 0 and 1 to indicate significant
biomolecules for p_value_test. Default is 0.05.}

\item{ggplot_params}{An optional vector of strings of ggplot parameters to
the backend ggplot function. For example, c("ylab('')", "xlab('')").
Default is NULL.}

\item{interactive}{A logical argument indicating whether the plots should be
interactive or not. Interactive plots are ggplots piped to ggplotly (for
now). Default is FALSE.}

\item{path}{The base directory of the trelliscope application. Default is
Downloads.}

\item{name}{The name of the display. Default is Trelliscope.}

\item{test_mode}{A logical to return a smaller trelliscope to confirm plot
and design. Default is FALSE.}

\item{test_example}{A vector of plot indices to return for test_mode. Default
is 1.}

\item{single_plot}{A TRUE/FALSE to indicate whether 1 plot (not a
trelliscope) should be returned. Default is FALSE.}
}
\description{
Specify a plot design and cognostics for the fold_change volcano
  trelliscope. Fold change must be grouped by an emeta column, which means
  both an omicsData object and statRes are required to make this plot.
}
\examples{
\dontrun{ 

## Build fold_change bar plot with statRes data grouped by edata_colname.
trelli_panel_by(trelliData = trelliData4, panel = "LipidFamily") \%>\% 
  trelli_foldchange_volcano(comparison = "Mock_vs_Infection_A")

}

}
\author{
David Degnan, Lisa Bramer
}
