setwd("data")
#reading the data
data <- read.table("../household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
#subsetting the data
subdata <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
#date and time conversion
date_time <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#building the plot
plot(date_time, subdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
#copy the plot to the PNG file
dev.copy(png, file = "plot2.png")
#closes the graphic device
dev.off()