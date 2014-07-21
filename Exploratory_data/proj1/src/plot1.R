plot1 <- function(data) {
    png(filename="figure/plot1.png", bg="transparent", height=480, width=480)
    with(data, hist(as.numeric(as.character(Global_active_power)), col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power"), breaks=12)
    dev.off()
}
