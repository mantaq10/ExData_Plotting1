# End of Week Active Power Usage 
# Exploratory Data Analysis Project
# Date: 06th August, 2016
# 
#copy file to working directory. 
fileName <- "household_power_consumption.txt"

#metadata
colNames = c("date", "time", "globalActivePower", "globalReactivePower", "voltage", "globalIntensity", "subMetering1", "subMetering2", "subMetering3")
colClasses = c("character", "character", "numeric" )

#file input
dat <- read.table(fileName, header=TRUE, sep=";", col.names=colNames, colClasses=colClasses, na.strings="?")

#date conversion
dat$date = as.Date(dat$date, format="%d/%m/%Y")
dat = dat[dat$date >= as.Date("2007-02-01") & dat$date<=as.Date("2007-02-02"),]

#plotting
png(filename="plot2.png", width=500, height=500, units="px")
plot(dat$globalActivePower, type="l",xaxt="n",xlab="", ylab="Global Active Power (kilowatts)")
axis(1, at=c(1, as.integer(nrow(dat)/2), nrow(dat)), labels=c("Thu", "Fri", "Sat"))
dev.off()
