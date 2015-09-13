setwd("data")
#reading the data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
#subsetting the data
subdata <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
#date and time conversion
date_time <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#building the plot
par(mar = c(4, 4, 1, 2))
plot(date_time, subdata$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(date_time, subdata$Sub_metering_2, type="l", col="red")
lines(date_time, subdata$Sub_metering_3, type="l", col="blue")
#adding the legend to the plot
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 1, col=c("black", "red", "blue"))
#copy the plot to the PNG file
dev.copy(png, file = "plot3.png")
#closes the graphic device
dev.off()

