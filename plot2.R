#read data
data_full <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")
sub_set <- data_full[(data_full$Date=="1/2/2007" | data_full$Date=="2/2/2007" ), ]

#format date and time
sub_set$Date <- as.Date(sub_set$Date, format="%d/%m/%Y")
dateTime <- paste(sub_set$Date, sub_set$Time)
sub_set$DateTime <- as.POSIXct(dateTime)

## Plot 2
plot(sub_set$Global_active_power~sub_set$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

## export file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
