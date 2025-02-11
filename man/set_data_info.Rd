% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/helper_fn.R
\name{set_data_info}
\alias{set_data_info}
\title{Functions to set omicsData attributes ----------------------------------------}
\usage{
set_data_info(
  e_data,
  edata_cname,
  data_scale_orig,
  data_scale,
  data_types,
  norm_info,
  is_normalized,
  batch_info,
  is_bc
)
}
\arguments{
\item{e_data}{}

\item{edata_cname}{}

\item{data_scale_orig}{}

\item{data_scale}{}

\item{data_types}{}

\item{norm_info}{}

\item{is_normalized}{}
}
\value{
A list containing all the elements in the data_info attribute:
       (list all attributes)
}
\description{
Create a set function that will return the value for each attribute. For 
example, set_data_info will perform all of the calculations to fill in the
data_info attribute. These functions will be called in the as.xxx functions
to create an xxxData object but can be used individually to update any one of
the attributes at a later time.
Sets/updates the values in the data_info attribute
}
