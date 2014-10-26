GDCProject
==========

The run_analysis script takes the data from the various data files and combines them into a large data set including each measurement of each variable for each subject while performing each activity.

The large data set is then compressed into a smaller data set that only includes the variables measuring the mean and standard deviation of each type of measurement during each activities. 

The melt() and cast() functions are then used to subset the data by taking the mean of the various mean and standard deviations and putting them in the same row as their corresponding activity and subject. This can be compared to a database table using 2 primary keys.
