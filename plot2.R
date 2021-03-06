pdata  <- read.csv("Downloads/household_power_consumption.txt",header = TRUE, sep=";")
pdata$newfilterDate<- with(pdata, as.POSIXlt(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))
mdata <- subset(pdata,newfilterDate>=as.POSIXlt("2007-02-01") & newfilterDate<=as.POSIXlt("2007-02-03"))
mdata$Global_active_power <- as.numeric(mdata$Global_active_power)
plot(mdata$newfilterDate,mdata$Global_active_power, type = "l", ylab ="Global Active Power (kilowatts)", xlab = "")
dev.copy(png,"plot2.png")
dev.off()