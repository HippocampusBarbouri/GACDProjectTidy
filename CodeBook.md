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
