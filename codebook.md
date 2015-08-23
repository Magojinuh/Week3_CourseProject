# Data dictionary

This code is an extract of the "features_info.txt" document in the UCI HAR Dataset directory

"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals)."

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Please refer to the "README.txt" and "features_info.txt" documentation for more info on the UCI HAR Dataset (in the directory with the same name)

__The units for the gyroscope are radians/second.__

__The units for the accelerometer are the standard gravity units "g"__

It follows a description of each variable/column of the resulting data frame of the run_analysis.R file

__Note: According to step 5: "the average of each variable for each activity and each subject". The above mentioned data frame is a summary where one observation represents the mean for all the observations of the measurements per activity and subject in each cell of the data frame.__


* subject: <br> Indicates to wich subject correspond the row of observations.


* activity: <br> Indicates wich activity the subject performed.


* set: <br> Indicates whether the subject was part of the training set (70% of the subjects) or the test set (30% of the subjects).


* tBodyAcceleration-mean()-X: <br> Mean of the time domain signals for body acceleration from the accelerometer in the X direction.


* tBodyAcceleration-std()-X: <br> Standard deviation of the time domain signals for body acceleration from the accelerometer in the X direction.


* tBodyAcceleration-mean()-Y: <br> Mean of the time domain signals for body acceleration from the accelerometer in the Y direction.


* tBodyAcceleration-std()-Y: <br> Standard deviation of the time domain signals for body acceleration from the accelerometer in the Y direction.


* tBodyAcceleration-mean()-Z: <br> Mean of the time domain signals for body acceleration from the accelerometer in the Z direction.


* tBodyAcceleration-std()-Z: <br> Standard deviation of the time domain signals for body acceleration from the accelerometer in the Z direction.


* tGravityAcceleration-mean()-X: <br> Mean of the time domain signals for gravity acceleration from the accelerometer in the X direction.


* tGravityAcceleration-std()-X: <br> Standard deviation of the time domain signals for gravity acceleration from the accelerometer in the X direction.


* tGravityAcceleration-mean()-Y: <br> Mean of the time domain signals for gravity acceleration from the accelerometer in the Y direction.


* tGravityAcceleration-std()-Y: <br> Standard deviation of the time domain signals for gravity acceleration from the accelerometer in the Y direction.


* tGravityAcceleration-mean()-Z: <br> Mean of the time domain signals for gravity acceleration from the accelerometer in the Z direction.


* tGravityAcceleration-std()-Z: <br> Standard deviation of the time domain signals for gravity acceleration from the accelerometer in the Z direction.


* tBodyAccelerationJerk-mean()-X: <br> Mean of the time domain signals for the body acceleration jerk from the accelerometer in the X direction.


* tBodyAccelerationJerk-std()-X: <br> Standard deviation of the time domain signals for the body acceleration jerk from the accelerometer in the X direction.


* tBodyAccelerationJerk-mean()-Y: <br> Mean of the time domain signals for the body acceleration jerk from the accelerometer in the Y direction.


* tBodyAccelerationJerk-std()-Y: <br> Standard deviation of the time domain signals for the body acceleration jerk from the accelerometer in the Y direction.


* tBodyAccelerationJerk-mean()-Z: <br> Mean of the time domain signals for the body acceleration jerk from the accelerometer in the Z direction.


* tBodyAccelerationJerk-std()-Z: <br> Standard deviation of the time domain signals for the body acceleration jerk from the accelerometer in the Z direction.


* tBodyGyroscopic-mean()-X: <br> Mean of the time domain signals for the angular velocity  from the gyroscope in the X direction.


* tBodyGyroscopic-std()-X: <br> Standard deviation of the time domain signals for the angular velocity  from the gyroscope in the X direction.


* tBodyGyroscopic-mean()-Y: <br> Mean of the time domain signals for the angular velocity  from the gyroscope in the Y direction.


* tBodyGyroscopic-std()-Y: <br> Standard deviation of the time domain signals for the angular velocity  from the gyroscope in the Y direction.


* tBodyGyroscopic-mean()-Z : <br> Mean of the time domain signals for the angular velocity  from the gyroscope in the Z direction.


* tBodyGyroscopic-std()-Z: <br> Standard deviation of the time domain signals for the angular velocity  from the gyroscope in the Z direction.


* tBodyGyroscopicJerk-mean()-X: <br> Mean of the time domain signals for the angular velocity jerk from the gyroscope in the X direction.


* tBodyGyroscopicJerk-std()-X: <br> Standard deviation of the time domain signals for the angular velocity jerk from the gyroscope in the X direction.


* tBodyGyroscopicJerk-mean()-Y: <br> Mean of the time domain signals for the angular velocity jerk from the gyroscope in the Y direction.


* tBodyGyroscopicJerk-std()-Y: <br> Standard deviation of the time domain signals for the angular velocity jerk from the gyroscope in the Y direction.


* tBodyGyroscopicJerk-mean()-Z: <br> Mean of the time domain signals for the angular velocity jerk from the gyroscope in the Z direction.


* tBodyGyroscopicJerk-std()-Z: <br> Standard deviation of the time domain signals for the angular velocity jerk from the gyroscope in the Z direction.


* tBodyAccelerationMagnitude-mean(): <br> Mean of the time domain signals for the magnitude (using the Euclidean norm) of the body acceleration from the accelerometer.


* tBodyAccelerationMagnitude-std(): <br> Standard deviation of the time domain signals for the magnitude (using the Euclidean norm) of the body acceleration from the accelerometer.


* tGravityAccelerationMagnitude-mean(): <br> Mean of the time domain signals for the magnitude (using the Euclidean norm) of the angular velocity from the gyroscope.


* tGravityAccelerationMagnitude-std(): <br> Standard deviation of the time domain signals for the magnitude (using the Euclidean norm) of the angular velocity from the gyroscope.


* tBodyAccelerationJerkMagnitude-mean(): <br> Mean of the time domain signals for the magnitude (using the Euclidean norm) of the body acceleration jerk from the accelerometer.


* tBodyAccelerationJerkMagnitude-std(): <br> Standard deviation of the time domain signals for the magnitude (using the Euclidean norm) of the body acceleration jerk from the accelerometer.


* tBodyGyroscopicMagnitude-mean(): <br> Mean of the time domain signals for the magnitude (using the Euclidean norm) of the angular velocity from the gyroscope.


* tBodyGyroscopicMagnitude-std(): <br> Standard deviation of the time domain signals for the magnitude (using the Euclidean norm) of the angular velocity from the gyroscope.


* tBodyGyroscopicJerkMagnitude-mean(): <br> Mean of the time domain signals for the magnitude (using the Euclidean norm) of the angular velocity jerk from the gyroscope.


* tBodyGyroscopicJerkMagnitude-std(): <br> Standard deviation of the time domain signals for the magnitude (using the Euclidean norm) of the angular velocity jerk from the gyroscope.


* fBodyAcceleration-mean()-X: <br> Mean of the frequency domain signals for body acceleration from the accelerometer in the X direction after applying a Fast Fourier Transform (FFT) to the time domain signals of tBodyAcceleration-X.


* fBodyAcceleration-std()-X: <br> Standard deviation of the frequency domain signals for body acceleration from the accelerometer in the X direction after applying a Fast Fourier Transform (FFT) to the time domain signals of tBodyAcceleration-X.


* fBodyAcceleration-mean()-Y: <br> Mean of the frequency domain signals for body acceleration from the accelerometer in the Y direction after applying a Fast Fourier Transform (FFT) to the time domain signals of tBodyAcceleration-Y.


* fBodyAcceleration-std()-Y: <br> Standard deviation of the frequency domain signals for body acceleration from the accelerometer in the Y direction after applying a Fast Fourier Transform (FFT) to the time domain signals of tBodyAcceleration-Y.


* fBodyAcceleration-mean()-Z: <br> Mean of the frequency domain signals for body acceleration from the accelerometer in the Z direction after applying a Fast Fourier Transform (FFT) to the time domain signals of tBodyAcceleration-Z.


* fBodyAcceleration-std()-Z: <br> Standard deviation of the frequency domain signals for body acceleration from the accelerometer in the Z direction after applying a Fast Fourier Transform (FFT) to the time domain signals of tBodyAcceleration-Z.


* fBodyAccelerationJerk-mean()-X: <br> Mean of the frequency domain signals for the body acceleration jerk from the accelerometer in the X direction after applying a Fast Fourier Transform (FFT) to the time domain signals of tBodyAccelerationJerk-X.


* fBodyAccelerationJerk-std()-X: <br> Standard deviation of the frequency domain signals for the body acceleration jerk from the accelerometer in the X direction after applying a Fast Fourier Transform (FFT) to the time domain signals of tBodyAccelerationJerk-X.


* fBodyAccelerationJerk-mean()-Y: <br> Mean of the frequency domain signals for the body acceleration jerk from the accelerometer in the Y direction after applying a Fast Fourier Transform (FFT) to the time domain signals of tBodyAccelerationJerk-Y.


* fBodyAccelerationJerk-std()-Y: <br> Standard deviation of the frequency domain signals for the body acceleration jerk from the accelerometer in the Y direction after applying a Fast Fourier Transform (FFT) to the time domain signals of tBodyAccelerationJerk-Y.


* fBodyAccelerationJerk-mean()-Z: <br> Mean of the frequency domain signals for the body acceleration jerk from the accelerometer in the Z direction after applying a Fast Fourier Transform (FFT) to the time domain signals of tBodyAccelerationJerk-Z.


* fBodyAccelerationJerk-std()-Z: <br> Standard deviation of the frequency domain signals for the body acceleration jerk from the accelerometer in the Z direction after applying a Fast Fourier Transform (FFT) to the time domain signals of tBodyAccelerationJerk-Z.


* fBodyGyroscopic-mean()-X: <br> Mean of the frequency domain signals for the angular velocity from the gyroscope in the X direction after applying a Fast Fourier Transform (FFT) to the time domain signals of tBodyGyroscopic-X.


* fBodyGyroscopic-std()-X: <br> Standard deviation of the frequency domain signals for the angular velocity from the gyroscope in the X direction after applying a Fast Fourier Transform (FFT) to the time domain signals of tBodyGyroscopic-X.


* fBodyGyroscopic-mean()-Y: <br> Mean of the frequency domain signals for the angular velocity from the gyroscope in the Y direction after applying a Fast Fourier Transform (FFT) to the time domain signals of tBodyGyroscopic-Y.


* fBodyGyroscopic-std()-Y: <br> Standard deviation of the frequency domain signals for the angular velocity from the gyroscope in the Y direction after applying a Fast Fourier Transform (FFT) to the time domain signals of tBodyGyroscopic-Y.


* fBodyGyroscopic-mean()-Z: <br> Mean of the frequency domain signals for the angular velocity from the gyroscope in the Z direction after applying a Fast Fourier Transform (FFT) to the time domain signals of tBodyGyroscopic-Z.


* fBodyGyroscopic-std()-Z: <br> Standard deviation of the frequency domain signals for the angular velocity from the gyroscope in the Z direction after applying a Fast Fourier Transform (FFT) to the time domain signals of tBodyGyroscopic-Z.


* fBodyAccelerationMagnitude-mean(): <br> Mean of the frequency domain signals for the magnitude (using the Euclidean norm) of the body acceleration from the accelerometer after applying a Fast Fourier Transform (FFT) to the time domain signals of tBodyAccelerationMagnitude.


* fBodyAccelerationMagnitude-std(): <br> Standard deviation of the frequency domain signals for the magnitude (using the Euclidean norm) of the body acceleration from the accelerometer after applying a Fast Fourier Transform (FFT) to the time domain signals of tBodyAccelerationMagnitude.


* fBodyAccelerationJerkMagnitude-mean(): <br> Mean of the frequency domain signals for the magnitude (using the Euclidean norm) of the body acceleration jerk from the accelerometer after applying a Fast Fourier Transform (FFT) to the time domain signals of tBodyAccelerationJerkMagnitude.


* fBodyAccelerationJerkMagnitude-std(): <br> Standard deviation of the frequency domain signals for the magnitude (using the Euclidean norm) of the body acceleration jerk from the accelerometer after applying a Fast Fourier Transform (FFT) to the time domain signals of tBodyAccelerationJerkMagnitude.


* fBodyGyroscopicMagnitude-mean(): <br> Mean of the frequency domain signals for the magnitude (using the Euclidean norm) of the angular velocity from the gyroscope after applying a Fast Fourier Transform (FFT) to the time domain signals of tBodyGyroscopicMagnitude.


* fBodyGyroscopicMagnitude-std(): <br> Standard deviation of the frequency domain signals for the magnitude (using the Euclidean norm) of the angular velocity from the gyroscope after applying a Fast Fourier Transform (FFT) to the time domain signals of tBodyGyroscopicMagnitude.


* fBodyGyroscopicJerkMagnitude-mean(): <br> Mean of the frequency domain signals for the magnitude (using the Euclidean norm) of the angular velocity jerk from the gyroscope after applying a Fast Fourier Transform (FFT) to the time domain signals of tBodyGyroscopicJerkMagnitude.


* fBodyGyroscopicJerkMagnitude-std(): <br> Standard deviation of the frequency domain signals for the magnitude (using the Euclidean norm) of the angular velocity jerk from the gyroscope after applying a Fast Fourier Transform (FFT) to the time domain signals of tBodyGyroscopicJerkMagnitude.


* BodyAcceleration-mean()-X: <br> Mean of the body acceleration signals from the accelerometer in the X direction obtained by subtracting the gravity from the total acceleration.


* BodyAcceleration-std()-X: <br> Standard deviation of the body acceleration signals from the accelerometer in the X direction obtained by subtracting the gravity from the total acceleration.


* BodyAcceleration-mean()-Y: <br> Mean of the body acceleration signals from the accelerometer in the Y direction obtained by subtracting the gravity from the total acceleration.


* BodyAcceleration-std()-Y: <br> Standard deviation of the body acceleration signals from the accelerometer in the Y direction obtained by subtracting the gravity from the total acceleration.


* BodyAcceleration-mean()-Z: <br> Mean of the body acceleration signals from the accelerometer in the Z direction obtained by subtracting the gravity from the total acceleration.

* BodyAcceleration-std()-Z: <br> Standard deviation of the body acceleration signals from the accelerometer in the Z direction obtained by subtracting the gravity from the total acceleration.

* BodyGyroscopic-mean()-X: <br> Mean of the angular velocity signals from the gyroscope in the X direction obtained by subtracting the gravity from the total acceleration.


* BodyGyroscopic-std()-X: <br> Standard deviation of the angular velocity signals from the gyroscope in the X direction obtained by subtracting the gravity from the total acceleration.


* BodyGyroscopic-mean()-Y: <br> Mean of the angular velocity signals from the gyroscope in the Y direction obtained by subtracting the gravity from the total acceleration.


* BodyGyroscopic-std()-Y: <br> Standard deviation of the angular velocity signals from the gyroscope in the Y direction obtained by subtracting the gravity from the total acceleration.


* BodyGyroscopic-mean()-Z: <br> Mean of the angular velocity signals from the gyroscope in the Z direction obtained by subtracting the gravity from the total acceleration.


* BodyGyroscopic-std()-Z: <br> Standard deviation of the angular velocity signals from the gyroscope in the Z direction obtained by subtracting the gravity from the total acceleration.


* TotalAcceleration-mean()-X: <br> Mean of the acceleration signals from the smartphone accelerometer X axis.


* TotalAcceleration-std()-X: <br> Standard deviation of the acceleration signals from the smartphone accelerometer X axis.


* TotalAcceleration-mean()-Y: <br> Mean of the acceleration signals from the smartphone accelerometer Y axis.


* TotalAcceleration-std()-Y: <br> Standard deviation of the acceleration signals from the smartphone accelerometer Y axis.


* TotalAcceleration-mean()-Z: <br> Mean of the acceleration signals from the smartphone accelerometer Z axis.


* TotalAcceleration-std()-Z: <br> Standard deviation of the acceleration signals from the smartphone accelerometer Z axis.