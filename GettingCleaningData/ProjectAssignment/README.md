## FINAL PROJECT - GETTING AND CLEANING DATA COURSE
### PURPOSE
Demonstrate ability to collect, work with and clean a data set

### DATA SOURCE DESCRIPTIONS AND DATA SETS
1. http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
2. https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### DATASET
The dataset includes the following files:
=========================================

* 'README.txt'

* 'features_info.txt': Shows information about the variables used on the feature vector.

* 'features.txt': List of all features.

* 'activity_labels.txt': Links the class labels with their activity name.

* 'train/X_train.txt': Training set.

* 'train/y_train.txt': Training labels.

* 'test/X_test.txt': Test set.

* 'test/y_test.txt': Test labels.


### DELIVERABLES
1. a tidy data set	
	>> https://github.com/CSQUAH/datasciencecoursera/tree/master/GettingCleaningData/ProjectAssignment/mean_subs_actv_data.txt
2. A link to a Github repository with script for performing the analysis 
	>> https://github.com/CSQUAH/datasciencecoursera/tree/master/GettingCleaningData/ProjectAssignment/run_analysis.R
3. CodeBook.md : Code book that describes the variables, the data and any transformations or work that have been performed to clean up the data 
	>> https://github.com/CSQUAH/datasciencecoursera/tree/master/GettingCleaningData/ProjectAssignment/CodeBook.md
4. README.md explaining how all scripts work and how they are connected
	>> https://github.com/CSQUAH/datasciencecoursera/tree/master/GettingCleaningData/ProjectAssignment/README

### R script (run_analysis.R)
1. Merges the training and the test sets to create one data set
2. Extracts only the measurements on the mean and standard deviation for each measurement
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names
5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject
