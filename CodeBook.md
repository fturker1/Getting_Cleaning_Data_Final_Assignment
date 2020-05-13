---
title: "CodeBook"
author: "Fulya Turker"
date: "5/12/2020"
output: html_document
---

## **Summary of the project**

The aim of this project is to prepare tidy data from a raw data set that is distributed to different files. 
The data was collected from a group of people (30 volunteers) that performed six activities, as described below,while they were wearing a smartphone (Samsung Galaxy SII) on the waist. The recordings were obtained as 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz by the help of smartphone's accelerometer and gyroscope functions. The datasets were distributed into two random groups: testing data (70% of the volunteers) and training data (30% of the volunteers). The acceleration signal has gravitational and body motion components and the raw results were applied to some proper filters to remove the noise. From the filtered results, a vector of features (described below) was obtained by calculating variables and frequency domain. 

## **Organizing data**

Script starts with codes required for making the data accessable (setting directory, unzipping the data, listing all the files in the folder). Following that, we proceed with loading the important packages that we use to tidy our data, with library() function.
First, data from two different data sets (training and testing data set) were merged to create one data set, that includes SubjectID and ActivityID that were stored on separate files. Next, we extract only the measurements on the mean and standard deviation for each measurement by the help of the grepl function. Each column name is changed into a descriptive variable names, and activity labels are converted into names of activities in the data set from the numeric values. Finally, an independent tidy data set with average of each variable for each activity and subject is created and ordered according to the first activityID, and then subjectID that makes it easier to read/understand the presented data.


## **Variable List**
##### Set of variables used in this dataset.

[1] "SubjectID"                                                  
[2] "ActivityID"                                                 
[3] "TimeDomain_BodyAccelerometer_mean_X"                        
[4] "TimeDomain_BodyAccelerometer_mean_Y"                        
[5] "TimeDomain_BodyAccelerometer_mean_Z"                        
[6] "TimeDomain_GravityAccelerometer_mean_X"                     
[7] "TimeDomain_GravityAccelerometer_mean_Y"                     
[8] "TimeDomain_GravityAccelerometer_mean_Z"                     
[9] "TimeDomain_BodyAccelerometerJerk_mean_X"                    
[10] "TimeDomain_BodyAccelerometerJerk_mean_Y"                    
[11] "TimeDomain_BodyAccelerometerJerk_mean_Z"                    
[12] "TimeDomain_BodyGyroscope_mean_X"                            
[13] "TimeDomain_BodyGyroscope_mean_Y"                            
[14] "TimeDomain_BodyGyroscope_mean_Z"                            
[15] "TimeDomain_BodyGyroscopeJerk_mean_X"                        
[16] "TimeDomain_BodyGyroscopeJerk_mean_Y"                        
[17] "TimeDomain_BodyGyroscopeJerk_mean_Z"                        
[18] "TimeDomain_BodyAccelerometerMagnitude_mean"                 
[19] "TimeDomain_GravityAccelerometerMagnitude_mean"              
[20] "TimeDomain_BodyAccelerometerJerkMagnitude_mean"             
[21] "TimeDomain_BodyGyroscopeMagnitude_mean"                     
[22] "TimeDomain_BodyGyroscopeJerkMagnitude_mean"                 
[23] "FrequencyDomain_BodyAccelerometer_mean_X"                   
[24] "FrequencyDomain_BodyAccelerometer_mean_Y"                   
[25] "FrequencyDomain_BodyAccelerometer_mean_Z"                   
[26] "FrequencyDomain_BodyAccelerometer_meanFreq_X"               
[27] "FrequencyDomain_BodyAccelerometer_meanFreq_Y"               
[28] "FrequencyDomain_BodyAccelerometer_meanFreq_Z"               
[29] "FrequencyDomain_BodyAccelerometerJerk_mean_X"               
[30] "FrequencyDomain_BodyAccelerometerJerk_mean_Y"               
[31] "FrequencyDomain_BodyAccelerometerJerk_mean_Z"               
[32] "FrequencyDomain_BodyAccelerometerJerk_meanFreq_X"           
[33] "FrequencyDomain_BodyAccelerometerJerk_meanFreq_Y"           
[34] "FrequencyDomain_BodyAccelerometerJerk_meanFreq_Z"           
[35] "FrequencyDomain_BodyGyroscope_mean_X"                       
[36] "FrequencyDomain_BodyGyroscope_mean_Y"                       
[37] "FrequencyDomain_BodyGyroscope_mean_Z"                       
[38] "FrequencyDomain_BodyGyroscope_meanFreq_X"                   
[39] "FrequencyDomain_BodyGyroscope_meanFreq_Y"                   
[40] "FrequencyDomain_BodyGyroscope_meanFreq_Z"                   
[41] "FrequencyDomain_BodyAccelerometerMagnitude_mean"            
[42] "FrequencyDomain_BodyAccelerometerMagnitude_meanFreq"        
[43] "FrequencyDomain_BodyBodyAccelerometerJerkMagnitude_mean"    
[44] "FrequencyDomain_BodyBodyAccelerometerJerkMagnitude_meanFreq"

[45] "FrequencyDomain_BodyBodyGyroscopeMagnitude_mean"            
[46] "FrequencyDomain_BodyBodyGyroscopeMagnitude_meanFreq"        
[47] "FrequencyDomain_BodyBodyGyroscopeJerkMagnitude_mean"        
[48] "FrequencyDomain_BodyBodyGyroscopeJerkMagnitude_meanFreq"    
[49] "TimeDomain_BodyAccelerometer_std_X"                         
[50] "TimeDomain_BodyAccelerometer_std_Y"                         
[51] "TimeDomain_BodyAccelerometer_std_Z"                         
[52] "TimeDomain_GravityAccelerometer_std_X"                      
[53] "TimeDomain_GravityAccelerometer_std_Y"                      
[54] "TimeDomain_GravityAccelerometer_std_Z"                      
[55] "TimeDomain_BodyAccelerometerJerk_std_X"                     
[56] "TimeDomain_BodyAccelerometerJerk_std_Y"                     
[57] "TimeDomain_BodyAccelerometerJerk_std_Z"                     
[58] "TimeDomain_BodyGyroscope_std_X"                             
[59] "TimeDomain_BodyGyroscope_std_Y"                             
[60] "TimeDomain_BodyGyroscope_std_Z"                             
[61] "TimeDomain_BodyGyroscopeJerk_std_X"                         
[62] "TimeDomain_BodyGyroscopeJerk_std_Y"                         
[63] "TimeDomain_BodyGyroscopeJerk_std_Z"                         
[64] "TimeDomain_BodyAccelerometerMagnitude_std"                  
[65] "TimeDomain_GravityAccelerometerMagnitude_std"               
[66] "TimeDomain_BodyAccelerometerJerkMagnitude_std"              
[67] "TimeDomain_BodyGyroscopeMagnitude_std"                      
[68] "TimeDomain_BodyGyroscopeJerkMagnitude_std"                  
[69] "FrequencyDomain_BodyAccelerometer_std_X"                    
[70] "FrequencyDomain_BodyAccelerometer_std_Y"                    
[71] "FrequencyDomain_BodyAccelerometer_std_Z"                    
[72] "FrequencyDomain_BodyAccelerometerJerk_std_X"                
[73] "FrequencyDomain_BodyAccelerometerJerk_std_Y"                
[74] "FrequencyDomain_BodyAccelerometerJerk_std_Z"                
[75] "FrequencyDomain_BodyGyroscope_std_X"                        
[76] "FrequencyDomain_BodyGyroscope_std_Y"                        
[77] "FrequencyDomain_BodyGyroscope_std_Z"                        
[78] "FrequencyDomain_BodyAccelerometerMagnitude_std"             
[79] "FrequencyDomain_BodyBodyAccelerometerJerkMagnitude_std"     
[80] "FrequencyDomain_BodyBodyGyroscopeMagnitude_std"             
[81] "FrequencyDomain_BodyBodyGyroscopeJerkMagnitude_std"         


## **Identifiers**
* SubjectID: The ID of the test subject.
* ActivityID: The type of activity performed when the respective measurement were taken. (1=WALKING,  2=WALKING_UPSTAIRS, 3=WALKING_DOWNSTAIRS, 4=SITTING, 5=STANDING, 6=LAYING)

## **Measurements**
* Acc is replaced by Accelerometer (units: standard gravity units 'g')
* Gyro is replaced by Gyroscope (units: radians/second)
* Mag is replaced by Magnitude
* Prefix t is replaced by TimeDomain
* Prefix f is replaced by FrequencyDomain

## **Activity labels**
As mentioned above, each activity has a corresponding numeric value

* Walking (1): Subject was walking during the test
* Walking_upstairs (2): Subject was walking up a staircase during the test
* Walking_downstairs (3): Subject was walking down a staircase during the test
* Sitting (4): Subject was sitting during the test
* Standing (5): Subject was standing during the test
* Laying (6): Subject was laying during the test

## **Final .txt file that contains the tidy data** 
"FinalTidyData.txt": is the independent tidy data set with the average of each variable for each activity and each subject.

## **Authors**
* Fulya Turker
