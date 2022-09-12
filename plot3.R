#read data
data_full <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")
sub_set <- data_full[(data_full$Date=="1/2/2007" | data_full$Date=="2/2/2007" ), ]

#format date and time
sub_set$Date <- as.Date(sub_set$Date, format="%d/%m/%Y")
dateTime <- paste(sub_set$Date, sub_set$Time)
sub_set$DateTime <- as.POSIXct(dateTime)

#plot 3
plot(x = sub_set$DateTime, y = sub_set$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(x = sub_set$DateTime, y = sub_set$Sub_metering_2, type = "l", col = "red")
lines(x = sub_set$DateTime, y = sub_set$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## export file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
