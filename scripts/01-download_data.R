#### Preamble ####
# Purpose: Downloads and saves the ces2020 data used in Telling Stories with Data
# Author: Talia Fabregas
# Date: 5 March 2024
# Contact: talia.fabregas@mail.utoronto.ca
# License: MIT
# Pre-requisites: none
# Any other information needed? n/a


#### Workspace setup ####
library(dataverse)
library(tidyverse)


#### Download data ####
ces2020 <-
  get_dataframe_by_name(
    filename = "CES20_Common_OUTPUT_vv.csv",
    dataset = "10.7910/DVN/E9N6PH",
    server = "dataverse.harvard.edu",
    .f = read_csv
  ) |>
  select(votereg, CC20_410, gender, educ)


#### Save data ####
write_csv(ces2020, "data/raw_data/ces2020.csv")


         
