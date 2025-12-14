library(dplyr)
df <- read.csv("StudentsPerformance.csv")

print("--- 4. One-Sample t-test ---")

t_test_one <- t.test(df$math.score, mu = 70)
print(t_test_one)

print("--- 5. Independent Two-Sample t-test ---")

t_test_two <- t.test(math.score ~ test.preparation.course, data = df)
print(t_test_two)