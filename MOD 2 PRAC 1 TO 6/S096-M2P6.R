library(dplyr)
df <- read.csv("qualcomm_data.csv")

print("--- 4. One-Sample t-test ---")

t_test_one <- t.test(df$total_score, mu = 75)
print(t_test_one)


print("--- 5. Independent Two-Sample t-test ---")

t_test_two <- t.test(total_score ~ Attendance_Group, data = df)
print(t_test_two)


print("--- 6. Paired t-test ---")

df$midterm_score <- df$total_score - runif(nrow(df), min=-5, max=10)

t_test_paired <- t.test(df$total_score, df$midterm_score, paired = TRUE)

print(t_test_paired)