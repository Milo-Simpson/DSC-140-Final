library(readr)
library(ggplot2)
library(caret)
student_depression_dataset <- read_csv("Downloads/student_depression_dataset.csv")
View(student_depression_dataset)

problems(student_depression_dataset)

corr_table <- cor(student_depression_dataset[c(3,6,7,8,9,10,15,16,18)])
student_depression_dataset[student_depression_dataset == "Unknown"] <- NA
student_depression_dataset[student_depression_dataset == "UNK"] <- NA
student_depression_dataset[student_depression_dataset == "?"] <- NA

student_depression_dataset <- na.omit(student_depression_dataset)
student_depression_dataset <-  student_depression_dataset[, -c(7,10)]

View(corr_table)

print(corr_table)

colnames(student_depression_dataset)

library(tidyverse)

pivot_table <- student_depression_dataset %>%
  count(Gender, Depression) %>%
  pivot_wider(
    names_from = Depression,
    values_from = n
  )

View(pivot_table)

pivot <- student_depression_dataset %>% 
  count(Gender, Depression)

ggplot(pivot, aes(x = Gender, y = n, fill = Depression)) + geom_bar(stat = "identity", position = "dodge") +
  labs(
    title = "Depression by Gender",
    x = "Gender",
    y = "Count"
  ) 

ggplot(student_depression_dataset, aes(x = Age, y = CGPA)) + geom_point() +
  geom_smooth(method = "lm", col = "blue")

corr_age_gpa <- cor(student_depression_dataset$Age, student_depression_dataset$CGPA, method = "spearman")
print(corr_age_gpa)

cor.test(student_depression_dataset$Age, student_depression_dataset$CGPA, method = "pearson")

cor.test(student_depression_dataset$Age, student_depression_dataset$CGPA, method = "spearman")

x <- student_depression_dataset$Age[student_depression_dataset$Depression == 1]
y <- student_depression_dataset$Age[student_depression_dataset$Depression == 0]

ks.test(x, y)

colnames(student_depression_dataset)[colnames(student_depression_dataset) == "Study Satisfaction"] <- "StudySatisfaction"
colnames(student_depression_dataset)[colnames(student_depression_dataset) == "Work/Study Hours"] <- "StudyHours"

library(randomForest)
rf_model <- randomForest(CGPA ~ Age + Gender + StudySatisfaction + Degree, data = student_depression_dataset)
plot(rf_model)
print(rf_model)
importance(rf_model)

predictions <- predict(rf_model, student_depression_dataset)
plot(student_depression_dataset$CGPA, predictions,
     xlab="Actual CGPA", ylab="Predicted CGPA",
     main="RF Predictions vs Actual")
abline(0,1, col="red")