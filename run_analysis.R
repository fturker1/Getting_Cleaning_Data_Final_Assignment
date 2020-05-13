
##Set the name of the directory to be downloaded
dirname <- "Data.zip"
##Write an if function that dowloads the file if the file is not there
if (!file.exists(dirname)) {
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileUrl, dirname, method = "curl")
}
##If the directory from the unzipped version is not there, unzip Data.zip
if (!file.exists("UCI HAR Dataset")) {
        unzip(dirname)
}
##Call all the files under the folder.
files <- list.files("UCI HAR Dataset", recursive = TRUE)

##Load required packages:
library(data.table)
library(dplyr)
library(tidyr)

##1. Merges the training and the test sets to create one data set.
##Start creating the data sets by combining the right files that would differentiate the "train", "test", "features" and "activitylabels"
##Train tables:
xtraindata <- read.table(file.path("UCI HAR Dataset", "train", "X_train.txt"),header = FALSE)
ytraindata <- read.table(file.path("UCI HAR Dataset", "train", "y_train.txt"),header = FALSE)
subtrain <- read.table(file.path("UCI HAR Dataset", "train", "subject_train.txt"),header = FALSE)
##Test tables:
xtestdata <- read.table(file.path("UCI HAR Dataset", "test", "X_test.txt"),header = FALSE)
ytestdata <- read.table(file.path("UCI HAR Dataset", "test", "y_test.txt"),header = FALSE)
subtest <- read.table(file.path("UCI HAR Dataset", "test", "subject_test.txt"),header = FALSE)
##Features data:
features <- read.table(file.path("UCI HAR Dataset", "features.txt"),header = FALSE)
#Activity labels data:
activity_labels <- read.table(file.path("UCI HAR Dataset", "activity_labels.txt"),header = FALSE)


##Name the objects with proper column names that will make it easier to follow the order and merging process

##Naming of train table columns:
colnames(subtrain) <- "SubjectID"
colnames(xtraindata) <- features$V2
colnames(ytraindata) <- "ActivityID"

##Naming of test table columns:
colnames(subtest) <- "SubjectID"
colnames(xtestdata) <- features$V2
colnames(ytestdata) <- "ActivityID"

##Naming of activity_lables table columns:
colnames(activity_labels) <- c("ActivityID", "ActivityType")

##By using cbind function, merge train and test files independently:
#merge the train data:
train_merged <- cbind(ytraindata, subtrain, xtraindata)
test_merged <- cbind(ytestdata, subtest, xtestdata)

##Combined train and test data by adding rows together
combined <- rbind(train_merged, test_merged)

##2.Extracts only the measurements on the mean and standard deviation for each measurement.
##Extract columns with ActivityID, SubjectID, mean, std
## Step1. Create an object with only mean values & since grepl is a logical function, we need to find a way to convert it to values
combined_mean <- grepl("mean..", colnames(combined))
final_mean <- combined[ , combined_mean == TRUE]
## Step2. Create an object with only std values & since grepl is a logical function, we need to find a way to convert it to values
combined_std <- grepl("std..", colnames(combined))
final_std <- combined[ , combined_std == TRUE]
##Bind columns of different object to create the tidy, summarized data table by cbind function
mean_std_combined <- cbind("ActivityID" = combined$ActivityID, "SubjectID" = combined$SubjectID, final_mean, final_std)

##Uses descriptive activity names to name the activities in the data set
##Merge ActivityID table with mean_std_combined table by ordering them (using the common column in both data set) of ActivityID
activity_names_mean_std <- merge(mean_std_combined, activity_labels, by= "ActivityID")

##4.Appropriately labels the data set with descriptive variable names.
##Rename the column names so that each column will have an easy-to-understand and descriptive variable names
##by using gsub funtion to substitute new names.

descriptive_names <- names(activity_names_mean_std)

descriptive_names <- gsub("-mean-", "_Mean_", descriptive_names)
descriptive_names <- gsub("-std-", "_StandardDeviation_", descriptive_names)
descriptive_names <- gsub("-", "_", descriptive_names)
descriptive_names <- gsub("[(][)]", "", descriptive_names)
descriptive_names <- gsub("Acc", "Accelerometer", descriptive_names)
descriptive_names <- gsub("Gyro", "Gyroscope", descriptive_names)
descriptive_names <- gsub("Mag", "Magnitude", descriptive_names)
descriptive_names <- gsub("^t", "TimeDomain_", descriptive_names)
descriptive_names <- gsub("^f", "FrequencyDomain_", descriptive_names)

names(activity_names_mean_std) <- descriptive_names
activity_names_mean_std$ActivityID <- factor(activity_names_mean_std$ActivityID, levels = activity_labels[,1],
                            labels = activity_labels[,2])

##From the data set in step 4, creates a second, independent tidy data set with the average of each variable for 
##each activity and each subject.
##To apply single function (mean) to multiple groups, we should use the "aggregate" function from dplyr package
##but first we have to group the table by ActivityID and SubjectID so that mean of columns will be divided into 
##meaningful values such as mean of third column that represents ActivityID=1.
tidy_data <- aggregate(. ~SubjectID + ActivityID, activity_names_mean_std, mean)
final_tidy_data <- tidy_data[order(tidy_data$SubjectID, tidy_data$ActivityID),]
final_tidy_data <- final_tidy_data[,1:81]

##Write output into a text file
write.table(final_tidy_data, "FinalTidyData.txt", row.name=FALSE)
