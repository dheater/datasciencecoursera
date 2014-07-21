read_data <- function() {
    epc=read.table("data/household_power_consumption.txt", sep=";", header=T, na.strings="?")
    epc=epc[complete.cases(epc),]
    epc$Date=as.Date(epc$Date, format="%d/%m/%Y")
    sub.epc=subset(epc, Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))
    sub.epc$Sub_metering_1=as.numeric(as.character(sub.epc$Sub_metering_1))
    sub.epc$Sub_metering_2=as.numeric(as.character(sub.epc$Sub_metering_2))
    sub.epc$Sub_metering_3=as.numeric(as.character(sub.epc$Sub_metering_3))

    sub.epc
}
