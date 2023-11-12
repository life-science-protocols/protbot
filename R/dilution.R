#' Find the volume of a stock solution to aliquot
#'
#' @description
#'
#' Suppose you need to prepare a new working solution from a stock solution
#' whose concentration is `conc_i`. If the final concentration and volume are
#' `conc_f` and `vol_f`, then [find_vol_i()] determines the volume of stock
#' solution to use (`vol_i`), i.e. the aliquot volume. [find_vol_i()] uses the
#' well-known [Dilution
#' Equation](https://en.wikipedia.org/wiki/Dilution_(equation)):
#'
#' \deqn{c_i v_i = c_f v_f}
#'
#' Thus, the initial or stock volume to aliquot is:
#'
#' \deqn{v_i = \frac{c_f v_f}{c_i}}
#'
#' @param conc_i Initial or stock solution concentration.
#' @param conc_f New (or final) solution concentration.
#' @param vol_f New (or final) solution volume.
#'
#' @returns A numeric vector whose values represent the volume of stock solution
#'   to use. The units of these volumes are to be interpreted as the same as in
#'   the final volume `vol_f`.
#'
#' @details
#' # Admonition
#' This function has no means of checking the correct usage of units in
#' concentrations and volumes. The user needs to ensure that the units are
#' coherent, i.e. use the same unit in `conc_i` and `conc_f`, e.g. M or uM; and
#' expect the same units as `vol_f` in the final result.
#'
#' @examples
#' # Stock solution concentration of 10 Molar (`conc_i`).
#' # Desired/new solution concentration of 5 Molar (`conc_f`).
#' # Final volume of the new solution: 1 Litre (`vol_f`).
#' find_vol_i(conc_i = 10, conc_f = 5, vol_f = 1)
#'
#' # `find_vol_i()` is vectorised and applies tidyverse recycling
#' find_vol_i(conc_i = 10, conc_f = c(5, 5/2, 5/4, 5/8), vol_f = 1)
#'
#' @export
find_vol_i <- function(conc_i, conc_f, vol_f) {

  if (!is.numeric(conc_i)) {
    rlang::abort("`conc_i` must be numeric.")
  }

  if (!is.numeric(conc_f)) {
    rlang::abort("`conc_i` must be numeric.")
  }

  if (!is.numeric(vol_f)) {
    rlang::abort("`conc_i` must be numeric.")
  }

  # Ensure vectors have the same size.
  # See: https://vctrs.r-lib.org/reference/theory-faq-recycling.html
  vctrs <- vctrs::vec_recycle_common(conc_i, conc_f, vol_f)
  conc_i <- vctrs[[1]]
  conc_f <- vctrs[[2]]
  vol_f <- vctrs[[3]]

  # Check that final concentration is not higher than initial concentration.
  if (any(conc_f > conc_i)) {
    msg <- "Final concentration(s) `conc_f` cannot be higher than stock concentration(s) `conc_i`."
    rlang::abort(msg)
  }

  # `vol_i`: (initial) volume of stock solution to use/aliquot.
  vol_i <- conc_f * vol_f / conc_i

  vol_i
}
