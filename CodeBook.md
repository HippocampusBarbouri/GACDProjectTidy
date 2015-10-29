##Getting and Cleaning Data Course Project Code Book



* The machine learning repository at University of California at Irvine is the source of the data used in this project (you can also learn more about the data, rationale, and experimental design used for data gathering):
  + http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
* The data was downloaded from:
  + https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
  
* Processing by the run_analysis.txt script includes:
  + Reading X_train.txt, y_train.txt and subject_train.txt files from the "./GACDProjectTidy/train" directory and assigning them to the trainData, trainLabel and trainSubject variables.
  
  + Reading X_test.txt, y_test.txt and subject_test.txt files from the "./GACDProjectTidy/test" directory and assigning them to the testData, testLabel and testsubject variables.
  
  + Concatenating testData to trainData to create the  joinData data frame; testLabel to trainLabel to create the joinLabel data frame; and testSubject to trainSubject to create the joinSubject data frame.
  
  + Reading the features.txt file from the "/GACDProjectTidy" folder and assigning the data to the features variable. Only measures of means and standard deviation are extracted resulting in a list of sixty-six columns/variables. The result is a subset of joinData with the 66 corresponding columns.
  
  + The column names of the subset are cleaned to remove the parentheses and hyphen characters in the names as well as replacing lowercase initial character in the words “mean” and “std” with uppercase (initcap).
  
  + Reading the activity_labels.txt file from the "./GACDProjectTidy" directory and storing the data in a variable named "activity".
  
  + Cleaning the activity names in the second column of activity. Changing all names to lowercase. If the name has an underscore between letters, remove the underscore and capitalize the letter immediately after (camelCase).

  + Transforming the values of joinLabel according to the activity data frame.
  
  + Combining the joinSubject, joinLabel and joinData data frames by column to get a new cleaned data frame named cleanedData.
  
  + Naming the first two columns "subject" and "activity". The "subject" column contains integers that range from 1 to 30; the "activity" column contains six kinds of activity; the last sixty-six columns contain measurements that range from that are greater than -1 and less than 1.

  + Writing the cleanedData out to "joinedAndLabeled.txt" file in current working directory.
  
  + The final tidy dataset named tidyDataset.txt contains the average of each measurement (means and standard deviations) for each activity and each subject. There are thirty subjects and six distinct activities therefore there are 30 * 6 = 180 combinations. For each combination, we calculate the mean of each measurement with the corresponding combination. There are sixty-six measures plus two columns for subject and activity for a total of sixty-eight columns.  There are 180 rows of data plus an initial header row (180 + 1 total rows)

###The Variables
<table>
+ subject_____________________________________Subject ID
+ activity_____________________________________The activity performed
+ tBodyAccMeanX_____________________________Mean time for acceleration of body for X direction
+ tBodyAccMeanY_____________________________Mean time for acceleration of body for Y direction
+ tBodyAccMeanZ_____________________________Mean time for acceleration of body for Z direction
+ tBodyAccStdX____________________________Standard deviation of time for acceleration of body for X direction
+ tBodyAccStdY____________________________Standard deviation of time for acceleration of body for Y direction
+ tBodyAccStdZ____________________________Standard deviation of time for acceleration of body for Z direction
+ tGravityAccMeanX_______________________________________Mean time of acceleration of gravity for X direction
+ tGravityAccMeanY_______________________________________Mean time of acceleration of gravity for Y direction
+ tGravityAccMeanZ_______________________________________Mean time of acceleration of gravity for Z direction
+ tGravityAccStdX_______________________Standard deviation of time of acceleration of gravity for X direction
+ tGravityAccStdY_______________________Standard deviation of time of acceleration of gravity for Y direction
+ tGravityAccStdZ_______________________Standard deviation of time of acceleration of gravity for Z direction
+ tBodyAccJerkMeanX___________________________Mean time of body acceleration jerk for X direction
+ tBodyAccJerkMeanY___________________________Mean time of body acceleration jerk for Y direction
+ tBodyAccJerkMeanZ__________________Mean time of body acceleration jerk for Z direction
+ tBodyAccJerkStdX_______________________Standard deviation of time of body acceleration jerk for X direction
+ tBodyAccJerkStdY_______________________Standard deviation of time of body acceleration jerk for Y direction
+ tBodyAccJerkStdZ_______________________Standard deviation of time of body acceleration jerk for Z direction
+ tBodyGyroMeanX_________________________Mean body gyroscope measurement for X direction
+ tBodyGyroMeanY_________________________Mean body gyroscope measurement for Y direction
+ tBodyGyroMeanZ_________________________Mean body gyroscope measurement for Z direction
+ tBodyGyroStdX_________Standard deviation of body gyroscope measurement for X direction
+ tBodyGyroStdY_________Standard deviation of body gyroscope measurement for Y direction
+ tBodyGyroStdZ_________Standard deviation of body gyroscope measurement for Z direction
+ tBodyGyroJerkMeanX_______________________________Mean jerk signal of body for X direction
+ tBodyGyroJerkMeanY_______________________________Mean jerk signal of body for Y direction
+ tBodyGyroJerkMeanZ_______________________________Mean jerk signal of body for Z direction
+ tBodyGyroJerkStdX______________________Standard deviation of jerk signal of body for X direction
+ tBodyGyroJerkStdY_____________________________Standard deviation of jerk signal of body for Y direction
+ tBodyGyroJerkStdZ_____________________________Standard deviation of jerk signal of body for Z direction
+ tBodyAccMagMean_______________________________________Mean magnitude of body Acc
+ tBodyAccMagStd_______________________________________Standard deviation of magnitude of body Acc
+ tGravityAccMagMean____________________________________Mean gravity acceleration magnitude
+ tGravityAccMagStd____________________________________Standard deviation of gravity acceleration magnitude
+ tBodyAccJerkMagMean__________________________________Mean magnitude of body acceleration jerk
+ tBodyAccJerkMagStd____________________________Standard deviation of magnitude of body acceleration jerk
+ tBodyGyroMagMean_____________________________________Mean magnitude of body gyroscope measurement
+ tBodyGyroMagStd_____________________Standard deviation of magnitude of body gyroscope measurement
+ tBodyGyroJerkMagMean___________Mean magnitude of body body gyroscope jerk measurement
+ tBodyGyroJerkMagStd______Standard deviation of magnitude of body body gyroscope jerk measurement
+ fBodyAccMeanX____________________________Mean frequency of body acceleration for X direction
+ fBodyAccMeanY____________________________Mean frequency of body acceleration for Y direction
+ fBodyAccMeanZ____________________________Mean frequency of body acceleration for Z direction
+ fBodyAccStdX___________________________Standard deviation of frequency of body acceleration for X direction
+ fBodyAccStdY___________________________Standard deviation of frequency of body acceleration for Y direction
+ fBodyAccStdZ___________________________Standard deviation of frequency of body acceleration for Z direction
+ fBodyAccJerkMeanX______________________________Mean frequency of body accerlation jerk for X direction
+ fBodyAccJerkMeanY______________________________Mean frequency of body accerlation jerk for Y direction
+ fBodyAccJerkMeanZ______________________________Mean frequency of body accerlation jerk for Z direction
+ fBodyAccJerkStdX______________________Standard deviation frequency of body accerlation jerk for X direction
+ fBodyAccJerkStdY______________________Standard deviation frequency of body accerlation jerk for Y direction
+ fBodyAccJerkStdZ______________________Standard deviation frequency of body accerlation jerk for Z direction
+ fBodyGyroMeanX________________________Mean frequency of body gyroscope measurement for X direction
+ fBodyGyroMeanY________________________Mean frequency of body gyroscope measurement for Y direction
+ fBodyGyroMeanZ________________________Mean frequency of body gyroscope measurement for Z direction
+ fBodyGyroStdX_____Standard deviation frequency of body gyroscope measurement for X direction
+ fBodyGyroStdY_____Standard deviation frequency of body gyroscope measurement for Y direction
+ fBodyGyroStdZ_____Standard deviation frequency of body gyroscope measurement for Z direction
+ fBodyAccMagMean_______________________Mean frequency of body acceleration magnitude
+ fBodyAccMagStd____________Standard deviation of frequency of body acceleration magnitude
+ fBodyBodyAccJerkMagMean_______________Mean frequency of body acceleration jerk magnitude
+ fBodyBodyAccJerkMagStd_______Standard deviation of frequency of body acceleration jerk magnitude
+ fBodyBodyGyroMagMean_________________Mean frequency of magnitude of body gyroscope measurement
+ fBodyBodyGyroMagStd________Standard deviation of frequency of magnitude of body gyroscope measurement
+ fBodyBodyGyroJerkMagMean_______Mean frequency of magnitude of body gyroscope jerk measurement
+ fBodyBodyGyroJerkMagStd___Standard deviation frequency of magnitude of body gyroscope jerk measurement
