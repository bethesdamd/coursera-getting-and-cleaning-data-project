# There are 561 features in features.txt
# X_test has 2947 lines of data with 561 records each
# Y_test has only 2947 records total, so I guess it's one column of data
# 1,653,267 total elements once cleaned
#
# X_train has 7352 lines with 561 records per line
# Y_train has 7352 records total, so one column
# 4,124,472 total records

# every 16 characters is a record, right-justified

# So I guess cbind Y_test to the first column of X_test
# and cbind Y_train to the first column of X_train
# Then rbind 561 records of features.txt to the first row of both, which both have 561 columns
if(!require(data.table)){install.packages("data.table")}
setwd("/Users/david/coursera_data_science_track/getting_and_cleaning_data_course/project//UCI HAR Dataset")

# Get raw features data; every other line will be a record number integer we discard later
features_raw <- scan("features.txt", sep=" ", what="list")

# Create a vector of even numbers, to discard the record number, i.e. 2,4,6,...1122
evens <- c(1:length(features_raw))[c(F,T)]

# Discard record numbers which are not needed
col_names <- features_raw[evens]

# Find indices of column names containing 'std' or 'mean'
indices <- which(grepl("std", col_names) | grepl("mean", col_names))

# to read in X_test.txt, try this, however it doesn't create a data frame:
# watch for two leading spaces at the begining of the file
# this might be a fixed delimited file?  however those two leading spaces are only on the 
# FIRST line of the file, not on all lines...
# X_test <- scan("test/X_test.txt", sep=" ", what="list")

# Generate sequence of 561 16's, because we have a fixed format file with
# 561 columns of 16 character width
# sq = c(seq(from=16,to=16,length.out=561))

# Read the file
labels = read.fwf("activity_labels.txt", widths=c(2,50))
X_test = read.table("test/X_test.txt", colClasses="numeric")
y_test = read.table("test/y_test.txt", colClasses="numeric")

X_train = read.table("train/X_train.txt", header=F, colClasses="numeric")
y_train = read.table("train/y_train.txt", header=F, colClasses="numeric")
subject_train = read.table("train/subject_train.txt", colClasses="numeric")
subject_test = read.table("test/subject_test.txt", colClasses="numeric")

features <- rbind(X_train, X_test)
final <- features[,indices]
names(final) <- col_names[indices]
tempsub <- rbind(subject_train, subject_test)
names(tempsub) <- c("Subject")
final <- cbind(final, tempsub)
tempact <- rbind(y_train, y_test)
names(tempact) <- c("ActivityCodes")
final <- cbind(final, tempact)

# final <- final[1:100,1:5]

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

