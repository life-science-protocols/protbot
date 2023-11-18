library(protbot)

# path <- system.file("datasets/sample_calibration.csv", package = "protbot")
# read.csv(path)

read_sample_calibration <- function(file) {

  rel_path <- glue::glue("datasets/{file}")
  abs_path <- system.file(rel_path, package = "protbot")

  read.csv(abs_path)
}

my_data <- read_sample_calibration("sample_calibration.csv")
colnames(my_data) <- c("x", "y")

calibration_curve <- estimate_calibration_curve(my_data)
create_calibration_curve(intercept = 0, slope = 23)


find_protein_conc(absorvance = c(0, 0.1, 0.5, 0.8, 1), linear_fit)
