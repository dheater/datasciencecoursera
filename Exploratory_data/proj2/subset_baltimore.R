# Subset the NEI data to just the data from Balimore. Store that data in a
# global variable so it is cached (I.e., we only have to create the subset
# once).
subset_baltimore <- function() {

    # Read in the data.
    # NOTE: Utilizes the common read_data() function.
    #
    source("read_data.R")
    read_data()

    baltimore = "24510"


    # Assume that all samples (rows) are independent. I.e, emmisions are not
    # double-booked in the dataset
    baltimore.NEI <<- subset(NEI.M, fips == baltimore)
}
