# Of the four types of sources indicated by the type (point, nonpoint, onroad,
# nonroad) variable, which of these four sources have seen decreases in
# emissions from 1999-2008 for Baltimore City?
# Which have seen increases in emissions from 1999-2008?
# Use the ggplot2 plotting system to make a plot answer this question.

require('ggplot2')
require('reshape2')

plot3 <- function() {

    # Get the subset of the data related to Baltimore, MD
    # NOTE: Utilizes the common subset_baltimore() function.
    # NOTE: Utilizes the common read_data() function.
    source("subset_baltimore.R")
    subset_baltimore()

    # Reshape the data to sort by year and emission type, then build a summary table.
    mdata=melt(baltimore.NEI, id=c("year", "type"), "Emissions")
    sdata=cast(mdata, year+type~variable, sum)
    # Convert to a factor variable so the years show up correctly on the plot.
    sdata$year=as.ordered(sdata$year)

    # Build the plot
    qplot(as.factor(year), Emissions, data=sdata, facets=type~., geom="bar", stat="identity") +
        ggtitle("Summary of Baltimore Emissions by Type and Year") +
        xlab("Year") +
        ylab(expression("Emissions/Year (Tons PM"[2.5]*")"))
}
