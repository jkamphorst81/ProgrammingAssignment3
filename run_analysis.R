## Getting and Cleaning Data assignment (assignment 3)
## 1/1/2025
## This code assumes the data is stored in a sub-folder called "UCI HAR Dataet"
## Change folders according to your own folder structure when using read.table


library(dplyr)
library(stringr)

## downloading the file
URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(URL, "zippedfile.zip")

## unzipping it, data is automatically stored in a sub directory called "UCI HAR Dataset"
unzip("zippedfile.zip")

## Reading data that is not specific to the train or test data
features <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = F, header = F)
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors = F, header = F)

## --------------------------Training set---------------------------------------
## reading the training data

train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt", stringsAsFactors = F, header = F)
train_X <- read.table("UCI HAR Dataset/train/X_train.txt", stringsAsFactors = F, header = F)
train_Y <- read.table("UCI HAR Dataset/train/y_train.txt", stringsAsFactors = F, header = F)

## assign the feature names in features to the variable names of the train dataset
names(train_X) <- features[,2]

## assigning a variable name to train_Y 
names(train_Y) <- "Activity"

## assigning a variable name to train_subject
names(train_subject) <- "Subject ID"

## combining the activity and the x dataset
Training_set <- cbind(train_Y, train_X)

## adding the Subject ID to the training set
Training_set <- cbind(train_subject, Training_set)

## --------------------------Training set---------------------------------------

## ----------------------------Test set-----------------------------------------
## reading the test data
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt", stringsAsFactors = F, header = F)
test_X <- read.table("UCI HAR Dataset/test/X_test.txt", stringsAsFactors = F, header = F)
test_Y <- read.table("UCI HAR Dataset/test/y_test.txt", stringsAsFactors = F, header = F)

## assign the feature names in features to the variable names of the test dataset
names(test_X) <- features[,2]

## assigning a variable name to test_Y 
names(test_Y) <- "Activity"

## assigning a variable name to test_subject
names(test_subject) <- "Subject ID"

## combining the activity and the x dataset
Test_set <- cbind(test_Y, test_X)

## adding the Subject ID to the test set
Test_set <- cbind(test_subject, Test_set)

## ----------------------------Test set-----------------------------------------
## ----------------------------merging------------------------------------------

## merging the training and test sets
Merged_dataset <- rbind(Training_set, Test_set)

## ----------------------------merging------------------------------------------

## -------- Extract the measurements on the mean and standard deviation --------

# Select columns containing "mean()" or "std()"

Merged_dataset <- select(Merged_dataset,  grep("Subject ID|Activity|mean()|std()", 
                                               names(Merged_dataset), value = TRUE)) 

## -------- Extract the measurements on the mean and standard deviation --------

## --- Use descriptive activity names to name the activities in the data set ---

## usine descriptive activity names for the activities
## using lef_join() to match the activity numbers in test_Y with those in
## activity_labels, to then replace the numbers with the accompanying test for ease of reading
Merged_dataset <- Merged_dataset %>%
  left_join(activity_labels, by = c("Activity" = "V1")) %>%
  mutate(Activity = V2) %>%
  select(-V2)

## --- Use descriptive activity names to name the activities in the data set ---

## ------ Appropriately labels the data set with descriptive variable name -----

names(Merged_dataset) <- names(Merged_dataset) %>%
  gsub("^t", "Time-", .) %>%
  gsub("^f", "FDS-", .) %>%
  gsub("\\()", "", .)

## ------ Appropriately labels the data set with descriptive variable name -----

## -Create data set with the avg of each variable for each activity and subject-

Avg_dataset <- Merged_dataset %>%
  group_by(`Subject ID`, Activity) %>%
  summarize(across(where(is.numeric), ~ mean(.x, na.rm = TRUE)), .groups = "drop")

## -Create data set with the avg of each variable for each activity and subject-

## ---------------------Writing tidy datasets to txt files----------------------

write.table(Merged_dataset, "Merged_dataset_tidy.txt", row.names = FALSE)
write.table(Avg_dataset, "AVG_dataset_tidy.txt", row.names = FALSE)

## ---------------------Writing tidy datasets to txt files----------------------