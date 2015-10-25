# Coursera Getting and Cleaning Data project


# Get raw data from website 
setwd("~/Desktop/coursera/GACDProjectTidy")
getdata<-function(fileUrl, dir, filename, ext){
    # create directory if doesn't exist
    dirName<-paste(dir, sep = "")
    if(!file.exists(dirName)){
        dir.create(path = dirName)
    }
    # fetch data if not already downloaded
    pastehere<-paste("./", dirName,"/", filename, ext, sep = "")
    if(!file.exists(pastehere)){
        download.file(url = fileUrl, destfile = pastehere, 
                      method = "curl") 
        datedownloaded<-date() #To timestamp the download in case it's needed in analysis 
        #or if the site refreshes the data since your download
    }
    pastehere
}


# Get the raw data from the website, unzip it, and list the subdirectories and files
fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
temp<-getdata(fileUrl = fileURL, dir = "OriginalDataZipfile", 
              filename = "data", ext = ".zip")
thedata<-unzip(zipfile = temp)
thedata

file.rename(from="UCI HAR Dataset", to="ucihar") 



# Project requirement I: Merge the training and test sets to create one 
# data set.

trainData <- read.table("./ucihar/train/X_train.txt")
dim(trainData) 
head(trainData)
trainLabel <- read.table("./ucihar/train/y_train.txt")
table(trainLabel)
trainSubject <- read.table("./ucihar/train/subject_train.txt")
testData <- read.table("./ucihar/test/X_test.txt")
dim(testData) 
testLabel <- read.table("./ucihar/test/y_test.txt") 
table(testLabel) 
testSubject <- read.table("./ucihar/test/subject_test.txt")
joinData <- rbind(trainData, testData)
dim(joinData) 
joinLabel <- rbind(trainLabel, testLabel)
dim(joinLabel) 
joinSubject <- rbind(trainSubject, testSubject)
dim(joinSubject) 

# Project requirement II: Extracts only the measurements on the mean 
# and standard deviation for each measurement.. 
features <- read.table("./ucihar/features.txt")
dim(features)  
meanStdIndexes <- grep("mean\\(\\)|std\\(\\)", features[, 2])
length(meanStdIndexes) 
joinData <- joinData[, meanStdIndexes]
dim(joinData) 

# further grooming by using gsub for finding and replacing
names(joinData) <- gsub("\\(\\)", "", features[meanStdIndexes, 2])
names(joinData) <- gsub("mean", "Mean", names(joinData)) 
names(joinData) <- gsub("std", "Std", names(joinData)) 
names(joinData) <- gsub("-", "", names(joinData)) 

# Project Requirement III: Use descriptive activity names to name the activities 
# in the data set
activity <- read.table("./ucihar/activity_labels.txt")
activity[, 2] <- tolower(gsub("_", "", activity[, 2]))
substr(activity[2, 2], 8, 8) <- toupper(substr(activity[2, 2], 8, 8))
substr(activity[3, 2], 8, 8) <- toupper(substr(activity[3, 2], 8, 8))
activityLabel <- activity[joinLabel[, 1], 2]
joinLabel[, 1] <- activityLabel
names(joinLabel) <- "activity"

# Project Requirement IV: Appropriately labels the data set with descriptive 
# variable names

names(joinSubject) <- "subject"
cleanedData <- cbind(joinSubject, joinLabel, joinData)
dim(cleanedData) 
write.table(cleanedData, "joinedAndLabeledDataset.txt") # write dataset file to project directory

# Project requirement V:  From the data set above, creates a second, 
# independent tidy data set with the average of each variable for each 
# activity and each subject

subjectLen <- length(table(joinSubject)) # 30
activityLen <- dim(activity)[1] # 6
columnLen <- dim(cleanedData)[2]
result <- matrix(NA, nrow=subjectLen*activityLen, ncol=columnLen) 
result <- as.data.frame(result)
colnames(result) <- colnames(cleanedData)
row <- 1
for(i in 1:subjectLen) {
    for(j in 1:activityLen) {
        result[row, 1] <- sort(unique(joinSubject)[, 1])[i]
        result[row, 2] <- activity[j, 2]
        bool1 <- i == cleanedData$subject
        bool2 <- activity[j, 2] == cleanedData$activity
        result[row, 3:columnLen] <- colMeans(cleanedData[bool1&bool2, 3:columnLen])
        row <- row + 1
    }
}
head(result)
write.table(result, "tidyDataset.txt", row.name=FALSE) # write final dataset to project directory

# Tried a few ranges of rows (subjects) and columns (variables) by changing row and column ranges
# Uncomment the two lines below  and change 1:20 and 1:3 as you wish

# data <- read.table("./tidyDataset.txt")
# data[1:20, 1:3]

# data[1:181, 1:68] #header row is first row so 181 not 180 and Subject number and activity are 
# first two columns so 68 columns rather than 66 for each of the stdevs and 
# means
