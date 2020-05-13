
## Getting_Cleaning_Data_Course_Final_Assignment

* The aim of this project is to retrieve, understand and tidy a data set that can be used for future analysis.

* By using the following link, the raw data for this project can be downloaded: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

* The details of the experimental setup and collection of the data can be found through the following link:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones



## Files used to create the tidy data set

* CodeBook.md: provides a brief summary of the data collection and explanation of the raw data, steps followed during writing the R script to organize the data, variable list and measurements. 

* run_analysis.R: contains the entire coding that is necessary for tidying the data set.It includes downloading and unzipping the data used for this project, reorganization and combining the data, giving descriptive variable names to each measurement and finally step to tidy the data.

* "FinalTidyData.txt": is the independent tidy data set with the average of each variable for each activity and each subject. It is written out text file from run_analysis.R
