GDCProject Codebook
==========

The data used in this project represents data collected from accelerometers from the Samsign Galaxy S smartphone. The various data files describe which subject of of 30 was having activity measured, the activity out of Walking, Walking Upstairs, Walking Downstairs, Standing, Laying, or Sitting, and the measurement from the acellerometer.

The variables used in the analysis:

The following are variables used to hold the data from the corresponding data files
subjectTrain
xtrain
yrain
subjectTrain
xtrain
ytrain
activityLabels
features

testdata, traindata - data frames created from combining the test and train data with the correct identifiers

BigData - Results from the combination of the test and training data

compactData - smaller data set that includes the measurements from only the mean and standard deviations of the accelerometer data

tidyData - generated after using the melt() and cast() functions on tidyData grouping the data by subject and activiy
