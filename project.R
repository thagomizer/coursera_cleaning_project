if (!file.exists("projectdata.zip")) {
  download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "projectdata.zip", method = "curl")
}

if (!file.exists("UCI_HAR_Dataset")) {
  unzip("projectdata.zip", exdir = "UCI_HAR_Dataset")
}

features <- read.csv("UCI_HAR_Dataset/features.txt", header = FALSE, sep="\n")[,1]

xTrain <- read.csv("UCI_HAR_Dataset/train/X_train.txt",
                   sep = "",
                   header = FALSE)
xTest <- read.csv("UCI_HAR_Dataset/test/X_test.txt",
                   sep = "",
                   header = FALSE)
xData <- rbind(xTrain, xTest)
names(xData) <- features

yTrain <- read.csv("UCI_HAR_Dataset/train/Y_train.txt",
                   sep = "",
                   header = FALSE)
yTest <- read.csv("UCI_HAR_Dataset/test/Y_test.txt",
                   sep = "",
                   header = FALSE)
yData <- rbind(yTrain, yTest)
names(yData) <- c("labels")

subjectTrain <- read.csv("UCI_HAR_Dataset/train/subject_train.txt",
                   sep = "",
                   header = FALSE)
subjectTest <- read.csv("UCI_HAR_Dataset/test/subject_test.txt",
                   sep = "",
                   header = FALSE)
subjectData <- rbind(subjectTrain, subjectTest)
names(subjectData) <- c("subject")

# Only select the columns for means or standard deviations 
meanOrStd <- grepl('mean', features) | grepl('std', features)
xData <- xData[,which(meanOrStd)]

# Create one massive data set
data <- cbind(subjectData, yData, xData)

