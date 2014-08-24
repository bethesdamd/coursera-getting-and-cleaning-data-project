## Codebook for Getting and Cleaning Data project

### Study Design Section

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


### Code Book Section

_(It was assumed for the sake of this project that labels such as 'tBodyAcc-mean()-X' are sufficiently self-explanatory and did not need to be converted to a more explicit form.)_

The _averages.txt_ file contains the averages of every activity for every subject and every feature __if that feature is a 'mean' or 'std' feature.__  (If the feature label contained 'mean' or 'std' then the feature was included in this averages.txt output file.)

__The complete list of 'mean' and 'std' features are included later in this file.__

Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ

tGravityAcc-XYZ

tBodyAccJerk-XYZ

tBodyGyro-XYZ

tBodyGyroJerk-XYZ

tBodyAccMag

tGravityAccMag

tBodyAccJerkMag

tBodyGyroMag

tBodyGyroJerkMag

fBodyAcc-XYZ

fBodyAccJerk-XYZ

fBodyGyro-XYZ

fBodyAccMag

fBodyAccJerkMag

fBodyGyroMag

fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value

std(): Standard deviation

mad(): Median absolute deviation 

max(): Largest value in array

min(): Smallest value in array

sma(): Signal magnitude area

energy(): Energy measure. Sum of the squares divided by the number of values. 

iqr(): Interquartile range 

entropy(): Signal entropy

arCoeff(): Autorregresion coefficients with Burg order equal to 4

correlation(): correlation coefficient between two signals

maxInds(): index of the frequency component with largest magnitude

meanFreq(): Weighted average of the frequency components to obtain a mean frequency

skewness(): skewness of the frequency domain signal 

kurtosis(): kurtosis of the frequency domain signal 

bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.

angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean

tBodyAccMean

tBodyAccJerkMean

tBodyGyroMean

tBodyGyroJerkMean

The complete list of variables of each feature vector follows:

1 tBodyAcc-mean()-X

2 tBodyAcc-mean()-Y

3 tBodyAcc-mean()-Z

4 tBodyAcc-std()-X

5 tBodyAcc-std()-Y

6 tBodyAcc-std()-Z

41 tGravityAcc-mean()-X

42 tGravityAcc-mean()-Y

43 tGravityAcc-mean()-Z

44 tGravityAcc-std()-X

45 tGravityAcc-std()-Y

46 tGravityAcc-std()-Z

81 tBodyAccJerk-mean()-X

82 tBodyAccJerk-mean()-Y

83 tBodyAccJerk-mean()-Z

84 tBodyAccJerk-std()-X

85 tBodyAccJerk-std()-Y

86 tBodyAccJerk-std()-Z

121 tBodyGyro-mean()-X

122 tBodyGyro-mean()-Y

123 tBodyGyro-mean()-Z

124 tBodyGyro-std()-X

125 tBodyGyro-std()-Y

126 tBodyGyro-std()-Z

161 tBodyGyroJerk-mean()-X

162 tBodyGyroJerk-mean()-Y

163 tBodyGyroJerk-mean()-Z

164 tBodyGyroJerk-std()-X

165 tBodyGyroJerk-std()-Y

166 tBodyGyroJerk-std()-Z

201 tBodyAccMag-mean()

202 tBodyAccMag-std()

214 tGravityAccMag-mean()

215 tGravityAccMag-std()

227 tBodyAccJerkMag-mean()

228 tBodyAccJerkMag-std()

240 tBodyGyroMag-mean()

241 tBodyGyroMag-std()

253 tBodyGyroJerkMag-mean()

254 tBodyGyroJerkMag-std()

266 fBodyAcc-mean()-X

267 fBodyAcc-mean()-Y

268 fBodyAcc-mean()-Z

269 fBodyAcc-std()-X

270 fBodyAcc-std()-Y

271 fBodyAcc-std()-Z

294 fBodyAcc-meanFreq()-X

295 fBodyAcc-meanFreq()-Y

296 fBodyAcc-meanFreq()-Z

345 fBodyAccJerk-mean()-X

346 fBodyAccJerk-mean()-Y

347 fBodyAccJerk-mean()-Z

348 fBodyAccJerk-std()-X

349 fBodyAccJerk-std()-Y

350 fBodyAccJerk-std()-Z

373 fBodyAccJerk-meanFreq()-X

374 fBodyAccJerk-meanFreq()-Y

375 fBodyAccJerk-meanFreq()-Z

424 fBodyGyro-mean()-X

425 fBodyGyro-mean()-Y

426 fBodyGyro-mean()-Z

427 fBodyGyro-std()-X

428 fBodyGyro-std()-Y

429 fBodyGyro-std()-Z

452 fBodyGyro-meanFreq()-X

453 fBodyGyro-meanFreq()-Y

454 fBodyGyro-meanFreq()-Z

503 fBodyAccMag-mean()

504 fBodyAccMag-std()

516 fBodyBodyAccJerkMag-mean()

517 fBodyBodyAccJerkMag-std()

526 fBodyBodyAccJerkMag-meanFreq()

529 fBodyBodyGyroMag-mean()

530 fBodyBodyGyroMag-std()

539 fBodyBodyGyroMag-meanFreq()

542 fBodyBodyGyroJerkMag-mean()

543 fBodyBodyGyroJerkMag-std()

552 fBodyBodyGyroJerkMag-meanFreq()

555 angle(tBodyAccMean,gravity)

556 angle(tBodyAccJerkMean),gravityMean)

557 angle(tBodyGyroMean,gravityMean)

558 angle(tBodyGyroJerkMean,gravityMean)

559 angle(X,gravityMean)

560 angle(Y,gravityMean)

561 angle(Z,gravityMean)



