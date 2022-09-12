
#read data
data_full <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")
sub_set <- data_full[(data_full$Date=="1/2/2007" | data_full$Date=="2/2/2007" ), ]

## Plot 1
hist(sub_set$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

## export file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()


