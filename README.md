# README
This repo contains the script developed for the programming assignment of Getting and Cleaning Data Course.

The script works on the UCI HAR DATASET, available at the following link:
 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The script does the following:
* reads the training and the test data 
* merges the training and the test sets to create one data set
* extracts only the measurements on the mean and standard deviation for each measurement
* assigns descriptive names to activities and columns 

The first "tidy" dataset is saved in the workspace with the name "data".

Then, it creates a second, independent dataset named "dataMean" with the average of each variable for each activity and each subject.

Finally, dataMean is saved in the working directory as a file named "data.txt"

## UTILISATION NOTES

The script is saved in the "run_analysis.R" file in the root of this repo.

To use the script, please do the following operations:
* Decompress the "UCI HAR Dataset.zip" archive
* Copy the "run_analysis.R" IN the unzipped folder
* Set the unzipped folder as your working directory

## FURTHER INFORMATIONS
You can find further informations about the data and how they were originally obtained at the following link:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

For additional details about the operations performed by the "run_analysis.R" script, please read the CodeBook.md file available on this repo.