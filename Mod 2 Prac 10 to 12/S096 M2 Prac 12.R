# Load necessary libraries
library(ggplot2)
library(readr)

# 1. Load Data and Select First 20 Rows
# Adjust the filename if it's in a different folder
jee_data <- read_csv("JEE Mains 2013-25 Top Ranks.csv")
jee_subset <- head(jee_data, 20)

# 2. Calculate Correlation Matrix
# We select only the columns 'Total_Marks' and 'Percentile'
correlation_data <- jee_subset[, c("Total_Marks", "Percentile")]

# Compute the correlation matrix
cor_matrix <- cor(correlation_data)

# Print the result to the console
print("Correlation Matrix:")
print(cor_matrix)

# ---------------------------------------------------------
# Plot 1: Scatter Plot using ggplot2
# ---------------------------------------------------------
plot_scatter <- ggplot(jee_subset, aes(x = Total_Marks, y = Percentile)) +
  geom_point(color = "darkblue", size = 3) +
  geom_smooth(method = "lm", color = "red", se = FALSE) + # Adds a trend line
  theme_minimal() +
  labs(title = "Relationship: Total Marks vs Percentile",
       subtitle = "Analysis of the first 20 rows",
       x = "Total Marks",
       y = "Percentile")

# ---------------------------------------------------------
# Plot 2: Simple Correlation Heatmap (using basic R image)
# ---------------------------------------------------------
# This creates a simple visual of the matrix
heatmap(cor_matrix, 
        main = "Correlation Matrix Heatmap",
        col = colorRampPalette(c("blue", "white", "red"))(20),
        symm = TRUE)

# Print the scatter plot
print(plot_scatter)