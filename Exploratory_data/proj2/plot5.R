# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
plot5 <- function() {

    # Get the subset of the data related to Baltimore, MD
    # NOTE: Utilizes the common subset_baltimore() function.
    # NOTE: Utilizes the common read_data() function.
    source("subset_baltimore.R")
    subset_baltimore()

    # Look at only motor vehicles.
    # NOTE: There has been a lot of discussion about what the "correct" filter
    # is. I think this one is good, but even if its not exact, it should be
    # sufficient to see the trend over the range of years since the same filter
    # is used for all years.
    s1 = subset(baltimore.NEI, grepl("Onroad", baltimore.NEI$Data.Category))

    baltimore.motor = tapply(s1$Emissions, s1$year, sum)
    barplot(baltimore.motor , main="Baltimore Motor Vehicle Emissions",
            xlab="Year",ylab=expression(Emissions/Year~(Tons~PM[2.5])))
}
