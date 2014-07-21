plot4 <- function(data) {
    datetime <- strptime( paste(data$Date,data$Time), format="%Y-%m-%d %H:%M:%S")
    png(filename="figure/plot4.png", bg="transparent", height=480, width=480)
    op=par(mfrow=c(2,2))
    with(data, plot(datetime, as.numeric(as.character(Global_active_power)), type="l", ylab="Global Active Power (killowatts)", xlab=""))
    with(data, plot(datetime, as.numeric(Voltage), type="l", ylab="Voltage"))
    with(d, plot(dateTime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
    with(d, lines(dateTime, Sub_metering_2, type="l", col="red"))
    with(d, lines(dateTime, Sub_metering_3, type="l", col="blue"))
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=c(2,2,2), col=c("black", "red", "blue"), bty="n")
    with(data, plot(datetime, as.numeric(Global_reactive_power), type="l", ylab="Global_reactive_power"))
    dev.off()
}
