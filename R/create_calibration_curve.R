create_calibration_curve <- function(intercept, slope) {

  cal_curve <- list(intercept = intercept,
                    slope = slope)

  class(cal_curve) <- "cal_curve"

  cal_curve
}


estimate_calibration_curve <- function(data) {

  if(!all(c("x", "y") %in% colnames(data)))
    stop("`data` must have two columns named `x` and `y`.")

  if(nrow(data) < 3L)
    stop("`data` must have at least three observations.")

  if(!is.numeric(data$x))
    stop("`x` column must numeric.")

  if(!is.numeric(data$y))
    stop("`y` column must numeric.")

  lm_results <- lm(y ~ x, data = data)

  create_calibration_curve(
    intercept = unname(lm_results$coefficients[1]),
    slope = unname(lm_results$coefficients[2])
  )

}
