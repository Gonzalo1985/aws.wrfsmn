test_that("Length evaluation", {
  expect_length(get.wrf.files(2024, 1, 1, "00", "01H"), 73)
  expect_length(get.wrf.files(2024, 1, 1, "06", "01H"), 73)
  expect_length(get.wrf.files(2024, 1, 1, "12", "01H"), 73)
  expect_length(get.wrf.files(2024, 1, 1, "18", "01H"), 73)

  expect_length(get.wrf.files(2024, 1, 1, "00", "10M"), 73)
  expect_length(get.wrf.files(2024, 1, 1, "06", "10M"), 73)
  expect_length(get.wrf.files(2024, 1, 1, "12", "10M"), 73)
  expect_length(get.wrf.files(2024, 1, 1, "18", "10M"), 73)

  expect_length(get.wrf.files(2024, 1, 1, "00", "24H"), 3)
  expect_length(get.wrf.files(2024, 1, 1, "06", "24H"), 3)
  expect_length(get.wrf.files(2024, 1, 1, "12", "24H"), 4)
  expect_length(get.wrf.files(2024, 1, 1, "18", "24H"), 3)
})
