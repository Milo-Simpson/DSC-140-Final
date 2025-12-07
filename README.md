# DSC-140-Final
#This code performs analysis on a data set containing 17 columns of data about students in the Middle East with their academic and mental health information. A neaural network calssification model was run to try and predict whether or not a student had depression. It also contains a random forest model that aims to predict GPA of the students.

Milo Simpson
DSC 140
12/07/25


Student Depression Analysis

           The data set used in this report: student_depression_data, contains information about graduate students in the Middle East. This data set contains 17 columns: Gender, Age, City, Profession, Academic Pressure, Work Pressure, CGPA, Study Satisfaction, Job Satisfaction, Sleep Duration, Dietary Habits, Degree, Thoughts of Suicide, Study Hours, Financial Stress, Family History of Mental Illness, and Depression. After some data cleaning, the columns Work Pressure and Job Satisfaction were removed because all of the inputs for those columns were unknown. A classification analysis was performed to attempt to predict weather a student had depression or not. A neural network classifier used the inputs Academic Pressure, Study Satisfaction, Financial Stress, and Sleep Duration were used to predict depression. A random forest model was also used to explore the relationship between a student's GPA and Gender, Age, Study Satisfaction, and Degree. This data set was chosen because if the warning signs of depression are found, students can receive help quicker and without having to go through the hard experience of reaching out.

           Basic analysis of the data set was performed to investigate any potential trends in the data. The first question that was investigated was if age and GPA had a correlation. If students had been in schooling for longer they may have a better GPA with more experience. 



           
A scatter plot was created plotting age and CGPA, a linear regression line was also added to the graph to show correlation. A Pearson and Spearman correlation values were also done to look into the correlation of these two variables. The linear regression line had a slope of 0 which shows that there is no correlation between student age and GPA. The Pearson analysis gave a score of 0.005 and a p value of 0.3967 both of which show no correlation between the data. The Spearman analysis gave a rho value of 0.007 and a p value of 0.2342 once again showing no correlation between the data.

           Next the factors of depression were investigated. The first question that was asked was is there a correlation between gender and depression? A bar plot was created showing the difference in frequency of depression between males and females.


As seen in the graph above, there was a higher number of male students with depression. Although this could be due to the fact that there were more males in the data set than females. To avoid this potential bias, other factors of depression were explored. The next variable that was looked into was dietary habits. potentially the better students ate the less likely they were to have depression. A pivot table as well as a stacked bar plot was made to show the frequency of depression for each category of dietary habits






Both of these graphs show that the healthier the diet the less likely a student was to be depressed. A chi-squared test was performed to confirm this theory and it gave a p value of 1.43e-260. That value is incredibly small meaning that the null hypothesis of no correlation between diet and depression can be rejected. The most common dietary habits were also explored, a KDE plot was created to show the most common diet in the data set. It showed that unhealthy unfortunately was the most common diet reported by students


           


           After, a neural network classification was performed to try and predict whether a student had depression. This model took the inputs Academic Pressure, Study Satisfaction, Financial Stress, Sleep Duration, as well as Dietary Habits. Since both Sleep Duration and Dietary Habits are both categorical data, another column had to be created converting each input into its own numerical value using label encoder. After running the model, it produced an accuracy score of 77.6%.



           Finally a random forest model was used to try and predict the students GPA based off of Age, Gender, Study Satisfaction, and Degree. A random forest model works by a large amount of different decision trees that see that make predictions of the target variable. All of their predictions are then averaged. This model prevents overfitting since so many different inputs go into its prediction, it can also handle categorical data so no label encoding was necessary. The random forest model gave a root mean squared error of 2.14 which for a 10 point grading scale is not good. 




If the model were more accurate the line would follow the shape of the data, but since it does not align with almost any of the data points this model is not very accurate.



Bibliography
Zubair Dhuddi. “Student Mental Health & Depression Indicators Data.” Kaggle.com, 2025, www.kaggle.com/datasets/zubairdhuddi/student-dataset.
