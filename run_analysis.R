library(data.table)


#Data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
#Description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Get the data
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipfile <- "dataset.zip"
download.file(url, destfile = zipfile)
unzip(zipfile)

# Load initial data
x_label <- read.table("UCI HAR Dataset/features.txt")

x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

# 1 Merges the training and the test sets to create one data set.
#Merge all rows
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)


# 4 Appropriately labels the data set with descriptive variable names. 
colnames(x) <- x_label$V2
colnames(y) <- c("Activity")
colnames(subject) <- c("Subject")

# Merge the columns
alldata <- cbind(x,y,subject)
#head(alldata)

# 2 Extracts only the measurements on the mean and standard deviation for each measurement. 
means <- grep("-mean\\(\\)", x_label$V2, value=TRUE)
stds <- grep("-std\\(\\)", x_label$V2, value=TRUE)
means_stds <- c(means, stds)
alldata2 <- alldata[, means_stds]
write.csv(alldata2, "measurements_mean_std.csv")


# 3 Uses descriptive activity names to name the activities in the data set
###alldata$Activity <- factor(alldata$Activity,levels=activity_labels$V1,labels=activity_labels$V2)
alldata$Activity <- factor(alldata$Activity,levels=activity_labels$V1,labels=activity_labels$V2)

# 5 Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
dt <- data.table(alldata)
tidy<-dt[,lapply(.SD,mean),by="Activity,Subject"]
write.table(tidy,file="tidydataset.csv",sep=",",row.names = FALSE)





