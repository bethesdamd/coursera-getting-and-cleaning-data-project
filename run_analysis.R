# run_analysis.R
# "Getting and Cleaning Data" course project
# August 24 2014
# https://class.coursera.org/getdata-006/human_grading/view/courses/972584/assessments/3/submissions
# It is assumed that this file is in a directory that 
# contains the "UCI HAR Dataset" directory
# setwd("/Users/david/coursera_data_science_track/getting_and_cleaning_data_course/project//UCI HAR Dataset")

if(!require(data.table)){install.packages("data.table")}

# Get raw features data; every other line will be a record number integer we discard later
features_raw <- scan("features.txt", sep=" ", what="list")

# Create a vector of even numbers, to discard the record number, i.e. 2,4,6,...1122
evens <- c(1:length(features_raw))[c(F,T)]

# Now discard record numbers which are not needed
col_names <- features_raw[evens]

# Find indices of column names containing 'std' or 'mean'
indices <- which(grepl("std", col_names) | grepl("mean", col_names))

# Read raw data
labels = read.fwf("activity_labels.txt", widths=c(2,50))
X_test = read.table("test/X_test.txt", colClasses="numeric")
y_test = read.table("test/y_test.txt", colClasses="numeric")
X_train = read.table("train/X_train.txt", header=F, colClasses="numeric")
y_train = read.table("train/y_train.txt", header=F, colClasses="numeric")
subject_train = read.table("train/subject_train.txt", colClasses="numeric")
subject_test = read.table("test/subject_test.txt", colClasses="numeric")

features <- rbind(X_train, X_test)  # Append these two data sets
final <- features[,indices]  # Only get the columns of interest (std and mean columns)

# Various assembly and addition of column names
names(final) <- col_names[indices]
tempsub <- rbind(subject_train, subject_test)
names(tempsub) <- c("Subject")
final <- cbind(final, tempsub)
tempact <- rbind(y_train, y_test)
names(tempact) <- c("ActivityCodes")
final <- cbind(final, tempact)

activityText <- list()
for(i in 1:nrow(final)) { 
      p <- final$ActivityCodes[i]
      newval <- as.character(labels$V2[p])
      activityText <- c(activityText, newval)
}
final$Activity <- activityText
final$ActivityCodes <- NULL

# Averages dataset:
# final[(final$Subject == 1 & final$Activity == "STANDING"),1]

cols <- col_names[indices]
c_names <- c("Subject", "Activity", cols)
out <- data.frame()
for(subject in unique(final$Subject))  {
      for(activity in unique(final$Activity)) {
            tmpDF <- data.frame()
            for(colIndex in 1:length(cols)) {
                  values <- final[(final$Subject == subject & final$Activity == activity), colIndex]
                  tmpDF[1,"Subject"] <- subject
                  tmpDF[1,"Activity"] <- activity
                  tmpDF[1,paste(sep="",cols[colIndex])] <- mean(values)
            }
            out <- rbind(out, tmpDF)
      }
}

write.table(out, file="averages.txt", row.name=F)




