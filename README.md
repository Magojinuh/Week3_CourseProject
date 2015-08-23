# README (run_analysis.R)

==================================================================

Summary of Human Activity Recognition Using Smartphones Dataset

Version 1.0

==================================================================

Manuel García

Mathematics undergraduate student

Universidad Nacional Autónoma de México - Facultad de Ciencias

manuelgacos@ciencias.unam.mx

www.fciencias.unam.mx

==================================================================

## A very short intro

Hi, this is the README.md file for my run_analysis.R script of the course project of the __"Getting and Cleaning Data"__ course of coursera.org. Some data of the author is just above, please take your time to read this file and the codebook.md file. I garantee you that I put much effort and love in this script (praise the lord that I didn't have homework in the last two weeks cause the semester here in UNAM have already started).

#### IMPORTANT NOTE: In order for this script to function properly, please make sure to put the script inside the UCI HAR Dataset directory (but not inside any of the subdirectories) and make this directory your working directory

## Abstract

This script(run_analysis.R) creates one tidy dataset from the data of the UCI HAR dataset. This resulting data frame has 180 rows and 87 columns (the names and variables are in the codebook.md document) each row represent the mean or standard deviation from the variables in the UCI dataset and the rows are the average of each variable for each activity and each subject (30 subjects * 6 activities = 180 rows).

## Script

First this scripts read your working directory. __Please note that the run_analysis.R file has to be inside the UCI HAR Dataset directory (and this has to be your current working directory) but not inside the test or the train subdirectories.__

```javascript
directory <- getwd()
```
Next the script reads the name of the 561 variables in the "features.txt", for more information on this variables please refer to the "features_info.txt" document in the UCI DAR Dataset directory.

````javascript
features <- read.table("features.txt", stringsAsFactors = F)
````
__IMPORTANT NOTE: This script works separately with the test and the train data of the dataset for step 2 of the assignment, i.e., first it structures the test data set and then selects the measurements on the mean and standard out of the 561 columns and adds 18 extra columns for the mean and standard deviation measures in the test/train subdirectories (body_acc, body_gyro and total_acc for the X,Y and Z axis).__

This part of code reads the tables in the test subdirectory, body_acc, body_gyro and total_acc for the X,Y and Z axis. For each variable and measurement corresponds a data frame.

```javascript
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
```

__Starting to structure the test dataset into a data frame__

The "X_test.txt" document has most of the data for the test subjects, with 2947 rows and 561 columns, "subject_test.txt" has 1 column and 2947 rows, lastly "Y_test.txt" has 1 column and 2947 rows. The data frame assigned for each one has the same name as the .txt document except fot this extension.

This code names creates a copy of the X_test named tidy data frame and names it's columns according to the "features.txt" document ("features" data frame)

```javascript
tidy <- X_test
variables <- features$V2
names(tidy) <- variables
```

As it could be noticed, the subject_test and Y_test data frames have information corresponding to one column for the subject performing the activity in each row and the other indicating the performed activity. I added an extra last one indicating that all this subjects correspond to the test set (for more info about this set, refer to the "README.txt" document of the UCI HAR Dataset).

```javascript
names(subject_test) <- "subject"
names(Y_test) <- "activity"
set_test <- rep("test", 2947)
tidy$subject <- subject_test
tidy$activity <- Y_test$activity
tidy$set <- set_test
```

This code changes the order of the columns so that the "subject", "set" and "activity" columns come first, the order of the rest of the columns remain unchanged.

```javascript
tidy <- tidy[ , c(562,564,563,1:561)]
```

Step 4 ask us to "Extracts only the measurements on the mean and standard deviation for each measurement", so after assembling the test dataset we have to extract only the columns that have the mean and sd of the variables to form a new data frame called tidy_test. 

Here vect_index has the index for the mean and sd for the variables tBodyAcc-XYZ, tGravityAcc-XYZ, tBodyAccJerk-XYZ, tBodyGyro-XYZ, tBodyGyroJerk-XYZ, tBodyAccMag, tGravityAccMag, tBodyAccJerkMag. tBodyGyroMag, tBodyGyroJerkMag, fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccMag, fBodyAccJerkMag, fBodyGyroMag and fBodyGyroJerkMag.

It's important to remark that for making the order of the columns simple, I decided to put the mean observation first and then the standard deviation , i.e., tBodyAccmean()-X comes first for the tBodyAcceleration-X variable and then tBodyAccstd()-X.

```javascript
vect_index <- c(1:3,4,7,5,8,6,9,44,47,45,48
                ,46,49,84,87,85,88,86,89,124,127
                ,125,128,126,129,164,167,165,168,166,169
                ,204,205,217,218,230,231,243,244,256,257
                ,269,272,270,273,271,274,348,351,349,352
                ,350,353,427,430,428,431,429,432,506,507
                ,519,520,532,533,545,546)
tidy_test <- tidy[ , vect_index]
```

If you want to check if the index of the columns is correct, you can use this code to check the index of the variables that are means and sd

```javascript
as.matrix(names(tidy))
```

Remember to store the data in a variable. ;)

__NOTE: As mentioned above, I decided to put an extra 18 columns corresponding to the measures in the test subdirectory for the test dataset and the train subdirectory for the training dataset. This way I tried to make use of all the data in the whole UCI HAR Dataset.__

In order to obtain the 18 columns for these variable, the script collapses the tables (each one with 2497 rows and 128 columns, corresponding to 128 observations according to the "README.txt" document in the UCI HAR Dataset directory. Please refer to this document for more information) of body_acc_test and body_gyro_test for the axis X,Y and Z to one column per Axis and measurement by applying the row mean or standard deviation functions to each row, this way the data frames are collapsed to the 18 extra columns for the tidy_test data frame.

```javascript
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
```

Next the script do the same procedure but for the dataset for the train subjects. If you are lost in some step please revisit the code for the test dataset. I followed the same procedure (except for the cames, where I changed "test" for "train" mostly) and in the same order so I think that this way the code should be straightforward.

Reading the tables in the train subdirectory

```javascript
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
```

Starting to structure the train dataset into a data frame. Naming the columns of X_train according to the features.txt document ("features" data frame)

```javascript
tidy1 <- X_train
variables <- features$V2
names(tidy1) <- variables
```

Joining the X_train data with the subject_train,Y_train data. Adding three columns; one indicating to which subject corresponds the observations, another indicating the performed activity and the last one indicating that they are train subjects.

```javascript
names(subject_train) <- "subject"
names(Y_train) <- "activity"
set_train1 <- rep("train", 7352)
tidy1$subject <- subject_train
tidy1$activity <- Y_train$activity
tidy1$set <- set_train1
tidy1 <- tidy1[ , c(562,564,563,1:561)]
```

Extracting the columns that have the mean and sd of the variables to form a data frame with the train subjects data named tidy_train. Note that vect_index is used to obtain the same columns for the train data, the same used to extract the data in the test dataset.

```javascript
tidy_train <- tidy1[ , vect_index]
```

Adding the 18 extra columns corresponding to the measures in the train subdirectory.

As in the test dataset, in order to obtain the columns for these variable, the script collapses the tables of body_acc_train and body_gyro_train for the axis X,Y and Z to one column per Axis and measurement by taking the row mean or standard deviation for each measurement.

```javascript
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
```

Now that we have the two datasets in two separate data frames, we have to merge them. Don't worry, we are almost done. I apologize in advance for the mess in the next part of code, but I didn't figure out how to paste the tidy_test and tidy_train data frames vertically directly (rbind function give me headache for a few days), so I cut them in smaller data frames and then put them all together. :D

This part of the code merges the resulting data frames, tidy_test for the data of test subjects and tidy_train for the data of train subjects. 

It divides the data frames into three parts each

# tidy_test
# A | B |C
# tidy_train
# D | E | F

rbinds them by pairs vertically

# | A | | B | | C |
# | D | | E | | F |

and then cbinds the resulting three data frames to create one that has both the test and the training data

# tidyData (after merging)
# A | B | C
# D | E | F

```javascript
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
```

ABCDEF could have been clear if you read the last chunk of code, but I decided to make a copy an named it tidyData to be more clear. Once more I reordered some columns to make it more tidy (I think)

```javascript
tidyData <- ABCDEF[ , c(2,1,3:87)]
```

Perhaps you were wondering when I will do step 3, "Use descriptive activity names to name the activities in the data set" , so here is it. This code change the numeric entries of the activity variable for strings that represent the activities according to the "activity_labes.txt" document in the UCI HAR Dataset.

```javascript
for (i in 1:10299){
  if(tidyData[i,3]==1){tidyData[i,3] <- "walking"}
  if(tidyData[i,3]==2){tidyData[i,3] <- "walking upstairs"}
  if(tidyData[i,3]==3){tidyData[i,3] <- "walking downstairs"}
  if(tidyData[i,3]==4){tidyData[i,3] <- "sitting"}
  if(tidyData[i,3]==5){tidyData[i,3] <- "standing"}
  if(tidyData[i,3]==6){tidyData[i,3] <- "laying"}
}
```

To make the data frame more clear, the script orders the tidyData data frame to make it more tidier. Ordering it by "set" (test/train), "subject" (between 1 and 30) and "activity" (walking, etc).
The result is the  tidiest data frame I could come up with. :)

```javascript
tidiest <- tidyData[order(tidyData$set, tidyData$subject, tidyData$activity),]
```

After all this, I noticed that the original variable names didn't accomplish step 4, "Appropriately labels the data set with descriptive variable names", so I read through the discussion forums renamed the variables to be more clear (mostly, complementig the name abreviations), for the description of the variables please check the codebook.md documentation.

This insanely long code tries to accomplish the step 4 "Appropriately labels the data set with descriptive variable names" by sligthly changing the variable names to a more descriptive name, including of course if the column corresponds to the mean or the standard deviation of the measurement.

```javascript
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
```

__NOTE: The last part of the script will require the "Hmisc" package, so it will check if this
package is installed in your system, if it's not installed it will do so.__

```javascript
if ("Hmisc" %in% installed.packages() == FALSE){
    install.packages("Hmisc");
}
# Loading the "Hmisc" package
require("Hmisc")
```

I had many trouble with this part, but again some hints from the forums put me in the right direction. In fact, I was amazed of what a little line of code can do. Really some magic, it collapses the almost 10,300 rows of the tidiest data frame to "the average of each variable for each activity and each subject" mentioned in step 5. This means that the resulting data frame is sort of a summary where one observation represents the mean for all the observations of the measurements per activity and subject. It saved me some lines using only the base package from R that almost doubled the size of the script!

```javascript
summary_tidiest <- summarize(tidiest[4:87], by = llist(subject=tidiest$subject,activity=tidiest$activity, set=tidiest$set), FUN = colMeans)
```

This line changes the name of the fourth column of the summary_tidiest data frame created
just above, cause strangely  (I mean, I don't know why) it is changed to "tidiest".

```javascript
names(summary_tidiest)[4] <- "tBodyAcceleration-mean()-X"
```

The last step!!! The scripts writes the result in a .txt file as instructed. Named "tidy_data.txt" __This file is written in your current working directory, you can't miss it!__

```javascript
write.table(summary_tidiest,file = "tidy_data.txt", row.names = FALSE)
```

You can read the table using the code.

```javascript
read.table("tidy_data.txt", header = T)
```

Thanks for reading all the way down here. I hope that you were able to follow my code, I'm sorry for some messy parts but I've just started learning to program in R since june 2015 and I'm taking the Data Science specialization alone. Means for contacting me are in the first part of the document, maybe we could become data science pals!. :D