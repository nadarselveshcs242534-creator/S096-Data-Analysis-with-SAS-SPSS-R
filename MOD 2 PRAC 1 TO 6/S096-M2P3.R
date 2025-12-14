library(dplyr)
library(psych)  

df <- read.csv("sales_data.csv")

print("--- 3. Cross-Tabulation (Product Category vs. Region) ---")

cross_tab <- table(df$Product_Category, df$Region)

print(cross_tab)