## Getting and Cleaning Data - Project

### Explanation of the script

The _run_analysis.R_ script contains comments that explain the various steps in manipulating the data, from an R code perspective.

Here are the high level steps:

Merge the training and the test sets to create one data set.

Extract only the measurements on the mean and standard deviation for each measurement. 

Create a second, independent tidy data set with the average of each variable for each activity and each subject. 

Write the second data set to a file called averages.txt

The merging of the various files and data was based upon this graphic provided by the Community TA and explains in detail figuratively what would be difficult to explain here in text: https://coursera-forum-screenshots.s3.amazonaws.com/ab/a2776024af11e4a69d5576f8bc8459/Slide2.png

The resulting text file is called 'averages.txt.  This contains columns for Subject, Activity and feature.  This is a space-delimited file. The first line contains the columns headings.

