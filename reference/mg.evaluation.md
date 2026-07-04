# Evaluation of regression

Evaluation of the linear multiple regression obtained from the
multiple.guidance function

## Usage

``` r
mg.evaluation(
  input.data = input.data,
  predictand = predictand,
  predictors = predictors,
  var.model = var.model,
  lmodel = lmodel
)
```

## Arguments

- input.data:

  Data frame with first column as a "POSIXct" class and one or more
  columns with data values. The predictand and predictors variables
  should be located in these columns

- predictand:

  Character with column name of the predictand variable

- predictors:

  Character array with one or more elements of the predictors chosen by
  the user

- var.model:

  Character with column name of the modeled predicting variable

- lmodel:

  Element of class lm obtained from multiple.guidance output function

## Value

List of two elements. First element is a matrix with the columns of
observed data, modeled data and corrected data. Second element is a data
frame of the statistical results of the modeled and corrected data
versus observed data
