# CodeBook for run_analysis.R

This file details the operations performed by the script on the UCI HAR Dataset. The performed steps are numbered; the same numbers appear in the R code in the comments, so it is easy to find the piece of code that corresponds to a particular operation.

1 - Read the training data

The training set saved in the X_train.txt file is imported in the "X_train" data frame. Then, the subject_train.txt file, which contains the ID of the subjects of the experiment, is read and the data are added in a new column. The same is done for the y_train.txt file, which stores the information about the type of activity performed in the experiment. Labels are defined for the last two columns.

2 - Read the test data

The script operates as the Step 1, reading the X_test.txt, subject_test.txt and y_test.txt files to generate the "X_test" data frame.

3 - Merge training and test data

"X_test" and "X_train" are merged in a new data frame called merge and then removed to free up memory space.

4 - Assign names to columns of the data frame

The features.txt file, which contains the names of the variables of the dataset, is read and stored in the "features_names" data frame, which is used to assign the names to the columns of the merge data frame.

5 - Select only the columns with mean and standard deviation values

grepl function is used to generate a boolean vector which indicates what column names contain the substring mean() or std(). This boolean vector is modified to include the last two columns of the data frame (SubjectID and activity_label), then it is used to subset the "merge" data frame; the result is assigned to "data".

6 - Assign descriptive activity names

The activity_labels.txt file is read and stored in "activity_type" data frame. This data frame associates each activity label (a number) to a description of the activity in natural language. With a for loop, the activity label in "data" is substituted with the related description. 

7 - Assign descriptive names to columns

In order to make the column names of "data" more readable, the following substitutions are made trough the sub and gsub functions:
- parenthesis "()" and hyphen "-" are removed
- "t" at the beginning of the name is substituted with "time"
- "f" at the beginning of the name is substituted with "freq"
- "mean" is substituted with "Mean"
- "std" is substituted with "Std"
- "Mag" is substituted with "Magnitude"
- "BodyBody" is substituted with "Body"

8 - Create a new data set with the average of each variable for each activity and subject

SubjectID and Activity columns are selected as factors; then the aggregate function is called to group data by these factors and calculate the mean for each variable. The result is assigned to "dataMean" data frame. The last two columns are dropped because they are filled with NAs (mean can not be calculated on factors).

9 - Remove the unnecessary objects from the workspace

Unnecessary values and data frames are removed from the workspace to free up memory, leaving only the "data" and the "dataMean" data frame.

10 - Export the averaged data to data.txt

"dataMean" is saved as data.txt in your working directory.

## Additional informations
Dimensions of the output data frames
* data : 10299 obs. of 81 variables
* dataMean: 180 obs. of 81 variables

List of variables (columns) of dataMean data frame
* "SubjectID"
* "Activity"
* "timeBodyAccMeanX"
* "timeBodyAccMeanY"
* "timeBodyAccMeanZ"
* "timeBodyAccStdX"
* "timeBodyAccStdY"
* "timeBodyAccStdZ"
* "timeGravityAccMeanX"
* "timeGravityAccMeanY"
* "timeGravityAccMeanZ"
* "timeGravityAccStdX"
* "timeGravityAccStdY"
* "timeGravityAccStdZ"
* "timeBodyAccJerkMeanX"
* "timeBodyAccJerkMeanY"
* "timeBodyAccJerkMeanZ"
* "timeBodyAccJerkStdX"
* "timeBodyAccJerkStdY"
* "timeBodyAccJerkStdZ"
* "timeBodyGyroMeanX"
* "timeBodyGyroMeanY"
* "timeBodyGyroMeanZ"
* "timeBodyGyroStdX"
* "timeBodyGyroStdY"
* "timeBodyGyroStdZ"
* "timeBodyGyroJerkMeanX"
* "timeBodyGyroJerkMeanY"
* "timeBodyGyroJerkMeanZ"
* "timeBodyGyroJerkStdX"
* "timeBodyGyroJerkStdY"
* "timeBodyGyroJerkStdZ"
* "timeBodyAccMagnitudeMean"
* "timeBodyAccMagnitudeStd"
* "timeGravityAccMagnitudeMean"
* "timeGravityAccMagnitudeStd"
* "timeBodyAccJerkMagnitudeMean"
* "timeBodyAccJerkMagnitudeStd"
* "timeBodyGyroMagnitudeMean"
* "timeBodyGyroMagnitudeStd"
* "timeBodyGyroJerkMagnitudeMean"
* "timeBodyGyroJerkMagnitudeStd"
* "freqBodyAccMeanX"
* "freqBodyAccMeanY"
* "freqBodyAccMeanZ"
* "freqBodyAccStdX"
* "freqBodyAccStdY"
* "freqBodyAccStdZ"
* "freqBodyAccMeanFreqX"
* "freqBodyAccMeanFreqY"
* "freqBodyAccMeanFreqZ"
* "freqBodyAccJerkMeanX"
* "freqBodyAccJerkMeanY"
* "freqBodyAccJerkMeanZ"
* "freqBodyAccJerkStdX"
* "freqBodyAccJerkStdY"
* "freqBodyAccJerkStdZ"
* "freqBodyAccJerkMeanFreqX"
* "freqBodyAccJerkMeanFreqY"
* "freqBodyAccJerkMeanFreqZ"
* "freqBodyGyroMeanX"
* "freqBodyGyroMeanY"
* "freqBodyGyroMeanZ"
* "freqBodyGyroStdX"
* "freqBodyGyroStdY"
* "freqBodyGyroStdZ"
* "freqBodyGyroMeanFreqX"
* "freqBodyGyroMeanFreqY"
* "freqBodyGyroMeanFreqZ"
* "freqBodyAccMagnitudeMean" 
* "freqBodyAccMagnitudeStd"
* "freqBodyAccMagnitudeMeanFreq"
* "freqBodyAccJerkMagnitudeMean"
* "freqBodyAccJerkMagnitudeStd"
* "freqBodyAccJerkMagnitudeMeanFreq"
* "freqBodyGyroMagnitudeMean"
* "freqBodyGyroMagnitudeStd"
* "freqBodyGyroMagnitudeMeanFreq"
* "freqBodyGyroJerkMagnitudeMean"
* "freqBodyGyroJerkMagnitudeStd"
* "freqBodyGyroJerkMagnitudeMeanFreq"

* Measure units
 
Measure unit for the variables are indicated in the README file of the UCI HAR DATASET.
