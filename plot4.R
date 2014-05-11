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
subdata$Global_reactive_power <- as.numeric(subdata[,"Global_reactive_power"])
subdata$Sub_metering_1 <- as.numeric(subdata[,"Sub_metering_1"])
subdata$Sub_metering_2 <- as.numeric(subdata[,"Sub_metering_2"])
subdata$Sub_metering_3 <- as.numeric(subdata[,"Sub_metering_3"])
subdata$Voltage <- as.numeric(subdata[,"Voltage"])
## Launch png graphics device and makes plot directly
png (file = "plot4.png")
## Creats an output layout of 2*2 and plots drawn by rows
par(mfrow = c(2, 2))
## Starts creating plots
with(subdata, plot(MergedDate, Global_active_power, type = "l", xlab ="" , ylab = "Global Active Power"))
with(subdata, plot(MergedDate, Voltage, type = "l", xlab ="datetime" , ylab = "Voltage"))
with(subdata, plot(MergedDate, Sub_metering_1, type = "l", xlab ="" , ylab = "Energy sub metering"))
with(subdata, lines (MergedDate, Sub_metering_2, col ="Red"))
with(subdata, lines (MergedDate, Sub_metering_3, col ="Blue"))
legend("topright", lty = 1, bty = "n", col = c("Black", "Red", "Blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
with(subdata, plot(MergedDate, Global_reactive_power, type = "l", xlab ="datetime" , ylab = "Global_reactive_power"))
dev.off()
## End ..