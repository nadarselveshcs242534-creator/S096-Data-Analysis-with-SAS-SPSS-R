library(readr)

df <- read.csv("Student Mental health.csv", stringsAsFactors = TRUE)

colnames(df)[2] <- "Gender"
colnames(df)[6] <- "CGPA_Range"
colnames(df)[8] <- "Depression"

convert_cgpa <- function(x) {
  x <- trimws(as.character(x)) 
  if (x == "3.50 - 4.00") return(3.75)
  if (x == "3.00 - 3.49") return(3.245)
  if (x == "2.50 - 2.99") return(2.745)
  if (x == "2.00 - 2.49") return(2.245)
  if (x == "0 - 1.99")   return(1.0)
  return(NA)
}

df$CGPA_Numeric <- sapply(df$CGPA_Range, convert_cgpa)

model <- aov(CGPA_Numeric ~ Gender * Depression, data = df)

summary(model)

aggregate(CGPA_Numeric ~ Gender + Depression, data = df, FUN = mean)