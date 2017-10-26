## Objective: R script called run_analysis.R that does the following.
# library used
library(dplyr)
library(reshape2)

#1 Merges the training and the test sets to create one data set.
      ## Step 1 : download the data file from data source provided if file haven't been downloaded
      url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
      setwd("d:/001_DS/GettingCleaningData/ProjectAssignment")
      if(!file.exists("Dataset.zip"))
      {
            download.file(url,destfile="./Dataset.zip",mode="wb") 
      }
      ## Step 2 : extract file
      unzip("Dataset.zip",overwrite=TRUE,unzip="internal",setTimes=FALSE)
      ## Step 3 : download all data to be merged
      train_sub <- read.table("UCI HAR Dataset/train/subject_train.txt", header=FALSE)
      train_activity <- read.table("UCI HAR Dataset/train/y_train.txt", header=FALSE)
      train_data <-read.table("UCI HAR Dataset/train/x_train.txt", header=FALSE)
      test_sub <- read.table("UCI HAR Dataset/test/subject_test.txt", header=FALSE)
      test_activity <- read.table("UCI HAR Dataset/test/y_test.txt", header=FALSE)
      test_data <-read.table("UCI HAR Dataset/test/x_test.txt", header=FALSE)
      ## Step 4 : merge training data and apply label 
      sub <- rbind(train_sub,test_sub)
      act <- rbind(train_activity,test_activity)
      meas <- rbind(train_data,test_data)
      ## Step 5 : label sub and activity
      colnames(sub)=c("Subject")
      colnames(act)=c("Activity")
      
#2 Extracts only the measurements on the mean and standard deviation for each measurement.
      ## Step 1 : download features as data frame
      features <- read.table("UCI HAR Dataset/features.txt",header=FALSE,col.names=c("Featureid","FeatureName"))
      ## Step 2: get index for features with Mean or Std
      colReq <- grep("mean|std",ignore.case = TRUE,features$FeatureName)
      ## Step 3: get dataset for based on required features
      meas_ds <- meas[,colReq]
      
#3 Uses descriptive activity names to name the activities in the data set
      ## Step 1 : download activity label as data frame
      activity_lbl <- read.table("UCI HAR Dataset/activity_labels.txt",header=FALSE,col.names=c("Activity","ActivityName"))
      ## Step 2: get meaningful name for activity in act_ds
      act_ds <- inner_join(act,activity_lbl,by="Activity")
      
#4 Appropriately labels the data set with descriptive variable names.
      ## Step 1: get values for measures
      colLbl <- grep("mean|std",ignore.case = TRUE,features$FeatureName,value=T)
      ## Step 2: replace - with _
      colLbl <- gsub("-","_",colLbl)
      ## Step 3: remove any non alphanumeric or underscore
      colLbl <- gsub("[^a-zA-Z\\d_]","",colLbl)
      ## Step 4: assign labels to meas_ds
      colnames(meas_ds)=colLbl

#5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
      ## Step 1: Merge the dataset to have both Subject and ActivityName
      merge_ds <- cbind(sub,act_ds[,c("ActivityName")],meas_ds)
      colnames(merge_ds)[2]<-c("ActivityName")
      ## Step 2: Melt the dataset
      melt_ds <- melt(merge_ds,
                      id=c("Subject","ActivityName"),
                      variable.name="variable",value.name="value")
      ## Step 3: Get the mean for the measurements
      mean_subs_actv_ds <- dcast(melt_ds,ActivityName+Subject~variable,mean)
      ## Step 4: Export the data
      write.table(mean_subs_actv_ds,file="mean_subs_actv_data.txt",sep=",",row.names = FALSE)
      write.table(mean_subs_actv_ds,file="mean_subs_actv_data.csv",sep=",",row.names = FALSE)
      