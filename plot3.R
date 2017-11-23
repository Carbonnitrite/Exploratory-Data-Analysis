dataF <- "./data/household_power_consumption.txt"

data2 <- read.table(dataF, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

subSetData <- data2[data2$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData) 

#'DT' = DateTime
DT <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

globalActivePower <- as.numeric(subSetData$Global_active_power)

subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

png("plot3.png", width=480, height=480)

plot(DT, subMetering1, type="l", ylab="Energy Submetering", xlab="")

lines(DT, subMetering2, type="l", col="red")

lines(DT, subMetering3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()