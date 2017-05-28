# Download the zip file

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
            "./UCI HAR Dataset.zip")

#unzip the downloaded file 
unzip("UCI HAR Dataset.zip")

# Read tables from txt files
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt",col.names = c("activity_id","activty_name"))
features <- read.table("./UCI HAR Dataset/features.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt",col.names = "subject_id")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt",col.names = "subject_id")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt",col.names = features[,2])
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt",col.names = "activity_id")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = "activity_id")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt",col.names = features[,2])

# 1 - Merges the training and the test sets to create one data set.
X_merge <- rbind (X_test,X_train)

# 2 - Extracts only the measurements on the mean and standard deviation for each measurement.
#Create vector to filter table X_merge
filter <- c(grep("std()",features[,2],fixed = TRUE),grep("mean()",features[,2],fixed = TRUE))

X_merge_mean_std <- X_merge[,filter]


#3 - Uses descriptive activity names to name the activities in the data set
# merge y_test and y_train 
y_merge <-  rbind (y_test,y_train)

# join y_merge with activity_label
y_merge_label <- merge(y_merge,activity_labels,by = "activity_id")

# merge X_merge_mean_std with y_merge_label
X_merge_label <- cbind(y_merge_label,X_merge_mean_std)

# 4 - Appropriately labels the data set with descriptive variable names.
#already done throught read.table 
names(X_merge_label)

# 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# add collumn for subject
X_subject <- cbind(subjects_all, X_merge_label)
# Group by both subject and activity
grp <- group_by(X_subject, subject_id, activty_name)
means_per_activity_subject <- summarise_each(grp,funs(mean))

write.table(means_per_activity_subject,file = "./means_per_activity_subject.txt",row.names = FALSE)

