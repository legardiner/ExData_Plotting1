#Loads in the data
powerData <- read.csv("~/Downloads/household_power_consumption.txt", sep=";", na.strings="?")
#Transforms date column to date type
powerData$Date <- as.Date(powerData$Date, format="%d/%m/%Y")
#Subsets data to the following two dates
partPowerData <- subset(powerData, subset=(Date == "2007-02-01" | Date == "2007-02-02"))
#Creates a time date stamp from the date and time values from the subsetted data
datetime <- paste(partPowerData$Date, partPowerData$Time)
partPowerData$Datetime <- as.POSIXct(datetime)
#Sets the parameters for our plot
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
#Creates four plots
#Plot from plot2.R
plot(partPowerData$Global_active_power~partPowerData$Datetime, type="l", ylab="Global Active Power", xlab="")
#Creates plot showing voltage over time
plot(partPowerData$Voltage~partPowerData$Datetime, type="l", ylab="Voltage", xlab="")
#Plot from plot3.R
plot(partPowerData$Sub_metering_1~partPowerData$Datetime, type="l", ylab="Energy sub metering", xlab="")
lines(partPowerData$Sub_metering_2~partPowerData$Datetime,col='Red')
lines(partPowerData$Sub_metering_3~partPowerData$Datetime,col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#Creates plot showing the global reactive power over time
plot(partPowerData$Global_reactive_power~partPowerData$Datetime, type="l", ylab="Global_reactive_power",xlab="")
#Saves plot
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()