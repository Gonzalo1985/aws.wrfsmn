test_that("Input entry", {
  expect_error(multiple.guidance(input.data = eva[,2:9],
                                 predictand = "evapo_obs",
                                 predictors = "OUT_EVAP"))

  expect_error(mg.evaluation(input.data = eva[,2:9],
                             predictand = "evapo_obs",
                             predictors = "OUT_EVAP",
                             var.model = "OUT_EVAP",
                             lmodel = lm))
})
