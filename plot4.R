pdata  <- read.csv("Downloads/household_power_consumption.txt",header = TRUE, sep=";",stringsAsFactors=FALSE)
pdata$newfilterDate<- with(pdata, as.POSIXlt(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))
mdata <- subset(pdata,newfilterDate>=as.POSIXlt("2007-02-01") & newfilterDate<=as.POSIXlt("2007-02-03"))
mdata$Global_active_powerNEW <- as.numeric(mdata$Global_active_power)
mdata$Sub_metering_1 <- as.numeric(mdata$Sub_metering_1)
mdata$Sub_metering_2 <- as.numeric(mdata$Sub_metering_2)
mdata$Sub_metering_3 <- as.numeric(mdata$Sub_metering_3)
mdata$Voltage<- as.numeric(mdata$Voltage)
mdata$Global_reactive_powerNEW<- as.numeric(mdata$Global_reactive_power)
par(mfcol=c(2,2))

plot(mdata$newfilterDate,mdata$Global_active_powerNEW, type = "l", ylab ="Global Active Power (kilowatts)", xlab = "")

plot(mdata$newfilterDate,mdata$Sub_metering_1, type = "l", ylab ="Energy sub metering", xlab = "")
lines(mdata$newfilterDate,mdata$Sub_metering_2, type = "l", col="red")
lines(mdata$newfilterDate,mdata$Sub_metering_3, type = "l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c(1, 2, 3), lty = c(1,1,1))

plot(mdata$newfilterDate,mdata$Voltage, type = "l", ylab ="Voltage", xlab = "")

plot(mdata$newfilterDate,mdata$Global_reactive_powerNEW, type = "l", ylab ="Global_reactive_power", xlab = "")

dev.copy(png,"plot4.png")
dev.off()