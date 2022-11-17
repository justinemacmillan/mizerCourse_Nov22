try(unload("mizerExperimental"), silent = TRUE)
remotes::install_github("sizespectrum/mizerExperimental", quiet = TRUE)
library(mizerExperimental)
library(tidyverse)

cel_model <- readRDS("build/cel_model.rds")
cel_model@species_params$yield_observed <- readRDS("celtic_yields.rds")

catch <- read.csv("build/catch.csv")
size_at_age <- read.csv("build/size_at_age.csv")

cel_model <-
    tuneParams(cel_model, 
               size_at_age = size_at_age, 
               match = c("growth", "biomass"), 
               catch = catch, 
               tabs = c("Spectra", "Abundance", "Growth", "Repro", "Catch",
                        "Diet", "Death", "Sim"))

# The following gives an error message for unknown reason

cel_model <- 
    tuneParams(NS_params,
               tabs = c("Spectra", "Abundance", "Growth", "Repro", "Catch", 
                        "Diet", "Death", "Sim"),
               match = c("growth", "biomass"),
               size_at_age <- size_at_age,
               catch = catch)
