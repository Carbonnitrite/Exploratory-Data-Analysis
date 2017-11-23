dataF <- "./data/household_power_consumption.txt"

data1 <- read.table(dataF, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

subSetData <- data1[data1$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

GAP <- as.numeric(subSetData$Global_active_power)

png("plot2.png", width=480, height=480)

plot(datetime, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()