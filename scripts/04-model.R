#### Preamble ####
# Purpose: Write the models
# Author: Talia Fabregas
# Date: 5 March 2024
# Contact: talia.fabregas@mail.utoronto.ca
# License: MIT
# Pre-requisites: run 01-download_data and 02-data_cleaning first.
# Any other information needed? 


#### Workspace setup ####
library(tidyverse)
library(rstanarm)
library(arrow)

#### Read data ####
analysis_data <- read_parquet("data/analysis_data/analysis_data.parquet")

set.seed(853)

analysis_data <- 
  ces2020 |> 
  slice_sample(n = 1000)


### Model data ####
first_model <-
  stan_glm(
    formula = voted_for ~ gender + education,
    data = analysis_data,
    family = binomial(link = "logit"),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    seed = 853
  )

prior_summary(first_model)

#### Save model ####
saveRDS(
  first_model,
  file = "models/first_model.rds"
)