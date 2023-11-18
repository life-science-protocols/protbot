#' Read a sample calibration file
#'
#' This function reads a calibration file that is bundled with protbot.
#'
#' @param file A string with the sample calibration file name.
#'
#' @returns A data frame resulting from the reading of the sample calibration
#'   file pointed by `file`.
#'
#' @export
read_sample_calibration <-
  function(file = stop("Please provide a `file` path")) {
    rel_path <- glue::glue("datasets/{file}")
    abs_path <- system.file(rel_path, package = "protbot")

    read.csv(abs_path)
  }
