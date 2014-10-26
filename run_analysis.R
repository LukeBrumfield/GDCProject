
xtest <- read.table("UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("UCI HAR Dataset/test/y_test.txt")
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt")
activitylabels <- read.table("UCI HAR Dataset/activity_labels.txt")
xtrain <- read.table("UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("UCI HAR Dataset/train/y_train.txt")
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
features <- read.table("UCI HAR Dataset/features.txt")

tests <- c(ytest, subjectTest, xtest)
trains <- c(ytrain, subjectTrain, xtrain)
bools <- grepl(pattern = "mean", features[,2]) | grepl(pattern = "std", features[,2])


#rowSums(data1)/ncol(data1)

#combined <- cbind.data.frame(testsubjects, data1)

#means[means[1] == 2,]