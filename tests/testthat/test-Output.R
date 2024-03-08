test_that("Output", {

  data(eva)

  mg <- multiple.guidance(input.data = eva,
                          predictand = "evapo_obs",
                          predictors = "OUT_EVAP")

  expect_length(mg.evaluation(input.data = eva,
                              predictand = "evapo_obs",
                              predictors = "OUT_EVAP",
                              var.model = "OUT_EVAP",
                              lmodel = mg), 2)
})
