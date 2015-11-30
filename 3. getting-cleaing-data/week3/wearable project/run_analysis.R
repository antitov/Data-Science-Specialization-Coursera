library(data.table)
setwd("C:/Users/a.titov/rprog/getting-cleaing-data/week3/wearable project/")

testData <- read.table("./UCI HAR Dataset/test/X_test.txt")
testData_actlabels <- read.table("./UCI HAR Dataset/test/y_test.txt")
trainData <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainData_actlabels <- read.table("./UCI HAR Dataset/train/y_train.txt")
SubjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
SubjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
actlabels <- read.table("./UCI HAR Dataset/activity_labels.txt")

#adding names to columns from featurex.txt
names(testData) <- features[,2]
names(trainData) <- features[,2]

#adding new colums in both training and test sets for action labels and subjects
trainData$subjects <- SubjectTrain[,1]
trainData$action <- trainData_actlabels[,1]
testData$subjects <- SubjectTest[,1]
testData$action <- testData_actlabels[,1]

#1. Merges the training and the test sets to create one data set.s
Data <-rbind(testData, trainData)
#2. Extracts only the measurements on the mean and standard deviation for each measurement. 
meanstdcol <- grepl("mean", names(Data)) | grepl("std", names(Data)) | grepl("Mean", names(Data))
DataMeanStd <- Data[,meanstdcol]
#3. Uses descriptive activity names to name the activities in the data set
for (i in actlabels[,1]) {
        tData[tData$action == actlabels[i,1],] <- actlabels[i,2]
        
}
#4. Appropriately labels the data set with descriptive variable names.
names(Data) <- gsub("Acc", "Accelerator", names(Data))
names(Data) <- gsub("Mag", "Magnitude", names(Data))
names(Data) <- gsub("Gyro", "Gyroscope", names(Data))
names(Data) <- gsub("^t", "time", names(Data))
names(Data) <- gsub("^f", "frequency", names(Data))

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
DT <- data.table(Data)
tidy<-DT[,lapply(.SD,mean),by="subjects,action"]
write.table(tidy,file="tidy.txt",sep=",",row.names = FALSE)


