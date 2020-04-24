
## Codebook Description 
This document is a codebook that provides descriptions of the variables, summaries calculated, along with units, and other relevant information.

 
## Information about the Dataset:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

Source data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Description of the dataset from the source website (The UCI Machine Learning Repository): http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Attribute Information:
Information provided for each record in the dataset
1. Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
2. Triaxial Angular velocity from the gyroscope.
3. A 561-feature vector with time and frequency domain variables.
4. Its activity label.
5. An identifier of the subject who carried out the experiment.


## Project Overview
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for further analysis. 



### The goal of the project is to create one R script called "run_analysis.R" that should perform the following.

1. Merges the training and the test sets to create one data set. The train and test datasets are given in two seperate folder. These train and test dataset has to be merged to create a full dataset.
2. Extracts only the measurements on the mean and standard deviation for each measurement. Create a subset of the full dataset by extracting only columns corresponding to mean and standard deviations.
3. Uses descriptive activity names to name the activities in the data set. Descriptive activity names to be added to the data with only mean and standard deviation columns, including SubjectID and ActivityID.
4. Appropriately labels the data set with descriptive activity names. Assign Column names for train and test datasets. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. A tidy dataset has to be created with mean of all variables at activity and subject level. 


### Files Created in this project 

1. 'CodeBook.md' contains information on the Data set, Variables, transformations and work that was done to create a Tidy dataset.
2. 'run_analysis.R' is the code for the R script used to complete objectives of the project.
3. 'TidySet2_final.txt' is the final output from the 'runAnalysis.R' R script. 

