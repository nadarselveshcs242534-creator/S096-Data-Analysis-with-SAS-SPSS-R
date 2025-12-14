library(dplyr)
library(psych)  

df <- read.csv("JEE Mains 2013-25 Top Ranks.csv")

print("---- 2. Frequency Tables (State Distribution) ----")


state_counts <- table(df$State)
print(state_counts)

state_df <- df %>% count(State)
print(state_df)