data <- read.csv("qualcomm_data.csv", nrows = 5)

median_revenue <- median(data$Revenue)
median_net_income <- median(data$Net_Income)

data$Revenue_Cat <- ifelse(data$Revenue >= median_revenue, "High", "Low")
data$Net_Income_Cat <- ifelse(data$Net_Income >= median_net_income, "High", "Low")

contingency_table <- table(data$Revenue_Cat, data$Net_Income_Cat)

print("Contingency Table:")
print(contingency_table)

test_result <- chisq.test(contingency_table)

print(test_result)