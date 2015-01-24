---
title: "CodeBook"
author: "Michael Green"
date: "01/24/2015"
output: html_document
---


This document describes the variables, data, and transformations for the data set tidy_data_set.txt.

tidy_data_set.txt represents the results of the script run_analysis.R. Details for how this script functions can be found in the README.md file in this repo.

The original data set from which tidy_data_set.txt was derived can be found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This data was downloaded on Jan 12 2015 at 15:09 HST.

The original data represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones



Variables:

"activity"
"subject"
"tBodyAccMeanX"
"tBodyAccMeanY"
"tBodyAccMeanZ"
"tBodyAccStdX"
"tBodyAccStdY"
"tBodyAccStdZ"
"tGravityAccMeanX"
"tGravityAccMeanY"
"tGravityAccMeanZ"
"tGravityAccStdX"
"tGravityAccStdY"
"tGravityAccStdZ"
"tBodyAccJerkMeanX"
"tBodyAccJerkMeanY"
"tBodyAccJerkMeanZ"
"tBodyAccJerkStdX"
"tBodyAccJerkStdY"
"tBodyAccJerkStdZ"
"tBodyGyroMeanX"
"tBodyGyroMeanY"
"tBodyGyroMeanZ"
"tBodyGyroStdX"
"tBodyGyroStdY"
"tBodyGyroStdZ"
"tBodyGyroJerkMeanX"
"tBodyGyroJerkMeanY"
"tBodyGyroJerkMeanZ"
"tBodyGyroJerkStdX"
"tBodyGyroJerkStdY"
"tBodyGyroJerkStdZ"
"tBodyAccMagMean"
"tBodyAccMagStd"
"tGravityAccMagMean"
"tGravityAccMagStd"
"tBodyAccJerkMagMean"
"tBodyAccJerkMagStd"
"tBodyGyroMagMean"
"tBodyGyroMagStd"
"tBodyGyroJerkMagMean"
"tBodyGyroJerkMagStd"
"fBodyAccMeanX"
"fBodyAccMeanY"
"fBodyAccMeanZ"
"fBodyAccStdX"
"fBodyAccStdY"
"fBodyAccStdZ"
"fBodyAccJerkMeanX"
"fBodyAccJerkMeanY"
"fBodyAccJerkMeanZ"
"fBodyAccJerkStdX"
"fBodyAccJerkStdY"
"fBodyAccJerkStdZ"
"fBodyGyroMeanX"
"fBodyGyroMeanY"
"fBodyGyroMeanZ"
"fBodyGyroStdX"
"fBodyGyroStdY"
"fBodyGyroStdZ"
"fBodyAccMagMean"
"fBodyAccMagStd"
"fBodyBodyAccJerkMagMean"
"fBodyBodyAccJerkMagStd"
"fBodyBodyGyroMagMean"
"fBodyBodyGyroMagStd"
"fBodyBodyGyroJerkMagMean"
"fBodyBodyGyroJerkMagStd"

"activity" values are the strings LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, and WALKING_UPSTAIRS.

"subject" values are integer values from 1 to 30 representing the 30 people that were subjects of the study.

The remaining variable values are numerical values between -1.0 and 1.0 representing normalized means of measurements for each activity and subject.

The data:
The data that was normalized and averaged to produce the data in tidy_data_set.txt come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals and used in the tidy_data_set are: 

mean(): Mean value
std(): Standard deviation

Transformations:
The mean of multiple measurements for each activity and subject was calculated.

In addition, variable names were changed from the original data set to camelcase in order to improve readability.
