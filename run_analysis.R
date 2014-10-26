library(reshape)
#Get the data from the various files
xtest <- read.table("UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("UCI HAR Dataset/test/y_test.txt")
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt")
activitylabels <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)
xtrain <- read.table("UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("UCI HAR Dataset/train/y_train.txt")
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
features <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)

#combine activity labels, subjects, and measurements into test and train data sets
testData <- cbind.data.frame(c(ytest, subjectTest, xtest))
trainData <- cbind.data.frame(c(ytrain, subjectTrain, xtrain))
#Extracts only the measurements of the mean and standard deviation
activities <- grepl(pattern = "mean", features[,2]) | grepl(pattern = "std", features[,2])
names <- c(features[,2][activities])

bigData <- rbind.data.frame(testData, trainData)

colnames(bigData) <- c("activity", "subject", names)
#Appropriately labels the data set with descriptive variable names. 
bigData$activity[compactData$activity == 1] <- "STANDING"
bigData$activity[compactData$activity == 2] <- "WALKING_UPSTAIRS"
bigData$activity[compactData$activity == 3] <- "WALKING_DOWNSTAIRS"
bigData$activity[compactData$activity == 4] <- "SITTING"
bigData$activity[compactData$activity == 5] <- "STANDING"
bigData$activity[compactData$activity == 6] <- "LAYING"

#second independent data set
compactData <- bigData[,activities]
colnames(compactData) <- c("activity", "subject", names)

#second independent tidy data set with the average of each variable for each activity and each subject
melted <- melt(compactData, id.vars = c("activity", "subject") )
tidyData <- cast(subject + activity ~ variable, data = melted, fun = mean)
#write to file
write.table(tidyData, "tidy.txt", row.names = FALSE)