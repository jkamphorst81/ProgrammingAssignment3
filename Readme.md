
This readme file contains information about the documents in the repo for the 
Getting and Cleaning Data course assignment (assignment 3)

File in the repo:

1. run_analysis.R: This file contains all code to download the date and make it
tidy as specified by the assignment. Please note that the code assumes the 
UCI HAR Dataset folder is placed as a sub-folder in the folder with the R code. 
Please change the folder addresses for the read.table function accordingly when
that is different in your case. 

2. CodeBook.md: Contains information about the data, the variable names and their
meaning, and a description of teh data manipulations performed to make it tidy. 

3. Merged_dataset_tidy.txt: the tidy output data after parsing it through the R code

4. AVG_dataset_tidy.txt: as 3, but data was averaged across activities and subjects 

