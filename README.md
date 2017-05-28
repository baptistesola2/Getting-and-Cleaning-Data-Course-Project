# Getting-and-Cleaning-Data-Course-Project
Details regarding the data used is available here : http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The zip file containing all the data we use is available for downloads here : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip



The code book first downloads the zip file from the internet to the working dir.
Then the zip file is unzipped directly in the workking dir
Read all the relevant data tables into R, with proper naming of the collumns
Merge Test and training datasets
Filter the data set on std and mean variables only
Add column describing the activity for each row
Create a tidy data set with the average of each variable for each activity and each subject.


The files included in the analysis are :
  activity_labels.txt : contains the 6 activities with their respective ID
  features.txt : contains all the 561 names of the measurements
  subject_test.txt : the subject (id) linked to each of the test mesurement 
  subject_train.txt : the subject (id) linked to each of the train mesurement 
  X_test.txt : the feature vectors for testing
  X_train.txt : the feature vectors for training

