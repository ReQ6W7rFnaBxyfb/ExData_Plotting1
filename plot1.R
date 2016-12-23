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

## create and save the Global_active_power histogram
png(file="plot1.png", width=480, height=480, bg="white")
hist(dat$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
