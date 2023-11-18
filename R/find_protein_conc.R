find_protein_conc <- function(absorvance, cal_curve) {

  b <- cal_curve$intercept
  m <- cal_curve$slope
  y <- absorvance

  (y - b) / m

}
