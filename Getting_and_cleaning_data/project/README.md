==================================================================
#Getting and Cleaning Data Project
##README
------------------------------------------------------------------

Following are the task set forth by the assignment:
> You should create one R script called `run_analysis.R` that does the following:
> 1. Merges the training and the test sets to create one data set.
> 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
> 3. Uses descriptive activity names to name the activities in the data set
> 4. Appropriately labels the data set with descriptive variable names. 
> 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The `run_analysis.R` script provides a `run_analysis` function that performs the abover operations.

Specifically, it assumes that the `test` and `train` data are provide in directories by that name and are in the format provide by the authors study. The two datasets are then merged into one.

The first and second columns are the `Subject` and `Activitiy` variables. The remaining data variable labels are pulled from the `features.txt` file provided by the authors and are manipulated to make that easier to process using standard programming languages. These modifications are further described in the `Codebook.md` file.

The numeric activity ids provided by the authors are replaced by more descriptive factor variables to tidy the data.

The objective of producing a subset of the data that includes only the mean and standard deviation data from the original dataset it produced. This data file is saved as `mean_std.txt`. Out of concern of confusing reviewers, only the final dataset was uploaded to the Coursera assignment page, however, the data file is stored in the git repository for review.

The dataset is "melted" using the activity and subject as id. It is them summarized by calcating and storing the mean of each of the variables by `Activity/Subject`. While the assignment is not clear on what the desired summary, it is assumed that any requisite combination of mean values can be accessed from this data. This format also meets the definitions of "tidy data" by:
- having only one table per file
- having only one measurement type per column
- having only one sample per row
