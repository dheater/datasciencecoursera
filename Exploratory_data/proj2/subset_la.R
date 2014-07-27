# Subset the NEI data to just the data from L.A.. Store that data in a
# global variable so it is cached (I.e., we only have to create the subset
# once).
subset_la <- function() {

    # Read in the data.
    # NOTE: Utilizes the common read_data() function.
    source("read_data.R")
    read_data()

    # FIPS code for L.A.
    la = "06037"


    # Assume that all samples (rows) are independent. I.e, emmisions are not
    # double-booked in the dataset
    la.NEI <<- subset(NEI.M, fips == la)
}
