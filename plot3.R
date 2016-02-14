#Loads in the data
powerData <- read.csv("~/Downloads/household_power_consumption.txt", sep=";", na.strings="?")
#Transforms date column to date type
powerData$Date <- as.Date(powerData$Date, format="%d/%m/%Y")
#Subsets data to the following two dates
partPowerData <- subset(powerData, subset=(Date == "2007-02-01" | Date == "2007-02-02"))
#Creates a time date stamp from the date and time values from the subsetted data
datetime <- paste(partPowerData$Date, partPowerData$Time)
partPowerData$Datetime <- as.POSIXct(datetime)
# Creates a line plot comparing the sub-metering over time
plot(partPowerData$Sub_metering_1~partPowerData$Datetime, type="l", ylab="Energy sub metering", xlab="")
lines(partPowerData$Sub_metering_2~partPowerData$Datetime,col='Red')
lines(partPowerData$Sub_metering_3~partPowerData$Datetime,col='Blue')
# Adds a legend
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#Saves plot
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()