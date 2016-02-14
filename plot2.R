#Loads in the data
powerData <- read.csv("~/Downloads/household_power_consumption.txt", sep=";", na.strings="?")
#Transforms date column to date type
powerData$Date <- as.Date(powerData$Date, format="%d/%m/%Y")
#Subsets data to the following two dates
partPowerData <- subset(powerData, subset=(Date == "2007-02-01" | Date == "2007-02-02"))
#Creates a time date stamp from the date and time values from the subsetted data
datetime <- paste(partPowerData$Date, partPowerData$Time)
partPowerData$Datetime <- as.POSIXct(datetime)
# Creates a line plot of global active power over time
plot(partPowerData$Global_active_power~partPowerData$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
#Saves plot
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()