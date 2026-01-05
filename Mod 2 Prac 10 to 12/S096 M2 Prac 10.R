library(ggplot2)
library(dplyr)
library(tidyr)
library(readr)

# 1. Load Data (Top 5 rows only)
data <- read_csv("qualcomm_data.csv", n_max = 5)

# 2. Reshape data for plotting multiple lines
# We convert Revenue and Net_Income into a single column called 'Amount'
financial_trend <- data %>%
  select(Year, Revenue, Net_Income) %>%
  pivot_longer(cols = c("Revenue", "Net_Income"), 
               names_to = "Metric", 
               values_to = "Amount")

# 3. Create the Line Graph
ggplot(financial_trend, aes(x = Year, y = Amount, color = Metric, group = Metric)) +
  geom_line(size = 1.5) +          # Draw the lines (thicker for visibility)
  geom_point(size = 4) +           # Add points to mark exact years
  theme_minimal() +                # Clean theme
  scale_color_manual(values = c("Revenue" = "#3498db", "Net_Income" = "#e74c3c")) +
  labs(title = "Qualcomm Financial Trends (2018-2022)",
       subtitle = "Continuous Growth of Revenue vs Net Income",
       y = "Amount (USD Billions)",
       x = "Year") +
  theme(legend.position = "bottom") # Move legend to the bottom