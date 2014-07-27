# Compare emissions from motor vehicle sources in Baltimore City with emissions
# from motor vehicle sources in Los Angeles County, California (fips ==
# "06037"). Which city has seen greater changes over time in motor vehicle
# emissions?
plot6 <- function() {

    # Get the subset of the data related to Baltimore and L.A.
    # NOTE: Utilizes the common subset_baltimore() function.
    # NOTE: Utilizes the common read_data() function.
    source("subset_baltimore.R")
    subset_baltimore()
    source("subset_la.R")
    subset_la()

    # Look at only motor vehicles.
    # NOTE: There has been a lot of discussion about what the "correct" filter
    # is. I think this one is good, but even if its not exact, it should be
    # sufficient to see the trend over the range of years since the same filter
    # is used for all years.
    balt.sub = subset(baltimore.NEI, Data.Category == "Onroad")
    la.sub = subset(la.NEI, Data.Category == "Onroad")

    # Reshape the data to sort by year and emission type, then build a summary
    # tables for each city.
    balt.mdata=melt(balt.sub, id="year", "Emissions")
    balt.sdata=cast(balt.mdata, year~variable, sum)
    la.mdata=melt(la.sub, id="year", "Emissions")
    la.sdata=cast(la.mdata, year~variable, sum)

    # Bind the data from the two cities.
    sdata=cbind(balt.sdata, la.sdata$Emissions)

    # Set up the data for plotting. We create a matrix with only the values of interest.
    # It has to be transposed to get the correct barplot. Also, set the labels
    # on the columns to the years so we get readable values on the axis.
    pdata=t(as.matrix(sdata[,2:3]))
    colnames(pdata)=sdata$year

    # Build the plot
    barplot(pdata, beside=TRUE,
            main="Motor Vehicle Emissions",
            xlab="Year",ylab=expression(Emissions/Year~(Tons~PM[2.5])),
            col=c("red", "blue"))

    # Print a legend outside of the plot area.
    par(xpd=TRUE)
    legend(1, -800, c("Baltimore", "L.A."), pch=15, col=c("red", "blue"), bty="n")
    par(xpd=FALSE)
}
