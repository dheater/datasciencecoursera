run_analysis <- function() {

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

    ds
}
