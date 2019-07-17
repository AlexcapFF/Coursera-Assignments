# download was done manually
# reading the dataset from the zip file
activity_labels <- read.table("C:/Users/Αλεξανδρος/Downloads/R dls/UCI HAR Dataset/activity_labels.txt")
features <- read.table("C:/Users/Αλεξανδρος/Downloads/R dls/UCI HAR Dataset/features.txt")
subject_test <- read.table("C:/Users/Αλεξανδρος/Downloads/R dls/UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("C:/Users/Αλεξανδρος/Downloads/R dls/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("C:/Users/Αλεξανδρος/Downloads/R dls/UCI HAR Dataset/test/y_test.txt")
subject_train <- read.table("C:/Users/Αλεξανδρος/Downloads/R dls/UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("C:/Users/Αλεξανδρος/Downloads/R dls/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("C:/Users/Αλεξανδρος/Downloads/R dls/UCI HAR Dataset/train/y_train.txt")

# naming the columns
colnames(x_test) <- features[,2]
colnames(x_train) <- features[,2]
colnames(y_test) <- "activityID"
colnames(y_train) <- "activityID"
colnames(subject_test) <- "subjectID"
colnames(subject_train) <- "subjectID"
colnames(activity_labels) <- c("activityID","activityType")

# merging them all together

test <- cbind(subject_test, x_test, y_test)
train <- cbind(subject_train, x_train, y_train)
Project <- rbind(test,train)

# extracting the mean and std

names <- colnames(Project)
mean_and_sd <- (grepl("activityID", names)|grepl("subjectID", names)|
                grepl("mean", names)|grepl("sd", names))
# subseting Project

mean_sd <- Project[, mean_and_sd == TRUE]

# assigning the activity names

activity_names <- merge(mean_sd, activity_labels, by = "activityID", all.x = TRUE)

# making the second dataset with the average of each variable for each activity and each subject

Project2 <- aggregate(. ~subjectID + activityID, activity_names, mean)
Project2 <- Project2[order(Project2$subjectID, Project2$activityID),]

# saving the project in txt format

write.table(Project2, "Project2.txt", row.name=FALSE)
