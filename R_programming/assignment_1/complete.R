complete <- function(directory, id = 1:332) {
    ## Write a function that reads a directory full of files and reports the
    ## number of completely observed cases in each data file. The function should
    ## return a data frame where the first column is the name of the file and the
    ## second column is the number of complete cases. A prototype of this function
    ## follows

    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files

    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used

    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases

    df = data.frame(id=as.integer(0),
                    nobs=as.integer(0))
    for(i in id){
        fname = sprintf("%s/%03d.csv", directory, i)
        sample = read.csv(fname)
        nobs = sum(complete.cases(sample))
        df = rbind(df, c(i, nobs))
    }

    df[-1,]
}
