# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland
# (fips == "24510") from 1999 to 2008?
# Use the base plotting system to make a plot answering this question.

plot2 <- function() {

    # Get the subset of the data related to Baltimore, MD
    # NOTE: Utilizes the common subset_baltimore() function.
    # NOTE: Utilizes the common read_data() function.
    source("subset_baltimore.R")
    subset_baltimore()

    # Assume that all samples (rows) are independent. I.e, emmisions are not
    # double-booked in the dataset
    year.baltimore.emm <<- tapply(baltimore.NEI$Emissions, baltimore.NEI$year, sum)
    barplot(year.baltimore.emm, xlab="Year", main="Total Emissions/Year in Balitmore, MD",
            ylab=expression(Emissions/Year~(Tons~PM[2.5])))
}
