#' Computes the Number of Non-Missing Data Points by Group
#'
#' This function computes the number of non-missing observations for samples,
#' based on a group designation, for every biomolecule in the dataset
#'
#' @param omicsData an optional object of one of the classes "pepData",
#'        "proData", "metabData",  "lipidData", or "nmrData", usually created by
#'        \code{\link{as.pepData}}, \code{\link{as.proData}},
#'        \code{\link{as.metabData}}, \code{\link{as.lipidData}}, or
#'        \code{\link{as.nmrData}}, respectively. Either omicsData or all of
#'        e_data, groupDF, cname_id, and samp_id must be provided.
#'
#' @return a list of length two. The first element giving the total number of
#'         possible samples for each group. The second element giving a
#'         data.frame with the first column giving the peptide and the second
#'         through kth columns giving the number of non-missing observations for
#'         each of the \code{k} groups.
#'
#' @author Lisa Bramer, Kelly Stratton
#'
nonmissing_per_group <- function (omicsData) {

  # Extract the ID column.
  id_col <- which(names(omicsData$e_data) == get_edata_cname(omicsData))

  # Make a copy of e_data so the sample columns can be reordered later.
  edata <- omicsData$e_data[, -id_col]

  # Fish out information from the group_DF attribute.
  # groupDF <- attr(omicsData, "group_DF")
  groupDF <- get_group_DF(omicsData)

  # Count the number of samples per group from the group_DF data frame.
  tot_samps <- groupDF %>%
    # Gather all samples from each group.
    dplyr::group_by(Group) %>%
    # Create a new column, n_group, that is the number of samples per group.
    dplyr::summarize(n_group = dplyr::n()) %>%
    # Convert to a data frame.
    data.frame()

  # Reorder the samples. This is done because the C++ function for counting
  # group sizes assumes the samples are ordered by group in the omicsData data
  # frames.
  group_dat <- as.character(groupDF$Group[order(groupDF$Group)])

  # Reorder the columns of e_data. This needs to be done so the e_data columns
  # will match the order of the group_data vector. These are ordered because the
  # following C++ function assumes the samples are in order.
  edata <- edata[, order(groupDF$Group)]

  # Count the number of nonmissing values per group. The output is a matrix with
  # the number of observations down the rows and the number of unique groups
  # across the columns.
  nonmissing <- nonmissing_per_grp(as.matrix(edata),
                                   group_dat)

  # Add the biomolecule IDs to the group counts.
  nonmiss_totals <- data.frame(as.character(omicsData$e_data[, id_col]),
                               nonmissing,
                               stringsAsFactors = FALSE)
                               # check.names = check_names)
  # BEWARE! DON'T UNCOMMENT!! Or uncomment and see what happens ;)
  # The check.names argument was commented out because it placed an "X" in front
  # of the column name if the column name was a number (even if the number was a
  # character string e.g., "1"). This lead to problems when running a summary on
  # the filtered data because the group names in the group_DF attribute did not
  # match the column names of the filter object. For example, if the group names
  # were "1", "2", and "3" the column names would be "X1", "X2", and "X3".
  # Because of this discrepancy the summary would incorrectly print that all
  # biomolecules would be filtered. NOTE: The explanation above is outdated
  # because Evan A Martin on 10/05/2021 changed how the nonmiss_totals data
  # frame is created and how the column names are updated. However, I am leaving
  # the explanation for future generations of pmartR coding elves in hopes it
  # will help them through this trying time in their lives.

  # Rename the columns according to the edata_cname in omicsData and the names
  # in the group_DF attribute. The order of the names in group_dat will always
  # match the order of the columns in nonmiss_totals because they were
  # previously placed in the same order.
  names(nonmiss_totals) <- c(get_edata_cname(omicsData), unique(group_dat))


  return (list(group_sizes = tot_samps,
               nonmiss_totals = nonmiss_totals))

}
