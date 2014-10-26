
xtest <- read.table("UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("UCI HAR Dataset/test/y_test.txt")
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt")
activitylabels <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)
xtrain <- read.table("UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("UCI HAR Dataset/train/y_train.txt")
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
features <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)

testsources <- c(ytest, subjectTest, xtest)
trainsources <- c(ytrain, subjectTrain, xtrain)
activities <- grepl(pattern = "mean", features[,2]) | grepl(pattern = "std", features[,2])
names <- c(features[,2][activities])
columnNames <- c("activity", "subject", names)

testData <- cbind.data.frame(testsources)
trainData <- cbind.data.frame(trainsources)

bigData <- rbind.data.frame(testData, trainData)

compactData <- bigData[,activities]


melted <- melt(compactData, id.vars = c("activity", "subject") )
tidyData <- cast(subject + activity ~ variable, data = melted, fun = mean)


