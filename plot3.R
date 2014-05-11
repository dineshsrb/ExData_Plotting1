## read the dataset household_power_consumption.txt
data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?", colClasses = "character")
## Subset the data for specific dates
subdata <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
## Use strptime () for Date - time conversion
subdata$MergedDate <- strptime(paste(subdata$Date, subdata$Time), "%d/%m/%Y %H:%M:%S")
## Use as.Date() to convert to Date class from character
subdata$Date <- as.Date(subdata$Date, format = "%d/%m/%Y")
## Converting the column from character class to numeric
subdata$Global_active_power <- as.numeric(subdata[,"Global_active_power"])
subdata$Sub_metering_1 <- as.numeric(subdata[,"Sub_metering_1"])
subdata$Sub_metering_2 <- as.numeric(subdata[,"Sub_metering_2"])
subdata$Sub_metering_3 <- as.numeric(subdata[,"Sub_metering_3"])
## Launch png graphics device and makes plot directly
png (file = "plot3.png")
## Creat a plot of Sub metering 1
with(subdata, plot(MergedDate, Sub_metering_1, type = "l", xlab ="" , ylab = "Energy sub metering"))
## add lines to the existing plot for submetering 2 and 3
with(subdata, lines (MergedDate, Sub_metering_2, col ="Red"))
with(subdata, lines (MergedDate, Sub_metering_3, col ="Blue"))
## add legends to the existing plot
legend("topright", lty = 1, col = c("Black", "Red", "Blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
## End ..