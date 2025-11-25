install.packages("dplyr")
library(dplyr)
library(readr)

data <- read_csv("~/Selvesh/dataset.csv")

head(data)



high_chance <- subset(data, Chances > 0.9)
cat("Number of high chance entries (Chances > 0.9):", nrow(high_chance), "\n")
summary(high_chance$Chances)

good_rank_high_chance <- subset(data, Chances > 0.8 & Rank < 2000)
cat("High chance & good rank:", nrow(good_rank_high_chance), "\n")
head(good_rank_high_chance)

female_or_high <- subset(data, 
                         Gender == "Female-only (including Supernumerary)" | Chances > 0.95)

cat("Female-only OR very high chance:", nrow(female_or_high), "\n")
head(female_or_high)



low_rank <- data |>
  filter(Rank < 1000)

cat("Number of entries with Rank < 1000:", nrow(low_rank), "\n")
summary(low_rank$Rank)


neutral_low_chance <- data |>
  filter(Gender == "Gender-Neutral", Chances < 0.85)

cat("Neutral gender & low chances:", nrow(neutral_low_chance), "\n")
head(neutral_low_chance)

selected_branches <- data |>
  filter(Branch %in% c("Computer Science and Engineering (4 Years, Bachelor of Technology)",
                       "Integrated B. Tech.(IT) and M. Tech (IT) (5 Years, Integrated)"))

cat("Entries in selected branches:", nrow(selected_branches), "\n")
head(selected_branches)
