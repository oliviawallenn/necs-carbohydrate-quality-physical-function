# =========================================================
# NECS Longitudinal Carbohydrate Quality Analysis
# Olivia Wallen
# May 2026
# Description:
#   Longitudinal analysis of carbohydrate quality measures and functional
#   status among older adults using generalized estimating equation (GEE)
#   models from the New England Centenarian Study (NECS).
#   
# Objectives:
#   - Evaluate associations between carbohydrate quality variables and IADL
#   - Examine longitudinal changes in functional status over time
#   - Compare associations across sex
#   - Create publication-style epidemiologic visualizations
# Methods:
#   - Generalized estimating equations (GEE)
#   - Exchangeable correlation structure
#   - Fully adjusted longitudinal regression models
#   - Sex-stratified and analysis
#   - Forest plots and correlation heatmaps
#   - 95% confidence intervalsMethods:
#
# Dataset:
#   necs_full_fixed.sas7bdat
#
# Software:
#    R (haven, dplyr, geepack, ggplot2, broom)
# =========================================================

# =========================================================
# LOAD LIBRARIES
# =========================================================

library(haven)
library(dplyr)
library(purrr)
library(geepack)
library(broom)
library(ggplot2)
library(forcats)

# =========================================================
# SET WORKING DIRECTORY
# =========================================================

setwd("~/Desktop/DataViz")

# =========================================================
# LOAD DATA
# =========================================================

necs <- read_sas("necs_full_fixed.sas7bdat")

# Preview dataset
glimpse(necs)

# Check dataset size
dim(necs)

# =========================================================
# BASIC CLEANING
# =========================================================

necs <- necs %>%
  mutate(
    registration_sex_factor = factor(registration_sex_factor),
    any_disease = factor(any_disease),
    diabetes = factor(diabetes),
    smoker = factor(smoker),
    drinker = factor(drinker),
    cvd = factor(cvd),
    stroke = factor(stroke),
    cancer = factor(cancer)
  )

# =========================================================
# FIX ID VARIABLE
# =========================================================

necs$BU_ID <- as.numeric(factor(necs$BU_ID))

# =========================================================
# SORT DATA - so that the GEE models run smoothly
# =========================================================

necs <- necs %>%
  arrange(BU_ID, time_fixed)

# =========================================================
# DEFINE EXPOSURE VARIABLES
# =========================================================

exposures <- c(
  "fiber_per_1000kcal",
  "carb_fiber_ratio",
  "avg_GI",
  "total_GL",
  "total_carbs_g"
)

# =========================================================
# REMOVE MISSING VALUES
# =========================================================

necs_model <- necs %>%
  
  select(
    BU_ID,
    iadl,
    time_fixed,
    age_at_enrollment,
    registration_sex_factor,
    pn5_yrs_education,
    smoker,
    drinker,
    cvd,
    stroke,
    diabetes,
    cancer,
    any_disease,
    fiber_per_1000kcal,
    carb_fiber_ratio,
    avg_GI,
    total_GL,
    total_carbs_g
  ) %>%
  
  na.omit()

# Check cleaned dataset size
dim(necs_model)

# =========================================================
# TESTING ONE MODEL FIRST - before running loops
# =========================================================

test_model <- geeglm(
  
  iadl ~ time_fixed +
    fiber_per_1000kcal +
    age_at_enrollment +
    registration_sex_factor +
    pn5_yrs_education +
    smoker +
    drinker +
    cvd +
    stroke +
    diabetes +
    cancer,
  
  id = BU_ID,
  data = necs_model,
  family = gaussian,
  corstr = "exchangeable"
)

summary(test_model)

# =========================================================
# FUNCTION: FULLY ADJUSTED GEE MODEL
# =========================================================

run_gee <- function(exposure, data) {
  
  model_formula <- as.formula(
    paste0(
      "iadl ~ time_fixed + ",
      exposure,
      " + age_at_enrollment + ",
      "registration_sex_factor + ",
      "pn5_yrs_education + ",
      "smoker + drinker + ",
      "cvd + stroke + diabetes + cancer"
    )
  )
  
  model <- geeglm(
    formula = model_formula,
    id = BU_ID,
    data = data,
    family = gaussian,
    corstr = "exchangeable"
  )
  
  results <- tidy(model)
  
  exposure_results <- results %>%
    filter(term == exposure)
  
  exposure_results$exposure <- exposure
  
  return(exposure_results)
}

# =========================================================
# RUN FULLY ADJUSTED MODELS
# =========================================================

main_results <- map_dfr(
  exposures,
  run_gee,
  data = necs_model
)

# View results
main_results

# =========================================================
# CLEAN EXPOSURE LABELS
# =========================================================

label_map <- c(
  fiber_per_1000kcal = "Fiber Density",
  carb_fiber_ratio = "Carbohydrate:Fiber Ratio",
  avg_GI = "Glycemic Index",
  total_GL = "Glycemic Load",
  total_carbs_g = "Total Carbohydrates"
)

main_results <- main_results %>%
  mutate(
    exposure_label = recode(exposure, !!!label_map)
  )

# =========================================================
# FIGURE 1: MAIN FOREST PLOT
# =========================================================

figure1 <- ggplot(
  main_results,
  aes(
    x = estimate,
    y = fct_reorder(exposure_label, estimate)
  )
) +
  
  geom_point(size = 3) +
  
  geom_errorbarh(
    aes(
      xmin = estimate - 1.96 * std.error,
      xmax = estimate + 1.96 * std.error
    ),
    height = 0.2
  ) +
  
  geom_vline(
    xintercept = 0,
    linetype = "dashed"
  ) +
  
  labs(
    title = "Fully Adjusted GEE Associations with IADL",
    subtitle = "Adjusted for demographic and clinical covariates",
    x = "Beta Coefficient (95% CI)",
    y = NULL
  ) +
  
  theme_minimal(base_size = 13)

# Display figure
figure1

# =========================================================
# SAVE FIGURE 1
# =========================================================

ggsave(
  filename = "figure1_gee_maineffects_model3.png",
  plot = figure1,
  width = 9,
  height = 6,
  dpi = 300
)

# =========================================================
# FUNCTION: STRATIFIED GEE MODEL
# =========================================================

run_gee_stratified <- function(exposure, data) {
  
  model_formula <- as.formula(
    paste0(
      "iadl ~ time_fixed + ",
      exposure,
      " + age_at_enrollment + ",
      "pn5_yrs_education + ",
      "smoker + drinker + ",
      "cvd + stroke + diabetes + cancer"
    )
  )
  
  model <- geeglm(
    formula = model_formula,
    id = BU_ID,
    data = data,
    family = gaussian,
    corstr = "exchangeable"
  )
  
  results <- tidy(model)
  
  exposure_results <- results %>%
    filter(term == exposure)
  
  exposure_results$exposure <- exposure
  
  return(exposure_results)
}

# =========================================================
# SEX-STRATIFIED MODELS
# =========================================================

female_results <- map_dfr(
  exposures,
  run_gee_stratified,
  data = filter(
    necs_model,
    registration_sex_factor == "Female"
  )
)

female_results$group <- "Female"

male_results <- map_dfr(
  exposures,
  run_gee_stratified,
  data = filter(
    necs_model,
    registration_sex_factor == "Male"
  )
)

male_results$group <- "Male"

sex_results <- bind_rows(
  female_results,
  male_results
)

sex_results <- sex_results %>%
  mutate(
    exposure_label = recode(exposure, !!!label_map)
  )

# =========================================================
# FIGURE 2: SEX-STRATIFIED RESULTS
# =========================================================

figure2 <- ggplot(
  sex_results,
  aes(
    x = estimate,
    y = fct_reorder(exposure_label, estimate),
    shape = group
  )
) +
  
  geom_point(
    size = 3,
    position = position_dodge(width = 0.5)
  ) +
  
  geom_errorbarh(
    aes(
      xmin = estimate - 1.96 * std.error,
      xmax = estimate + 1.96 * std.error
    ),
    height = 0.2,
    position = position_dodge(width = 0.5)
  ) +
  
  geom_vline(
    xintercept = 0,
    linetype = "dashed"
  ) +
  
  labs(
    title = "Sex-Stratified GEE Associations with IADL",
    x = "Beta Coefficient (95% CI)",
    y = NULL,
    shape = "Sex"
  ) +
  
  theme_minimal(base_size = 13)

figure2

# =========================================================
# SAVE FIGURE 2
# =========================================================

ggsave(
  filename = "figure2_stratified_by_sex.png",
  plot = figure2,
  width = 10,
  height = 6,
  dpi = 300
)

# =========================================================
# FIGURE 3: CORRELATION HEATMAP
# =========================================================

cor_data <- necs_model %>%
  select(
    fiber_per_1000kcal,
    carb_fiber_ratio,
    avg_GI,
    total_GL,
    total_carbs_g
  )

cor_matrix <- cor(
  cor_data,
  use = "pairwise.complete.obs"
)

cor_df <- as.data.frame(
  as.table(cor_matrix)
)

figure4 <- ggplot(
  cor_df,
  aes(
    Var1,
    Var2,
    fill = Freq
  )
) +
  
  geom_tile() +
  
  geom_text(
    aes(label = round(Freq, 2)),
    size = 4
  ) +
  
  labs(
    title = "Correlations Among Dietary Variables",
    fill = "Pearson r",
    x = NULL,
    y = NULL
  ) +
  
  theme_minimal(base_size = 13) +
  
  theme(
    axis.text.x = element_text(
      angle = 45,
      hjust = 1
    )
  )

figure4

# =========================================================
# SAVE FIGURE 3
# =========================================================

ggsave(
  filename = "figure4_correlation_heatmap.png",
  plot = figure4,
  width = 8,
  height = 7,
  dpi = 300
)
