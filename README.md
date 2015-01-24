---
title: "README"
author: "Michael Green"
date: "01/24/2015"
output: html_document
---

This README file describes the files in this repo and their relationships.

This repo contains: 
tidy_data_set.txt - a data set of 68 columns and 180 rows
CodeBook.md - a markdown file that describes the variables and data in tidy_data_set.txt
run_analysis.R - an R script  that produced the tidy_data_set.txt file.

run_analysis.R will produce the tidy_data_set.txt file when run in the same directory as the unzipped archive obtained from this file: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

The script includes commands to download and unzip the file accordingly. Remove the '#' comments in order to do so.

The unzipped directory contains several files that run_analysis.R manipulates and combines in order to form a single data set and accomplish the following objectives:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The following steps outline how the script functions:

1. Download and unpackage folder in working directory
2. Create dataframes from each necessary file
        ./UCI HAR Dataset/activity_labels.txt contains a table with activity labels
        ./UCI HAR Dataset/features.txt contains a table with variable names
3. Create a dataframe with the test data
        ./UCI HAR Dataset/test/X_test.txt contains data measurements
        ./UCI HAR Dataset/test/y_test.txt contains activity codes for each row in X_test
        ./UCI HAR Dataset/test/subject_test.txt contains subject number for each row in X_test
4. Map activity labels to activity codes
5. Extract only mean() and stdev() data from data feature table
6. Add activity and subject columns to data feature table
7. Repeat steps 3-6 for train data.
        ./UCI HAR Dataset/train/X_train.txt contains data measurements
        ./UCI HAR Dataset/train/y_train.txt contains activity codes for each row in X_train
        ./UCI HAR Dataset/train/subject_train.txt contains subject number for each row in X_train
8. Combine the labeled test and train data sets
9. Compute the mean of each variable for each activity and each subject
10. Clean up the variable names
11. Write the final dataframe out to a file
