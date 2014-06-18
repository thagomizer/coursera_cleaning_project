Coursera Cleaning Project
=========================

In order to make the data tidy I did the following:

1. First I merged the training and testing sets together. Having the same data split into two sets of files is useful for machine learning but is not tidy. Merging the datasets puts all the similar data together.
1. Then I joined the measured data with the id of the subject and the activity the subject was undertaking at the time. Each observation includes the activity, the subject, and the measurements so to be tidy they need to be in one table. 
1. I used the activity_labels.txt file to map the activity id numbers (1 through 6) to human readable activity names. Tidy data uses human readable names.
1. I also used features.txt to label all the measurement columns with descriptions of what was being measured.
1. Since this assignment was focusing on means and standard deviations I filtered out the columns for other types of measurements. I used `grepl` to filter by the feature name and select only the features that had names containing "mean()" or "std()". I reviewed the feature list to ensure this was the right set before writing the code.
1. Finally, I used aggregate to figure out the mean for each measurement for each combination of subject and activity. I exported this data set so that others did not have to repeat the analysis if they chose not to. The code is included for reproducibility.



