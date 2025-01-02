Codebook for Getting and Cleaning Data course, Assignment 3


The Data: 

The features selected for this database come from the accelerometer and gyroscope
3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 'Time' 
to denote time) were captured at a constant rate of 50 Hz. Then they were filtered 
using a median filter and a 3rd order low pass Butterworth filter with a corner 
frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then
separated into body and gravity acceleration signals (Time-BodyAcc-XYZ and Time-GravityAcc-XYZ) 
using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in 
time to obtain Jerk signals (Time-BodyAccJerk-XYZ and Time-BodyGyroJerk-XYZ). Also the 
magnitude of these three-dimensional signals were calculated using the Euclidean 
norm (Time-BodyAccMag, Time-GravityAccMag, Time-BodyAccJerkMag, Time-BodyGyroMag, 
Time-BodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing
FDS-BodyAcc-XYZ, FDS-BodyAccJerk-XYZ, FDS-BodyGyro-XYZ, FDS-BodyAccJerkMag, FDS-BodyGyroMag, 
FDS-BodyGyroJerkMag. (Note the 'FDS' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

More info to be found here: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

and the data was obtained from here:
 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


The variables:

Time-BodyAcc-XYZ
Time-GravityAcc-XYZ
Time-BodyAccJerk-XYZ
Time-BodyGyro-XYZ
Time-BodyGyroJerk-XYZ
Time-BodyAccMag
Time-GravityAccMag
Time-BodyAccJerkMag
Time-BodyGyroMag
Time-BodyGyroJerkMag
FDS-BodyAcc-XYZ
FDS-BodyAccJerk-XYZ
FDS-BodyGyro-XYZ
FDS-BodyAccMag
FDS-BodyAccJerkMag
FDS-BodyGyroMag
FDS-BodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean: Mean value
std: Standard deviation

Data transformations performed:

1. Merged training and test datasets 
2. Used descriptive activity names (standing, laying, sitting etc.) rather than numbers
3. Cleaned up variable names: replaced 't' with 'Time-', 'f' with "FDS-", and removed '()'
4. Performed operations as requested for assignment: only keep columns with mean and std data,
   averaged values per activity per subject.
