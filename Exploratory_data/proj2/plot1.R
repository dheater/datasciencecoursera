# Have total emissions from PM2.5 decreased in the United States from 1999 to
# 2008?
# Using the base plotting system, make a plot showing the total PM2.5
# emission from all sources for each of the years 1999, 2002, 2005, and 2008.
# NOTE: Utilizes the common read_data() function.

plot1 <- function() {

    # Read in the data.
    #
    source("read_data.R")
    read_data()

    # Assume that all samples (rows) are independent. I.e, emmisions are not
    # double-booked in the dataset
    year.total.emm <- tapply(NEI.M$Emissions, NEI.M$year, sum)
    barplot(year.total.emm, xlab="Year",ylab=expression(Emissions/Year~(Tons~PM[2.5])))
}
