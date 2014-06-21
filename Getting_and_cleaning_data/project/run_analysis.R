require(reshape2)

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

    # 3. Uses descriptive activity names to name the activities in the data set
    # Convert activities from numerics to factors.
    activities = read.table("activity_labels.txt")
    fdata=sort(unique(ds$Activity))
    levels(fdata) = activities[,2]
    ds$Activity = cut(ds$Activity, 6, activities[,2])

    # 2. Extracts only the measurements on the mean and standard deviation for each measurement.
    # Make subset of mean and std deviation.
    filter = c(grep("std", ignore.case=TRUE, names(ds)),
               grep("mean", ignore.case=TRUE, names(ds)))

    mean_std = subset(ds, select=c(Subject, Activity, filter))

    # Write the table.
    write.table(mean_std, "mean_std.txt")

    # 5. Creates a second, independent tidy data set with the average of each
    # variable for each activity and each subject

    # Melt the data id'd by activity and subject and take the mean of the id combinations.
    mdata=melt(ds, id=c("Activity", "Subject"))
    tidydata=dcast(mdata,Activity+Subject~variable, mean)

    # Write the tidy data to a file.
    write.table(tidydata, "tidydata.txt")

    # Supress the return value.
    return(NULL)
}
