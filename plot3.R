data <- read.csv("~/data/household_power_consumption.txt", sep=";")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S") 

date <- as.POSIXct(data$Date, format="%d/%m/%Y") 
tmp <- date == "2007-02-01" | date == "2007-02-02"

# Crop data
cropData <- data[tmp,]
cropData[,3:9]<-as.double(as.matrix(cropData[,3:9]));
cropData$DateTime <- format(cropData$Date, format="%a")

# Create plot and print plot results
plot(cropData$DateTime,cropData$Sub_metering_1,type='l',xlab ="", ylab = "Energy sub metering")
lines(cropData$DateTime,cropData$Sub_metering_2,type='l', col='red')
lines(cropData$DateTime,cropData$Sub_metering_3,type='l', col='blue')
legend("topright", pch ='-', col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

dev.copy(png, file = "Plot3.png", width = 480, height = 480)
dev.off()
