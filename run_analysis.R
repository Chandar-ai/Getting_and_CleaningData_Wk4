
rm(list=ls())

# Unzip the given Dataset to local directory
unzip(zipfile="C:/datasets/getdata_projectfiles_UCI HAR Dataset.zip", exdir="C:/datasets")

# lets check the dataset as zip file and the unzipped dataset in a new 'folder'
list.files("C:/datasets")


#define the path of the unzipped folder 
DataPath = file.path("C:/datasets", "UCI HAR Dataset")
DataPath

# By openning the unzipped file, one can see four text files, and two folders-one for test and another for train
# In each folder, there are 3 text files and one folder that contains 9 text files
# So totally 12+12+4 = 28 files. 
# lets see the nases of all these 28 files

# files = list.files(DataPath, recursive=FALSE)     # just for checking 
# files

files = list.files(DataPath, recursive=TRUE)
files


### Create seperate dataset for training and test set
### First reading the text files for TRAINING set --- xtrain, ytrain, and subject train

xtrain = read.table(file.path(DataPath, "train", "X_train.txt"),header = FALSE)
ytrain = read.table(file.path(DataPath, "train", "y_train.txt"),header = FALSE)
subject_train = read.table(file.path(DataPath, "train", "subject_train.txt"),header = FALSE)

# Now reading the text files for TEST set --- xtest, ytest, and subject test
xtest = read.table(file.path(DataPath, "test", "X_test.txt"),header = FALSE)
ytest = read.table(file.path(DataPath, "test", "y_test.txt"),header = FALSE)
subject_test = read.table(file.path(DataPath, "test", "subject_test.txt"),header = FALSE)

# Reading the text files related to 'features'
features = read.table(file.path(DataPath, "features.txt"),header = FALSE)

# Reading text files for  'activity labels data'
ActivityLabels = read.table(file.path(DataPath, "activity_labels.txt"),header = FALSE)
ActivityLabels



### Appropriately labels the data set with descriptive variable names (this ia actually 4th step)
### This 4th step should be run before 1st step since headers are required for step-2
### Assign Column names for train and test datasets
# Xtrain variable names are given in 'features'  
# Assign suitable column names to xtrain, ytrain and 'Train data' / subject_train 

colnames(xtrain) = features[,2]
colnames(ytrain) = "ActivityID"
colnames(subject_train) = "SubjectID"

# Xtest variable names are given in 'features' 
# Assign suitable column names to xtest, ytest and 'Test data' / subject_test 

colnames(xtest) = features[,2]
colnames(ytest) = "ActivityID"
colnames(subject_test) = "SubjectID"

# Assign column names for Activity Labels
colnames(ActivityLabels) <- c('ActivityID','ActivityType')



### 1. Merging the training and the test sets to create one data set
All_train = cbind(ytrain, subject_train, xtrain)
All_test = cbind(ytest, subject_test, xtest)

### Create the main data table by appending both train and test set
All_Data = rbind(All_train, All_test)
dim(All_Data)



### 2. Extracting only the measurements on the mean and standard deviation 
###    for each measurement

# Need step is to read all the values that are available
ColNames = colnames(All_Data)

### Getting a subset of all the Mean and Std.Deviations Columns alone and the respecive activityID and subjectID 
mean_std = (grepl("ActivityID" , ColNames) | grepl("SubjectID" , ColNames) | grepl("mean.." , ColNames) | grepl("std.." , ColNames))

## Creating a Subset to get the required dataset containing only mean and std.dev
MeanStd_Set <- All_Data[ , mean_std == TRUE]



### 3. Use descriptive activity names to name the activities in the data set
MeanStd_ActivityNames = merge(MeanStd_Set, ActivityLabels, by='ActivityID', all.x=TRUE)
head(MeanStd_ActivityNames[,78:82])	    # for checking purpose 


### 4. Appropriately labels the data set with descriptive variable names

# This labeling the dataset was already done before step-1. 
# The following are the vecotrs that have the labels

# Vectors:    MeanStd_Set and All_Data 


### From the data set in step 4, creates a second, independent tidy data set 
### with the average of each variable for each activity and each subject.

# Creation of 2nd independent tidy dataset with mean of all variables at activity and subject level
TidySet2 <- aggregate(. ~SubjectID + ActivityID, MeanStd_ActivityNames, mean)
TidySet2_final <- TidySet2[order(TidySet2$SubjectID, TidySet2$ActivityID),]

dim(TidySet2_final)
names(TidySet2_final)

### Save the final Tidy Dataset as a txt file with write.table()
### Write the ouput "TidySet2_final" to a text file 

write.table(TidySet2_final, "TidySet2_final.txt", row.name=FALSE)
