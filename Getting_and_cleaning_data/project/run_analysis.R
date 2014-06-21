run_analysis <- function() {

    # 1. Merges the training and the test sets to create one data set.
    # Read and bind all of the test data into columns.
    test.subject=read.table("test/subject_test.txt")
    test.x=read.table("test/X_test.txt")
    test.y=read.table("test/y_test.txt")
    test.data=cbind(test.subject, test.y, test.x)

    # Read and bind all of the training data into columns.
    train.subject=read.table("train/subject_train.txt")
    train.x=read.table("train/X_train.txt")
    train.y=read.table("train/y_train.txt")
    train.data=cbind(train.subject, train.y, train.x)

    # Row bind the test and training datasets together.
    ds=rbind(test.data, train.data)

    # 4. Uses descriptive activity names to name the activities in the data set
    # Read in the labels from the features file and clean them up.
    features = read.table("features.txt")
    labels = sapply(features[,2], toString)
    labels = gsub("()", "", labels, fixed=TRUE)
    labels = gsub(")", "", labels, fixed=TRUE)
    labels = gsub("(", "_", labels, fixed=TRUE)
    labels = gsub(",", "_", labels, fixed=TRUE)
    labels = gsub("-", "_", labels, fixed=TRUE)

    # Put tidy names on all of the columns.
    colnames(ds) <- c("Subject", "Activity", labels)

    # 2. Extracts only the measurements on the mean and standard deviation for each measurement.
    # Make subset of mean and std deviation.
    mean_std = c(grep("std", ignore.case=TRUE, names(ds)),
                 grep("mean", ignore.case=TRUE, names(ds)))

    mean_std_ds = subset(ds, select=mean_std)

    # 3. Uses descriptive activity names to name the activities in the data set
    # Convert activities from numerics to factors.
    activities = read.table("activity_labels.txt")
    fdata=sort(unique(ds$Activity))
    levels(fdata) = activities[,2]
    ds$Activity = cut(ds$Activity, 6, activities[,2])

    # 5. Creates a second, independent tidy data set with the average of each
    # variable for each activity and each subject
    # Write the tidy data to a file.
    write.table(ds, "tidydata.txt")

    # Return the tidy dataset.
    ds
}
