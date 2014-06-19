Coursera Cleaning Project
=========================

## Overview

My cleaning code is all contained within `run_analysis.R`.

The script first starts by downloadig and unzipping the files (if they haven't been downloaded already). Once that is done the `subject_test.txt` and `subject_train.txt` files are read into R using `read.csv`. It is common when doing machine learning to split the data in half and use one set for training and one for testing and that appears to be what was done here. Since all the data was collected in the same way and at the same time I combine the two datasets using `rbind` and then add a useful column name for this data set.

After the subject data is read and merged into one data set the activity labels are read in. These correspond an activity with a numeric key used to identify the activity in the data set. The `Y_train.txt` and `Y_test.txt` files are read the same way the subject data was read and bound together as well. These files identify which activity the subject was doing when the measurements were recorded. Once the training and test data has merged the activity labels (like walking, sitting, etc) are joined with the `y` data using the `join` function from `plyr`. This gave me a human readable way to identify the activities instead of the numbers they were assigned. Once this was done I again assigned human readable names to the columns.

The meat of the cleaning is reading in the features that the scientists recorded. This is in the `X_train.txt` and `X_test.txt` files and there is a lot of data. Again the test and training data were joined with the `rbind` function. The descriptions/lables for the  measurements are in the `features.txt` file and I read that in with `read.csv` as well. I then used feature data as the names for columns of this dataset.

After this I needed to filter out all but the features that measured mean or standard deviation. I did this by greping the feature names for 'mean()' or 'std()' and then selecting the columns where the column name contained either 'mean()' or 'std()' using the `which` function.

Once all that was done I joined the subject, activity, and measurement data togethere into one large data frame using `cbind`. I then used the aggregate function to take the mean of the measurement columns (columns 4 to the end in my data set). This summarized the thousands of rows into many fewer to make it easier for others to understand.

Finally, I wrote the tidy data set out to a file (ActivityData_Tidy.csv) using `write.table`. Using `write.table` means that others will be able import the table from that file and not have to repeat the whole analysis.

## Why I believe this dataset is tidier than the starting data set

In the lecture notes there were four points describing tidy data:

1. Each variable you measure should be in one column.
1. Each different observation of that variable should be in a different row.
1. There should be one table for each "kind" of data.
1. If there are multiple tables they should include a column that allows them to be linked.

The tidy data set I created has one variable per column. I included the activity name but not the id because that would be including the same variable in two columns. I chose to include the activity name instead of the id beacuse the name is human readable and comprehensible but the id is not.

The tidy data set I created defines an observation as a pairing of subject and activity. So Subject 1 Walking is one observation even if the scientists took several measurements during that phase of the experiment. By aggregating on activity name and subject I summarized each observation and did not include duplicates.

My tidy data set has only one table so there is definitely one table for each "kind" of data. I also don't have to worry about linking between tables.
