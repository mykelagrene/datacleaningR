#download and unpackage folder in working directory
#These are big files, so may wish to not download and extract files from RStudio

#fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(fileUrl, destfile = "UCI_HAR_DATASET.zip", method = "curl")
#unzip("UCI_HAR_DATASET.zip")



#create dataframes from each necessary file
#./UCI HAR Dataset/activity_labels.txt contains a table with activity labels
#./UCI HAR Dataset/features.txt contains a table with variable names

labels <- read.table("./UCI HAR Dataset/activity_labels.txt", sep = " ", col.names = c("code", "activity"))
features <- read.table("./UCI HAR Dataset/features.txt", sep = " ", col.names = c("column", "feature"))

#############################################################################
#test data
#./UCI HAR Dataset/test/X_test.txt contains data measurements
#./UCI HAR Dataset/test/y_test.txt contains activity codes for each row in X_test
#./UCI HAR Dataset/test/subject_test.txt contains subject number for each row in X_test

test_subj <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = "subj")
test_code <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names = "code")

#map activity labels to activity codes
#create a row index to allow return merged dataset to desired order
test_code$row <- 1:nrow(test_code)
#merge data frames
test_act <- merge(test_code, labels, by = "code")
#put back in correct order
test_act <- test_act[order(test_act$row),]

#create dataframe with activity and subject columns to add to data feature table
test_act_subj <- data.frame("activity" = test_act$activity, "subject" = test_subj$subj)


#read data set and give names to column labels
test_DF <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names = features$feature, colClasses = "numeric")


#extract  mean and standard deviation data
#create a logical vector from column names with "mean()"
mean_vector <- sapply(names(test_DF), function(x) any(grepl(".mean..", x)))
#create a logical vector from column names with "std()"
std_vector <- sapply(names(test_DF), function(x) any(grepl(".std..", x)))
#logically 'or' the 2 vectors
mean_std <- mean_vector | std_vector

#apply vector to data set to extract desired columns
test_mean_std <- test_DF[,mean_std]

#this still has unwanted variables for meanFreq, so remove them
freq_vector <- sapply(names(test_mean_std), function(x) any(grepl("Freq", x)))
test_mean_std <- test_mean_std[,!freq_vector]

#combine activity and subject information with data
DF1 <- cbind(test_act_subj, test_mean_std)

###########################################################################
#train data

#./UCI HAR Dataset/train/X_train.txt contains data measurements
#./UCI HAR Dataset/train/y_train.txt contains activity codes for each row in X_train
#./UCI HAR Dataset/train/subject_train.txt contains subject number for each row in X_train

train_subj <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = "subj")
train_code <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = "code")

#map activity labels to activity codes
#create a row index to allow return merged dataset to desired order
train_code$row <- 1:nrow(train_code)
#merge data frames
train_act <- merge(train_code, labels, by = "code")
#put back in correct order
train_act <- train_act[order(train_act$row),]

#create dataframe with activity and subject columns to add to data feature table
train_act_subj <- data.frame("activity" = train_act$activity, "subject" = train_subj$subj)


#read data set and give names to column labels
train_DF <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names = features$feature, colClasses = "numeric")


#extract  mean and standard deviation data
#create a logical vector from column names with "mean()"
mean_vector <- sapply(names(train_DF), function(x) any(grepl(".mean..", x)))
#create a logical vector from column names with "std()"
std_vector <- sapply(names(train_DF), function(x) any(grepl(".std..", x)))
#logically 'or' the 2 vectors
mean_std <- mean_vector | std_vector

#apply vector to data set to extract desired columns
train_mean_std <- train_DF[,mean_std]

#this still has unwanted variables for meanFreq, so remove them
freq_vector <- sapply(names(train_mean_std), function(x) any(grepl("Freq", x)))
train_mean_std <- train_mean_std[,!freq_vector]


#combine activity and subject information with data
DF2 <- cbind(train_act_subj, train_mean_std)


############################################################################

#combine test and train data sets
DF <- rbind(DF1, DF2)

#make variable names more readable using CamelCase
library(rapport)
names(DF) <- tocamel(names(DF))

############################################################################
#create tidy data set with average of each variable for each activity and each subject

#with ddply is easiest
library(plyr)
#tidy <- ddply(DF, .(activity, subject), colMeans) #doesn't work because activity is a factor
tidy <- ddply(DF, .(activity, subject), function(x) colMeans(x[-(1:2)]))

#output tidy data set to a file
write.table(tidy, file = "tidy_data_set.txt", row.names = FALSE)
