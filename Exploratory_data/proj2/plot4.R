# Across the United States, how have emissions from coal combustion-related
# sources changed from 1999-2008?
plot4 <- function() {

    # Read in the data.
    # NOTE: Utilizes the common read_data() function.
    source("read_data.R")
    read_data()

    # Look at only coal combustion.
    # NOTE: There has been a lot of discussion about what the "correct" filter
    # is. I think this one is good, but even if its not exact, it should be
    # sufficient to see the trend over the range of years since the same filter
    # is used for all years.
    s1 = subset(NEI.M, grepl("Comb", NEI.M$SCC.Level.One))
    s2 = subset(s1, grepl("Coal", NEI.M$SCC.Level.Three))

    total.coal = tapply(s2$Emissions, s2$year, sum)
    barplot(total.coal, main="Coal Combustion Emissions",
            xlab="Year",ylab=expression(Emissions/Year~(Tons~PM[2.5])))
}
