## get and unzip
fileUrl <- 'http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
if (!file.exists('..\\household_power_consumption.zip')) {
    download.file(fileUrl, '..\\household_power_consumption.zip', method='wininet')
    unzip('..\\household_power_consumption.zip',exdir="..")
}

## Read in data for two days
library(data.table)
if (!exists("dat")) {
    dat<-fread("grep \"^\\(Date\\|[12]/2/2007\\)\" ..\\household_power_consumption.txt", header=T, 
        sep=";", na.strings="?", stringsAsFactors = F, colClasses=c("character", "character", rep("numeric",7)))
    
    ## create a column  with POXISct version of the date and time
    dat$Date_time <- as.POSIXct(paste(dat$Date,dat$Time), tz=Sys.timezone(), "%d/%m/%Y %H:%M:%S")
}

## create and save four charts for power, voltage, and sub-metering
png(file="plot4.png", width=480, height=480, bg="white")

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(dat, {
    plot(Global_active_power~Date_time, type="l", 
         ylab="Global Active Power", xlab="")
    plot(Voltage~Date_time, type="l", 
         ylab="Voltage", xlab="datetime")
    plot(Sub_metering_1~Date_time, type="l", 
         ylab="Energy sub metering", xlab="")
    lines(Sub_metering_2~Date_time,col='Red')
    lines(Sub_metering_3~Date_time,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~Date_time, type="l", 
         ylab="Global_reactive_power",xlab="datetime")
})

dev.off()
