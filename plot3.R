# Energy Usage Breakdown on Weekends
# Exploratory Data Analysis Project
# Date: 06th August, 2016
# 
#copy the file to working directory.

#file name
fileName <- "household_power_consumption.txt"

#column names
colNames = c("date", "time", "globalActivePower", "globalReactivePower", "voltage", "globalIntensity", "subMetering1", "subMetering2", "subMetering3")
colClasses = c("character", "character", "numeric" )

#read file
dat <- read.table(fileName, header=TRUE, sep=";", col.names=colNames, colClasses=colClasses, na.strings="?")

#convert to Date type, then filter
dat$date = as.Date(dat$date, format="%d/%m/%Y")
dat = dat[dat$date >= as.Date("2007-02-01") & dat$date<=as.Date("2007-02-02"),]

#plot and save graph
png(filename="plot3.png", width=500, height=500, units="px")
with(dat, {
   plot(subMetering1,type="l", xaxt="n", xlab="", ylab="Energy Sub Metering")
   lines(x=subMetering2, col="red")
   lines(x=subMetering3, col="blue")
})
axis(1, at=c(1, as.integer(nrow(dat)/2), nrow(dat)), labels=c("Thu", "Fri", "Sat"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

