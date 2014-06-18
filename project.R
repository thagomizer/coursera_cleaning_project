if (!file.exists("projectdata.zip")) {
  download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "projectdata.zip", method = "curl")
}

if (!file.exists("UCI_HAR_Dataset")) {
  unzip("projectdata.zip", exdir = "UCI_HAR_Dataset")
}
