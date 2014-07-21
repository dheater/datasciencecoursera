plot3 <- function(data) {
    dateTime <- strptime( paste(data$Date,data$Time), format="%Y-%m-%d %H:%M:%S")
    png(filename="figure/plot3.png", bg="transparent", height=480, width=480)
    with(d, plot(dateTime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
    with(d, lines(dateTime, Sub_metering_2, type="l", col="red"))
    with(d, lines(dateTime, Sub_metering_3, type="l", col="blue"))
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=c(2,2,2), col=c("black", "red", "blue"))
    dev.off()
}
