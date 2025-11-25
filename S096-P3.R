install.packages(c("readr", "psych"))

library(readr)    
library(psych)   
traffic <- read_csv("~/Selvesh/traffic.csv")

head(traffic)

tail(traffic)

cat("Dimensions (Rows, Columns): ", dim(traffic), "\n")

str(traffic)

summary(traffic)

cat("Column Names: ", names(traffic), "\n")

