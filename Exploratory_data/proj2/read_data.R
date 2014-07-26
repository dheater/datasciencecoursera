# Read data from files and store in s global variables so the data is readily
# accessible from all of the functions. Essentially, this allows us to cache
# the data to save time.
#
read_data <-function() {

    # Read and ~erge the datasets and store the result in a global variable.
    if(!exists("NEI.M")) {
        print("Reading NEI data... This takes a minute.")
        NEI <- readRDS("summarySCC_PM25.rds")

        print("Reading SCC data")
        SCC <- readRDS("Source_Classification_Code.rds")

        print("Merging the datasets... You've got time to take a nap...")
        NEI.M <<- merge(NEI, SCC)
    }
}
