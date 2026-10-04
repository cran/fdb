## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----data---------------------------------------------------------------------
library(fdb)
set.seed(41)
dat <- simulate_hybrid_cox(nI1 = 40, nI0 = 40, nE = 80,
                           theta0 = log(0.8), delta0 = log(1.1), p = 0)$data
head(dat)

## ----fit----------------------------------------------------------------------
fit <- fit_one_penalized_method(dat, method = "P1", lambda = 0.2)
fit[c("method", "theta_hat", "delta_hat", "se_theta", "se_sand")]

## ----calibration, eval=FALSE--------------------------------------------------
# cal <- calibrate_lambda_grid_two_stage(
#   method = "P1", lambda_grid_coarse = c(0.02, 0.05, 0.1, 0.2, 0.5),
#   scenario_base = scenario_S1, drift_set_cal = log(c(1, 1.05, 1.1)),
#   nsim_cal = 10000, nsim_confirm = 10000,
#   alpha = 0.025, alpha_cal = 0.04, seed = 81)
# cal$lambda_star
# cal$confirm$details

## ----replicate-workflow, eval=FALSE-------------------------------------------
# curve <- run_drift_curve(
#   theta0 = 0, drift_set = log(c(1, 1.1)), scenario_base = scenario_S1,
#   lambdas = lambdas_default, nsim = 10000, seed = 71, keep_raw = TRUE)
# curve$summary
# head(curve$raw)
# saveRDS(curve, "curve_with_replicates.rds")  # Choose your own output path.

