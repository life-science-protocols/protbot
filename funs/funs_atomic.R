# atomic functions ####
## with dilution function determine volume-v1 ####
#' function dilution
#' @description 
#' 
#' This function determines the concentration or volume to transfer from one solution to another when performing a dilution.
#' 
#' @details
#' 
#' The function calculates `v1` from the formula $c_1*v_1=c_2*v_2$. 
#' This function does not take into account input in different units.
#'  
#' @inheritParams c1 (numeric) Concentration of solution-1 (or stock solution).
#' @inheritParams c2 (numeric) Concentration of solution-2 (or working solution).
#' @inheritParams v2 (numeric) Volume of solution-2.
#' @return v1 (numeric) Volume of solution-1, which is a numeric vector with value(s) with the same length as `c1`,`c2`,and `v2`.

#' @seealso 
#' 
#' Learn more [here](https://en.wikipedia.org/wiki/Dilution_(equation)).
#' 
#' @examples
#' 
#' Suppose you need to prepare a new working solution from a stock solution considering that: 
#' `c1` is the initial or stock solution, which has a concentration of 10 M (`c1=10`)
#' `c2` is the final or working solution, which has the desired concentration of 5 M (`c2=5`)
#' `v2` is the volume of the final, or working solution, which is 1 L (`v2=1`)
#' What is the volume of stock solution you need to use?
#' v1 <- dilution(c1=10,c2=5,v2=1)
#' print(cat("the volume of the solution needed is: , v1))

dilution <- function(c1,c2,v2){
  # check if the vectors have the same length
  if (all(length(c1)==length(c2) && length(c1) == length(v2))){
    run = 1
    }else{
      check=1
      warning("the arguments must have the same sizes. use `length()` to check.")
      }
  # check if the values are numeric
  if (all(is.numeric(c1) && is.numeric(c2) == is.numeric(v2))){
    run = 1
  }else{
    check=2
    warning("the arguments must be numeric values. one element of a vector or a vector is not numeric.")
  }
  # check if final concentration is smaller than initial concentration
  if (all(c2 < c1)){
    run = 1
  }else{
    check=3
    warning("the final working concentration can't be higher than initial stock concentration.")
  }
  # calculate the volume or concentrations of solution-1
  if (run == 1){
    v1 <- c2*v2/c1
    }else{
      warning(cat("function could not run because it fail check: ",check,"."))
    }
    
  return(v1)
}

## linear equation find x or y ####

linear_equation_solver <- function(m, b, y=NULL, x=NULL){
  
  # check if m is 0
  if (m == 0){
    warning("the argument `m` for the slope cannot be 0")
  }
  # check that only one values is given for `m` and `b`
  if (!all(length(m) == length(b) | length(m) >= 1)){
    warning("the number of elements for slope `m` and intercept `b` should be the same")
  }
  # determine x 
  if(!missing(y) && is.null(x)){
    
    x <- (y - b) / m
    # print message to warn about zeros in the numerator `(y-b)`
    if(any(is.infinite(x) | is.nan(x) | x == 0)){
      print("The code ran but one or more elements of `x` are either 0,inf, or nan due to zeros from `(y-b)/m`")
    }
    return(x)
  }
  # determine y
  if(!missing(x) && is.null(y)){
    y <- m*x+b
    return(y)
  }
}

## ####