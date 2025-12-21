
library(tidyverse)
library(car)
library(ggpubr)    

data <- read.csv("JEE Mains 2013-25 Top Ranks.csv")

anova_model <- aov(Total_Marks ~ State, data = data)

summary(anova_model)