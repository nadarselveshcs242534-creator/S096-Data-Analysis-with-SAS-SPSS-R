# Load necessary libraries
library(ggplot2)
library(dplyr)
library(readr)

# 1. Load Data
# Note: Ensure the file name matches your local file
data <- read_csv("Student Mental health.csv")

# 2. Rename columns for easier access (removing spaces and questions marks)
# This makes coding much cleaner than using backticks `Like This?` every time
colnames(data) <- c("Timestamp", "Gender", "Age", "Course", "Year_of_Study", 
                    "CGPA", "Marital_Status", "Depression", "Anxiety", 
                    "Panic_Attack", "Treatment")

# Remove rows where Age is missing (NA) to avoid warnings
data_clean <- data %>% filter(!is.na(Age))

# ---------------------------------------------------------
# Plot 1: Histogram of Age
# ---------------------------------------------------------
plot_hist <- ggplot(data_clean, aes(x = Age)) +
  geom_histogram(binwidth = 1, fill = "#69b3a2", color = "#e9ecef", alpha = 0.9) +
  geom_density(aes(y = ..count..), color = "darkblue", size = 1) + # Add a density curve overlay
  theme_minimal() +
  labs(title = "Distribution of Student Age",
       subtitle = "Frequency of students by age group",
       x = "Age",
       y = "Count of Students")

# ---------------------------------------------------------
# Plot 2: Box Plot (Age by Gender)
# ---------------------------------------------------------
plot_box_gender <- ggplot(data_clean, aes(x = Gender, y = Age, fill = Gender)) +
  geom_boxplot(outlier.colour = "red", outlier.shape = 1, outlier.size = 3) +
  scale_fill_manual(values = c("Female" = "#ffb7b2", "Male" = "#a2c2e0")) +
  theme_light() +
  labs(title = "Age Distribution by Gender",
       subtitle = "Comparison of age ranges between Female and Male students",
       x = "Gender",
       y = "Age") +
  theme(legend.position = "none") # Hide legend as x-axis is self-explanatory

# ---------------------------------------------------------
# Plot 3: Box Plot (Age by Depression Status)
# ---------------------------------------------------------
plot_box_dep <- ggplot(data_clean, aes(x = Depression, y = Age, fill = Depression)) +
  geom_boxplot() +
  scale_fill_brewer(palette = "Pastel1") +
  theme_minimal() +
  labs(title = "Age vs. Depression Status",
       x = "Do you have Depression?",
       y = "Age")

# Print the plots
print(plot_hist)
print(plot_box_gender)
print(plot_box_dep)