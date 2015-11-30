##Project Goal
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

 You should create one R script called run_analysis.R that does the following. 

- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 

From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Good luck!
##Libraries Used
The `data.table` library was used in this project for efficient hadling with large datasets.
```{r}
library(data.table)
```
##Data for the project
The data for analysis was downloaded from <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip> 
The data has to be downloaded to working folder.

##Analysis steps
###Loading data
We load both test and train data.
```{r}
testData <- read.table("./UCI HAR Dataset/test/X_test.txt")
testData_actlabels <- read.table("./UCI HAR Dataset/test/y_test.txt")
trainData <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainData_actlabels <- read.table("./UCI HAR Dataset/train/y_train.txt")
SubjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
SubjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
actlabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
```

###Merging data
Then train and test datasets are merged in one dataset.
```{r}
Data <-rbind(testData, trainData)
```

###Data subsetting
The only mean and standart deviation values are ejected from original dataset
```{r}
meanstdcol <- grepl("mean", names(Data)) | grepl("std", names(Data)) | grepl("Mean", names(Data))
DataMeanStd <- Data[,meanstdcol]
```
###Apropriate data naming 
Then descriptive activity names  were used to name activities properly.
```{r}
for (i in actlabels[,1]) {
        tData[tData$action == actlabels[i,1],] <- actlabels[i,2]
```
###Desriptive renaming
Then shorted names are edited to more readable ones.
```{r}
names(Data) <- gsub("Acc", "Accelerator", names(Data))
names(Data) <- gsub("Mag", "Magnitude", names(Data))
names(Data) <- gsub("Gyro", "Gyroscope", names(Data))
names(Data) <- gsub("^t", "time", names(Data))
names(Data) <- gsub("^f", "frequency", names(Data))
```

###Final data set
Then inddendent tidy data set with the average of each variable for each activity and each subject s created
```{r}
DT <- data.table(Data)
tidy<-DT[,lapply(.SD,mean),by="subjects,action"]
write.table(tidy,file="tidy.txt",sep=",",row.names = FALSE)
```




