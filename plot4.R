setwd("data")
#reading the data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
#subsetting the data
subdata <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
#date and time conversion
date_time <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#setting up the space for the plots
par(mar = c(4, 4, 2, 1), mfrow = c(2, 2))
#building plot 1
plot(date_time, subdata$Global_active_power, type="l", xlab="", ylab="Global Active Power")
#building plot 2
plot(date_time, subdata$Voltage, type="l", xlab="datetime", ylab="Voltage")
#building plot 3
plot(date_time, subdata$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(date_time, subdata$Sub_metering_2, type="l", col="red")
lines(date_time, subdata$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1, bty = "n", col=c("black", "red", "blue"), cex = 0.8)
#building plot 4
plot(date_time, subdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
#copy the plot to the PNG file
dev.copy(png, file = "plot4.png")
#closes the graphic device
dev.off()