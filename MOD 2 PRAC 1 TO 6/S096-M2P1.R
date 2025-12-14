library(dplyr)
library(psych)  

df <- read.csv("traffic.csv")

df$Traffic_Level <- ifelse(df$Vehicles > 20, "High", "Low")

print("---- 1. Descriptive Statistics ----")

print("Summary of Vehicles:")
summary(df$Vehicles)

print("Detailed Description of Vehicles:")
describe(df$Vehicles)