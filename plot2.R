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
## Draw a plot of "Global active power"
with(subdata, plot(MergedDate, Global_active_power, type = "l", xlab ="" , ylab = "Global Active Power (kilowatts)"))
## Copy the plot from display screen to png
dev.copy(png, file ="plot2.png")
dev.off()
## End..