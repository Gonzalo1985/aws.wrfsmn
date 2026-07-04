# Multiple lineal regression of data

Definition of linear multiple regression adjustment based on predictor
variables that fit a predicting variable

## Usage

``` r
multiple.guidance(
  input.data = input.data,
  predictand = predictand,
  predictors = predictors
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

## Value

an element of class lm
