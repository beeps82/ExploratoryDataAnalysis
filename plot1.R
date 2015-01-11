data <- read.csv("~/data/household_power_consumption.txt", sep=";")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S") 

date <- as.POSIXct(data$Date, format="%d/%m/%Y") 
tmp <- date == "2007-02-01" | date == "2007-02-02"

# Crop data
cropData <- data[tmp,]
cropData[,3:9]<-as.double(as.matrix(cropData[,3:9]));
cropData$DateTime <- format(cropData$Date, format="%a")

# Create plot and print plot results
hist(cropData$Global_active_power,main="Global Active Power",xlab ='Global Active Power(kilowatts)',ylab="Frequency",col='red')
dev.copy(png, file = "Plot1.png", width = 480, height = 480)
dev.off()
