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

    # Read in the labels from the features file.
    labels = read.table("features.txt")

    #colnames(ds) <- c("Subject", "Activity", toString(labels[,2]))

    ds
}
