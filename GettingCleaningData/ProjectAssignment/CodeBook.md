## CODE BOOK
### Code book that describes the variables, the data and any transformations or work that have been performed to clean up the data

### VARIABLES
* #### train_sub		: 
	 + raw stats from UCI HAR Dataset/train/subject_train.txt inserted as data frame consists of 7352 rows of Subject of experiment
* #### train_activity
	 + raw stats from UCI HAR Dataset/train/y_train.txt inserted as data frame consists of 7352 rows of Activity (id) of experiment
* #### train_data
	 + raw stats from UCI HAR Dataset/train/x_train.txt inserted as data frame consists of 7352 rows and 561 columns having measurement of experiment
* #### test_sub
	 + raw stats from UCI HAR Dataset/test/subject_test.txt inserted as data frame consists of 2947 rows of Subject of experiment
* #### test_activity
	 + raw stats from UCI HAR Dataset/test/y_test.txt inserted as data frame consists of 2947 rows of Activity (id) of experiment
* #### test_data
	 + raw stats from UCI HAR Dataset/test/x_test.txt inserted as data frame consists of 2947 rows and 561 columns having measurement of experiment
* #### sub
	 + data frame merging both training and test data for subscribers
* #### act
	 + data frame merging both training and test data for activities
* #### meas
	 + data frame merging both training and test data for measurements
* #### features
	 + raw stats from UCI HAR Dataset/features.txt consisting of mapping of the features id and feature_name (measurements)
* #### colReq
	 + list containing position for required fields (mean/std) from features
* #### meas_ds
	 + data from meas filtering only based on colReq
* ####
	 + raw stats from UCI HAR Dataset/activity_labels.txt consisting of mapping of activity id and activity name
* #### act_ds	 
	+ data set that contains activity name instead of only activity id for act
* #### colLbl	 
	+ appropriate names used for labeling the measurements for the meas_ds
* #### merge_ds
	 + data set consisting of subjects, activity name as well as measurements required in project
* #### melt_ds
	 + melted dataset from merge_ds to be used to perform casting
* #### mean_subs_actv_ds
	 + data set casted from melt_ds consisting of mean of the measurements based on Subject and Activity


### DATA
* Data source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Description about the data: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### TRANSFORMATION
1. Similar dataset for training and testing data are merged using rbind 
	i. 	train_sub+test_sub > sub
	ii.	train_activity+test_activity >act
	iii.train_data+test_data > meas
2. Required features are selected and filtered for meas_ds
3. Meaningful name used for activity by joining act and activity_lbl to come out with act_ds
4. Replace "-" with "_" and remove nonalphanumeric characters from feature_name to produce appropriate label for measurements
5. Combine subject,act_ds(activityName) and meas_ds to get merge_ds
6. Melt merge_ds into melt_ds and recast into mean_subs_actv_ds to get the mean value of each measurements by subjects and activity
7. Writing the final result to mean_subs_actv_data.txt using write.table
	
	
