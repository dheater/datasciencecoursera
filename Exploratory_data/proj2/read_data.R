# Read data from files and store in global variables so they are accessible
# from all of the functions. Essentially, this allows us to cache the data to
# save time.
#
read_data <-function() {

    # Only read the data if it doesn't exist. Store the data in a global variable.
    if(!exists("NEI")) {
        print("Reading NEI data... This takes a minute.")
        NEI <<- readRDS("summarySCC_PM25.rds")
    }
    if(!exists("SCC")) {
        print("Reading SCC data")
        SCC <<- readRDS("Source_Classification_Code.rds")
    }

    return
}
