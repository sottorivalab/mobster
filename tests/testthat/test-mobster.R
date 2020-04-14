
dataset = random_dataset(
  seed = 123, 
  K_betas = 1,
  Beta_variance_scaling = 1000    # variance ~ U[0, 1]/Beta_variance_scaling
)

fit = mobster_fit(
  dataset$data,    
  auto_setup = "FAST"
)

test_that("Test dataset with 1 clonal cluster and a tail", {
  expect_true(fit$best$fit.tail)
  expect_equal(fit$best$Kbeta, 1)
  expect_equal(round(fit$best$pi[["Tail"]], 2), round(dataset$model$pi[["Tail"]], 2))
  expect_equal(round(fit$best$pi[["C1"]], 2), round(dataset$model$pi[["C1"]], 2))
})

dataset = random_dataset(
  seed = 123, 
  K_betas = 2,
  Beta_variance_scaling = 1000    # variance ~ U[0, 1]/Beta_variance_scaling
)

fit = mobster_fit(
  dataset$data,    
  auto_setup = "FAST"
)

test_that("Test dataset with 2 clusters and a tail", {
  expect_true(fit$best$fit.tail)
  expect_equal(fit$best$Kbeta, 1)
  expect_equal(round(fit$best$pi[["Tail"]], 1), round(dataset$model$pi[["Tail"]], 1))
  expect_equal(round(fit$best$pi[["C1"]], 1), round(dataset$model$pi[["C1"]], 1))
  expect_equal(round(fit$best$pi[["C2"]], 1), round(dataset$model$pi[["C2"]], 1))
})
