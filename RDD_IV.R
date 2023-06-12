library(tidyverse)
library(readr)
library(lubridate)
require(tidyquant)
require(readstata13)
require(dplyr)
require(ggplot2)
require(haven)
require(estimatr)
require(AER)
library(plm)
library(modelsummary)
library(rddensity) 
library(rdrobust)
library(kableExtra)


NI <- read_csv("Databases/Final_Derry.csv") %>% 
  dplyr::select(-...1)  %>% 
  group_by(month = floor_date(week, unit = "month"), District) %>% 
  summarise(
    protests = sum(n_protests)
  ) %>% 
  ungroup() |> 
  mutate(
    treatment = as.factor(ifelse(District == "Derry" & month >= "1987-08-01", 1, 0))
  ) 

distances <- read_csv("Databases/Derry_Distances.csv")%>% 
  dplyr::select(District, Distance_km) 

Religion <- read_csv("Databases/Religion.csv") |> 
  dplyr::select(District, CatholicMajority1991, pcg1991)
  
data <- NI |> 
  left_join(distances, by = "District") |> 
  mutate(
    logdist = log(Distance_km + 1))

data2 <- data |>  dplyr::filter(month >= "1985-01-01" & month <= "1989-12-31")


RDDd <- lm(protests ~ month + treatment + logdist, data = data2)  
summary(RDDd)

IVd <- iv_robust(protests ~ treatment | logdist, data = data2, diagnostics = T)
summary(IVd)


