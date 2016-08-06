# 
# Exploratory Data Analysis
# 06th August, 2016


#copy file into working directory.

#file name
fileName <- "household_power_consumption.txt"

#column names
colNames = c("date", "time", "globalActivePower", "globalReactivePower", "voltage", "globalIntensity", "subMetering1", "subMetering2", "subMetering3")
colClasses = c("character", "character", "numeric" )

#file input
dat <- read.table(fileName, header=TRUE, sep=";", col.names=colNames, colClasses=colClasses, na.strings="?")

#convert to Date type, then filter
dat$date = as.Date(dat$date, format="%d/%m/%Y")
dat = dat[dat$date >= as.Date("2007-02-01") & dat$date<=as.Date("2007-02-02"),]

#plot and save graph
png(filename="plot4.png", width=500, height=500, units="px")

par(mfrow=c(2,2))

#1st 
plot(dat$globalActivePower, type="l",xaxt="n",xlab="", ylab="Global Active Power")
axis(1, at=c(1, as.integer(nrow(dat)/2), nrow(dat)), labels=c("Thu", "Fri", "Sat"))

#2nd
plot(dat$voltage, type="l",xaxt="n",xlab="datetime", ylab="Voltage")
axis(1, at=c(1, as.integer(nrow(dat)/2), nrow(dat)), labels=c("Thu", "Fri", "Sat"))


#3rd
with(dat, {
   plot(subMetering1,type="l", xaxt="n", xlab="", ylab="Energy sub metering")
   lines(x=subMetering2, col="red")
   lines(x=subMetering3, col="blue")
})
axis(1, at=c(1, as.integer(nrow(dat)/2), nrow(dat)), labels=c("Thu", "Fri", "Sat"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), box.lwd = 0,box.col = "transparent", bg="transparent")

#4th
plot(dat$globalReactivePower, type="l",xaxt="n",xlab="datetime", ylab="Global_reactive_power")
axis(1, at=c(1, as.integer(nrow(dat)/2), nrow(dat)), labels=c("Thu", "Fri", "Sat"))

dev.off()
