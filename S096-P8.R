library(dplyr)
library(tidyr) 

jee_df <- read.csv("JEE Mains 2013-25 Top Ranks.csv", na.strings = c("", "NA"))

set.seed(123) 
jee_df[sample(1:nrow(jee_df), 5), "State"] <- NA         
jee_df[sample(1:nrow(jee_df), 5), "Maths_Marks"] <- NA   

print("--- 1. Original Data with Artificial NAs (First 6 Rows) ---")
print(head(jee_df))


print("--- Count of Missing Values per Column ---")
print(colSums(is.na(jee_df)))

clean_omit <- na.omit(jee_df)

print("--- 2. Data after na.omit() ---")
print(paste("Original rows:", nrow(jee_df)))
print(paste("Rows remaining:", nrow(clean_omit)))

avg_maths <- mean(jee_df$Maths_Marks, na.rm = TRUE)

clean_replace <- jee_df %>%
  replace_na(list(
    State = "Unknown State",
    Maths_Marks = avg_maths,
    Physics_Marks = 0
  ))

print("--- 3. Data after replace_na() ---")
print(head(clean_replace))

print("--- Remaining NAs after replacement ---")
print(colSums(is.na(clean_replace)))