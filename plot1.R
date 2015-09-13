setwd("data")
#reading the data
data <- read.table("../household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
#subsetting the data
subdata <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
#building the histogram
hist(subdata$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
#copy the plot to the PNG file
dev.copy(png, file = "plot1.png")
#closes the graphic device
dev.off()
