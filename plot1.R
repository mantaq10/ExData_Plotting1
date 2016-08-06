#GLobal Active Power
# Course: Exploratory Data Analysis Course Project
# Date: 06th August, 2016

#copy file to working directory. 
fileName <- "household_power_consumption.txt"

#column names
colNames = c("date", "time", "globalActivePower", "globalReactivePower", "voltage", "globalIntensity", "subMetering1", "subMetering2", "subMetering3")
colClasses = c("character", "character", "numeric" )

#file input
dat <- read.table(fileName, header = TRUE, sep = ";", col.names = colNames, colClasses = colClasses, na.strings = "?")

#date conversion
dat$date = as.Date(dat$date, format = "%d/%m/%Y")
dat = dat[dat$date >= as.Date("2007-02-01") & dat$date <= as.Date("2007-02-02"),]

#plotting
png(filename = "plot1.png", width = 500, height = 500, units = "px")
hist(dat$globalActivePower, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
