### IMPORTANT NOTE: In order for this script to function properly, please make sure to put the
### script inside the UCI HAR Dataset directory (but not inside any of the subdirectories) and
### make this directory your working directory

## Reading the working directory
directory <- getwd()

## Reading the names of the variables
features <- read.table("features.txt", stringsAsFactors = F)

### IMPORTANT NOTE: This script works separately with the test and the train data of the dataset for step 2
### of the assignment, i.e., first it structures the test data set and then selects the measurements
### on the mean and standard for each of the 561 variables and add 18 extra columns for the measures
### in the test/train subdirectories

## Reading the tables in the test subdirectory
subject_test <- read.table(paste(directory, "/test/subject_test.txt", sep = ""), stringsAsFactors = F)
X_test <- read.table(paste(directory, "/test/X_test.txt", sep = ""), stringsAsFactors = F)
Y_test <- read.table(paste(directory, "/test/y_test.txt", sep = ""), stringsAsFactors = F)
#test/body_acc
body_acc_x_test <- read.table(paste(directory, "/test/Inertial Signals/body_acc_x_test.txt", sep = ""), stringsAsFactors = F)
body_acc_y_test <- read.table(paste(directory, "/test/Inertial Signals/body_acc_y_test.txt", sep = ""), stringsAsFactors = F)
body_acc_z_test <- read.table(paste(directory, "/test/Inertial Signals/body_acc_Z_test.txt", sep = ""), stringsAsFactors = F)
#test/body_gyro
body_gyro_x_test <- read.table(paste(directory, "/test/Inertial Signals/body_gyro_x_test.txt", sep = ""), stringsAsFactors = F)
body_gyro_y_test <- read.table(paste(directory, "/test/Inertial Signals/body_gyro_y_test.txt", sep = ""), stringsAsFactors = F)
body_gyro_z_test <- read.table(paste(directory, "/test/Inertial Signals/body_gyro_z_test.txt", sep = ""), stringsAsFactors = F)
#test/total_acc
total_acc_x_test <- read.table(paste(directory, "/test/Inertial Signals/total_acc_x_test.txt", sep = ""), stringsAsFactors = F)
total_acc_y_test <- read.table(paste(directory, "/test/Inertial Signals/total_acc_y_test.txt", sep = ""), stringsAsFactors = F)
total_acc_z_test <- read.table(paste(directory, "/test/Inertial Signals/total_acc_z_test.txt", sep = ""), stringsAsFactors = F)

## Starting to structure the test dataset into a data frame
# Naming the columns of X_test according to the features.txt document ("features" data frame)
tidy <- X_test
variables <- features$V2
names(tidy) <- variables

## Joining the X_test data with the subject_test,Y_test data
# Adding three columns; one indicating to which subject corresponds the observations, another
# indicating the performed activity and the last one indicating that they are test subjects
names(subject_test) <- "subject"
names(Y_test) <- "activity"
set_test <- rep("test", 2947)
tidy$subject <- subject_test
tidy$activity <- Y_test$activity
tidy$set <- set_test

## This code changes the order of the columns so that the "subject", "set" and "activity"
## columns come first
tidy <- tidy[ , c(562,564,563,1:561)]

## Extracting the columns that have the mean and sd of the variables to form a data frame with
## the test subjects data
# vect_index has the index for the mean and sd for the variables 
# tBodyAcc-XYZ, tGravityAcc-XYZ, tBodyAccJerk-XYZ, tBodyGyro-XYZ, tBodyGyroJerk-XYZ
# tBodyAccMag, tGravityAccMag, tBodyAccJerkMag. tBodyGyroMag, tBodyGyroJerkMag
# fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccMag, fBodyAccJerkMag
# fBodyGyroMag, fBodyGyroJerkMag
## NOTE: For the columns, mean comes first and then sd, i.e., tBodyAccmean()-X and 
## then tBodyAccstd()-X
vect_index <- c(1:3,4,7,5,8,6,9,44,47,45,48
                ,46,49,84,87,85,88,86,89,124,127
                ,125,128,126,129,164,167,165,168,166,169
                ,204,205,217,218,230,231,243,244,256,257
                ,269,272,270,273,271,274,348,351,349,352
                ,350,353,427,430,428,431,429,432,506,507
                ,519,520,532,533,545,546)
tidy_test <- tidy[ , vect_index]
# You can use this code to check the index of the variables that are means and sd
# as.matrix(names(tidy)). Remember to store the data in a variable. ;)

## 18 columns corresponding to the measures in the test subdirectory
## IMPORTANT NOTE: In order to obtain the columns for these variable, the script collapses the
## tables of body_acc_test and body_gyro_test for the axis X,Y and Z to one column per Axis and
## measurement by taking the row mean or standard deviation.
#body_acc_test-XYZ (each one separately)
body_acc1_mean <- rowMeans(body_acc_x_test)
tidy_test$"bodyacc-mean()-X" <- body_acc1_mean
body_acc1_std <- apply(body_acc_x_test, 1, sd)
tidy_test$"bodyacc-std()-X" <- body_acc1_std
body_acc2_mean <- rowMeans(body_acc_y_test)
tidy_test$"bodyacc-mean()-Y" <- body_acc2_mean
body_acc2_std <- apply(body_acc_y_test, 1, sd)
tidy_test$"bodyacc-std()-Y" <- body_acc2_std
body_acc3_mean <- rowMeans(body_acc_z_test)
tidy_test$"bodyacc-mean()-Z" <- body_acc3_mean
body_acc3_std <- apply(body_acc_z_test, 1, sd)
tidy_test$"bodyacc-std()-Z" <- body_acc3_std
#body_gyro_test-XYZ (each one separately)
body_gyro1_mean <- rowMeans(body_gyro_x_test)
tidy_test$"bodgyro-mean()-X" <- body_gyro1_mean
body_gyro1_std <- apply(body_gyro_x_test, 1, sd)
tidy_test$"bodgyro-std()-X" <- body_gyro1_std
body_gyro2_mean <- rowMeans(body_gyro_y_test)
tidy_test$"bodgyro-mean()-Y" <- body_gyro2_mean
body_gyro2_std <- apply(body_gyro_y_test, 1, sd)
tidy_test$"bodgyro-std()-Y" <- body_gyro2_std
body_gyro3_mean <- rowMeans(body_gyro_z_test)
tidy_test$"bodgyro-mean()-Z" <- body_gyro3_mean
body_gyro3_std <- apply(body_gyro_z_test, 1, sd)
tidy_test$"bodgyro-std()-Z" <- body_gyro3_std
#total_acc_test-XYZ (each one separately)
total_acc1_mean <- rowMeans(total_acc_x_test)
tidy_test$"totalacc-mean()-X" <- total_acc1_mean
total_acc1_std <- apply(total_acc_x_test, 1, sd)
tidy_test$"totalacc-std()-X" <- total_acc1_std
total_acc2_mean <- rowMeans(total_acc_y_test)
tidy_test$"totalacc-mean()-Y" <- total_acc2_mean
total_acc2_std <- apply(total_acc_y_test, 1, sd)
tidy_test$"totalacc-std()-Y" <- total_acc2_std
total_acc3_mean <- rowMeans(total_acc_z_test)
tidy_test$"totalacc-mean()-Z" <- total_acc3_mean
total_acc3_std <- apply(total_acc_z_test, 1, sd)
tidy_test$"totalacc-std()-Z" <- total_acc3_std

### NOTE: Next the script do the same procedure but for the dataset for the train subjects 
## Reading the tables in the train subdirectory
subject_train <- read.table(paste( directory, "/train/subject_train.txt", sep = ""), stringsAsFactors = F)
X_train <- read.table(paste(directory, "/train/X_train.txt", sep = ""), stringsAsFactors = F)
Y_train <- read.table(paste(directory, "/train/y_train.txt", sep = ""), stringsAsFactors = F)
#train/body_acc
body_acc_x_train <- read.table(paste(directory, "/train/Inertial Signals/body_acc_x_train.txt", sep = ""), stringsAsFactors = F)
body_acc_y_train <- read.table(paste(directory, "/train/Inertial Signals/body_acc_y_train.txt", sep = ""), stringsAsFactors = F)
body_acc_z_train <- read.table(paste(directory, "/train/Inertial Signals/body_acc_Z_train.txt", sep = ""), stringsAsFactors = F)
#train/body_gyro
body_gyro_x_train <- read.table(paste(directory, "/train/Inertial Signals/body_gyro_x_train.txt", sep = ""), stringsAsFactors = F)
body_gyro_y_train <- read.table(paste(directory, "/train/Inertial Signals/body_gyro_y_train.txt", sep = ""), stringsAsFactors = F)
body_gyro_z_train <- read.table(paste(directory, "/train/Inertial Signals/body_gyro_z_train.txt", sep = ""), stringsAsFactors = F)
#train/total_acc
total_acc_x_train <- read.table(paste(directory, "/train/Inertial Signals/total_acc_x_train.txt", sep = ""), stringsAsFactors = F)
total_acc_y_train <- read.table(paste(directory, "/train/Inertial Signals/total_acc_y_train.txt", sep = ""), stringsAsFactors = F)
total_acc_z_train <- read.table(paste(directory, "/train/Inertial Signals/total_acc_z_train.txt", sep = ""), stringsAsFactors = F)

##Starting to structure the train dataset into a data frame
# Naming the columns of X_train according to the features.txt document ("features" data frame)
tidy1 <- X_train
variables <- features$V2
names(tidy1) <- variables

##Joining the X_train data with the subject_train,Y_train data
# Adding three columns; one indicating to which subject corresponds the observations, another
# indicating the performed activity and the last one indicating that they are train subjects
names(subject_train) <- "subject"
names(Y_train) <- "activity"
set_train1 <- rep("train", 7352)
tidy1$subject <- subject_train
tidy1$activity <- Y_train$activity
tidy1$set <- set_train1
tidy1 <- tidy1[ , c(562,564,563,1:561)]

## Extracting the columns that have the mean and sd of the variables to form a data frame with
## the train subjects data
# Note that vect_index is used to obtain the same columns for the train data
tidy_train <- tidy1[ , vect_index]

## 18 columns corresponding to the measures in the train subdirectory
## IMPORTANT NOTE: In order to obtain the columns for these variable, the script collapses the
## tables of body_acc_train and body_gyro_train for the axis X,Y and Z to one column per Axis and
## measurement by taking the row mean or standard deviation.
#body_acc_train-XYZ (each one separately)
body_acc1_mean <- rowMeans(body_acc_x_train)
tidy_train$"bodyacc-mean()-X" <- body_acc1_mean
body_acc1_std <- apply(body_acc_x_train, 1, sd)
tidy_train$"bodyacc-std()-X" <- body_acc1_std
body_acc2_mean <- rowMeans(body_acc_y_train)
tidy_train$"bodyacc-mean()-Y" <- body_acc2_mean
body_acc2_std <- apply(body_acc_y_train, 1, sd)
tidy_train$"bodyacc-std()-Y" <- body_acc2_std
body_acc3_mean <- rowMeans(body_acc_z_train)
tidy_train$"bodyacc-mean()-Z" <- body_acc3_mean
body_acc3_std <- apply(body_acc_z_train, 1, sd)
tidy_train$"bodyacc-std()-Z" <- body_acc3_std
#body_gyro_train-XYZ (each one separately)
body_gyro1_mean <- rowMeans(body_gyro_x_train)
tidy_train$"bodgyro-mean()-X" <- body_gyro1_mean
body_gyro1_std <- apply(body_gyro_x_train, 1, sd)
tidy_train$"bodgyro-std()-X" <- body_gyro1_std
body_gyro2_mean <- rowMeans(body_gyro_y_train)
tidy_train$"bodgyro-mean()-Y" <- body_gyro2_mean
body_gyro2_std <- apply(body_gyro_y_train, 1, sd)
tidy_train$"bodgyro-std()-Y" <- body_gyro2_std
body_gyro3_mean <- rowMeans(body_gyro_z_train)
tidy_train$"bodgyro-mean()-Z" <- body_gyro3_mean
body_gyro3_std <- apply(body_gyro_z_train, 1, sd)
tidy_train$"bodgyro-std()-Z" <- body_gyro3_std
#total_acc_train-XYZ (each one separately)
total_acc1_mean <- rowMeans(total_acc_x_train)
tidy_train$"totalacc-mean()-X" <- total_acc1_mean
total_acc1_std <- apply(total_acc_x_train, 1, sd)
tidy_train$"totalacc-std()-X" <- total_acc1_std
total_acc2_mean <- rowMeans(total_acc_y_train)
tidy_train$"totalacc-mean()-Y" <- total_acc2_mean
total_acc2_std <- apply(total_acc_y_train, 1, sd)
tidy_train$"totalacc-std()-Y" <- total_acc2_std
total_acc3_mean <- rowMeans(total_acc_z_train)
tidy_train$"totalacc-mean()-Z" <- total_acc3_mean
total_acc3_std <- apply(total_acc_z_train, 1, sd)
tidy_train$"totalacc-std()-Z" <- total_acc3_std

### This part of the code merges the resulting data frames, tidy_test for the data of test
# subjects and tidy_train for the data of train subjects. It divides the data frames into three
# parts each, rbinds them by pairs vertically and then cbinds the resulting three
# tidy_test
# A | B |C
# tidy_train
# D | E | F
# tidyData (after merging)
# A | B | C
# D | E | F
A <- as.matrix(tidy_test[ ,1])
D <- as.matrix(tidy_train[ ,1])
AD <- rbind(A,D)
B <- as.matrix(tidy_test[ ,2])
E <- as.matrix(tidy_train[ ,2])
BE <- rbind(B,E)
C <- as.matrix(tidy_test[ ,3:87])
F <- as.matrix(tidy_train[ ,3:87])
CF <- rbind(C,F)
ACDF <- cbind(AD,CF)
Data_ACDF <- as.data.frame(ACDF)
Data_BE <- as.data.frame(BE)
ABCDEF <- cbind(Data_BE,Data_ACDF)
colnames(ABCDEF)[1] <- "set"

tidyData <- ABCDEF[ , c(2,1,3:87)]


## This code change the numeric entries of the activity variable for strings that represent the
## activities according to the "activity_labes.txt" document
for (i in 1:10299){
  if(tidyData[i,3]==1){tidyData[i,3] <- "walking"}
  if(tidyData[i,3]==2){tidyData[i,3] <- "walking upstairs"}
  if(tidyData[i,3]==3){tidyData[i,3] <- "walking downstairs"}
  if(tidyData[i,3]==4){tidyData[i,3] <- "sitting"}
  if(tidyData[i,3]==5){tidyData[i,3] <- "standing"}
  if(tidyData[i,3]==6){tidyData[i,3] <- "laying"}
}

## This code orders tidy data by "set" (test/train), "subject" 1:30 and "activity" walking, etc.
tidiest <- tidyData[order(tidyData$set, tidyData$subject, tidyData$activity),]

## This insanely long code tries to accomplish the step 4 "Appropriately labels the data 
# set with descriptive variable names" by sligthly changing the variable names to a more
# descriptive name, including if the column corresponds to the mean or the standard deviation
# of the measurement
names(tidiest) <-c("subject","set","activity","tBodyAcceleration-mean()-X",
                   "tBodyAcceleration-std()-X",
                   "tBodyAcceleration-mean()-Y",
                   "tBodyAcceleration-std()-Y",
                   "tBodyAcceleration-mean()-Z",
                   "tBodyAcceleration-std()-Z",
                   "tGravityAcceleration-mean()-X",
                   "tGravityAcceleration-std()-X",
                   "tGravityAcceleration-mean()-Y",
                   "tGravityAcceleration-std()-Y",
                   "tGravityAcceleration-mean()-Z",
                   "tGravityAcceleration-std()-Z",
                   "tBodyAccelerationJerk-mean()-X",
                   "tBodyAccelerationJerk-std()-X",
                   "tBodyAccelerationJerk-mean()-Y",
                   "tBodyAccelerationJerk-std()-Y",
                   "tBodyAccelerationJerk-mean()-Z",
                   "tBodyAccelerationJerk-std()-Z",
                   "tBodyGyroscopic-mean()-X",
                   "tBodyGyroscopic-std()-X",
                   "tBodyGyroscopic-mean()-Y",
                   "tBodyGyroscopic-std()-Y",
                   "tBodyGyroscopic-mean()-Z",
                   "tBodyGyroscopic-std()-Z",
                   "tBodyGyroscopicJerk-mean()-X",
                   "tBodyGyroscopicJerk-std()-X",
                   "tBodyGyroscopicJerk-mean()-Y",
                   "tBodyGyroscopicJerk-std()-Y",
                   "tBodyGyroscopicJerk-mean()-Z",
                   "tBodyGyroscopicJerk-std()-Z",
                   "tBodyAccelerationMagnitude-mean()",
                   "tBodyAccelerationMagnitude-std()",
                   "tGravityAccelerationMagnitude-mean()",
                   "tGravityAccelerationMagnitude-std()",
                   "tBodyAccelerationJerkMagnitude-mean()",
                   "tBodyAccelerationJerkMagnitude-std()",
                   "tBodyGyroscopicMagnitude-mean()",
                   "tBodyGyroscopicMagnitude-std()",
                   "tBodyGyroscopicJerkMagnitude-mean()",
                   "tBodyGyroscopicJerkMagnitude-std()",
                   "fBodyAcceleration-mean()-X",
                   "fBodyAcceleration-std()-X",
                   "fBodyAcceleration-mean()-Y",
                   "fBodyAcceleration-std()-Y",
                   "fBodyAcceleration-mean()-Z",
                   "fBodyAcceleration-std()-Z",
                   "fBodyAccelerationJerk-mean()-X",
                   "fBodyAccelerationJerk-std()-X",
                   "fBodyAccelerationJerk-mean()-Y",
                   "fBodyAccelerationJerk-std()-Y",
                   "fBodyAccelerationJerk-mean()-Z",
                   "fBodyAccelerationJerk-std()-Z",
                   "fBodyGyroscopic-mean()-X",
                   "fBodyGyroscopic-std()-X",
                   "fBodyGyroscopic-mean()-Y",
                   "fBodyGyroscopic-std()-Y",
                   "fBodyGyroscopic-mean()-Z",
                   "fBodyGyroscopic-std()-Z",
                   "fBodyAccelerationMagnitude-mean()",
                   "fBodyAccelerationMagnitude-std()",
                   "fBodyAccelerationJerkMagnitude-mean()",
                   "fBodyAccelerationJerkMagnitude-std()",
                   "fBodyGyroscopicMagnitude-mean()",
                   "fBodyGyroscopicMagnitude-std()",
                   "fBodyGyroscopicJerkMagnitude-mean()",
                   "fBodyGyroscopicJerkMagnitude-std()",
                   "BodyAcceleration-mean()-X",
                   "BodyAcceleration-std()-X",
                   "BodyAcceleration-mean()-Y",
                   "BodyAcceleration-std()-Y",
                   "BodyAcceleration-mean()-Z",
                   "BodyAcceleration-std()-Z",
                   "BodyGyroscopic-mean()-X",
                   "BodyGyroscopic-std()-X",
                   "BodyGyroscopic-mean()-Y",
                   "BodyGyroscopic-std()-Y",
                   "BodyGyroscopic-mean()-Z",
                   "BodyGyroscopic-std()-Z",
                   "TotalAcceleration-mean()-X",
                   "TotalAcceleration-std()-X",
                   "TotalAcceleration-mean()-Y",
                   "TotalAcceleration-std()-Y",
                   "TotalAcceleration-mean()-Z",
                   "TotalAcceleration-std()-Z")

### NOTE: The last part of the script will require the "Hmisc" package, so it will check if this
### package is installed in your system, if it's not installed it will do so
if ("Hmisc" %in% installed.packages() == FALSE){
    install.packages("Hmisc");
}
# Loading the "Hmisc" package
require("Hmisc")

## This line does really some magic, it collapses the almost 10,300 rows of the tidiest data
# frame to "the average of each variable for each activity and each subject". This means that 
# the resulting data frame is sort of a summary where one observation represents the mean for
# all the observations of the measurements per activity and subject.
summary_tidiest <- summarize(tidiest[4:87], by = llist(subject=tidiest$subject,activity=tidiest$activity, set=tidiest$set), FUN = colMeans)

## This line changes the name of the fourth column of the summary_tidiest data frame created
## just above, cause strangely  (I mean, I don't know why) it is changed to "tidiest"
names(summary_tidiest)[4] <- "tBodyAcceleration-mean()-X"

## The last step!!! The scripts writes the result in a .txt file as instructed.
write.table(summary_tidiest,file = "tidy_data.txt", row.names = FALSE)