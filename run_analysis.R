
## PLEASE NOTE: This script file must be copied in the UCI HAR Dataset folder in
## order to work properly.

## 1 - Read the training data
message("Reading the training set...")
X_train <- read.table("./train/X_train.txt")
message("OK!")

X_train[,dim(X_train)[2]+1] <- read.table("./train/subject_train.txt")
names(X_train)[dim(X_train)[2]] <- "SubjectID"

X_train[,dim(X_train)[2]+1] <- read.table("./train/y_train.txt")
names(X_train)[dim(X_train)[2]] <- "activity_label"

## 2 - Read the test data
message("Reading the test set...")
X_test <- read.table("./test/X_test.txt")
message("OK!")

X_test[,dim(X_test)[2]+1] <- read.table("./test/subject_test.txt")
names(X_test)[dim(X_test)[2]] <- "SubjectID"

X_test[,dim(X_test)[2]+1] <- read.table("./test/y_test.txt")
names(X_test)[dim(X_test)[2]] <- "activity_label"

## 3 - Merge training and test data
message("Merging data...")
merge <- rbind(X_train, X_test)
message("OK!")
rm(X_train, X_test)

## 4 - Assign names to columns of the data frame
features_names <- read.table("features.txt", stringsAsFactors = FALSE)
names(merge)[1:nrow(features_names)] <- features_names[ ,2]

## 5 - Select only the columns with mean and standard deviation values
message("Subsetting data...")
col_names <- "mean()|std()"
col_to_select <- grepl(col_names, names(merge))
col_to_select[(length(col_to_select)-1):(length(col_to_select))] <- c(T,T)
data <- merge[ ,col_to_select]
message("OK!")

## 6 - Assign descriptive activity names
activity_type <- read.table("activity_labels.txt", stringsAsFactors = FALSE)
message("Naming the activities with decriptive names...")
names(activity_type) <- c("label", "description")

for(i in 1:nrow(data)){
        label <- as.integer(data$activity_label[i])
        data$activity_label[i] <- activity_type$description[label]
}

names(data)[dim(data)[2]] <- "Activity"
message("OK!")

## 7 - Assign descriptive names to columns
message("Renaming columns...")
names(data) <- gsub("\\()|-", "", names(data))
names(data) <- sub("^t", "time", names(data))
names(data) <- sub("^f", "freq", names(data))
names(data) <- gsub("mean", "Mean", names(data))
names(data) <- gsub("std", "Std", names(data))
names(data) <- gsub("Mag", "Magnitude", names(data))
names(data) <- gsub("BodyBody", "Body", names(data))
message("OK!")

## 8 - Create a new data set with the average of each variable for each activity 
## and subject

message("Creating a data set with averaged data...")
data$SubjectID <- as.factor(data$SubjectID)
data$Activity <- as.factor(data$Activity)
options(warn=-1)
dataMean <- aggregate(x = data, 
                      by = list(data$SubjectID, data$Activity),
                      FUN = mean)
options(warn=0)
dataMean[ , (dim(dataMean)[2]-1):(dim(dataMean)[2])] <- list(NULL)
names(dataMean)[1:2] <- c("SubjectID", "Activity")
message("OK!")

## 9 - Remove the unnecessary objects from the workspace
message("Cleaning the workspace...")
rm(activity_type, features_names, merge, col_names, col_to_select, i, label)
message("OK!")

## 10 - Export the averaged data to data.txt
message("Writing data.txt")
write.table(dataMean, file = "data.txt", row.name=FALSE, col.names = TRUE)
message("OK!")