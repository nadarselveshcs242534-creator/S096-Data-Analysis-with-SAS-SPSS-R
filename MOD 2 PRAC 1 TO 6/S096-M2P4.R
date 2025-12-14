library(dplyr)
library(psych)  

df <- read.csv("Student Mental health.csv")


print("--- 4. One-Sample t-test ---")

# Question: Is the average Age significantly different from 20?
# H0 (Null Hypothesis): The true mean Age is 20.
# Note: We use !is.na() to exclude any missing age values
t_test_one <- t.test(df$Age[!is.na(df$Age)], mu = 20)
print(t_test_one)