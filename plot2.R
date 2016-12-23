## Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
## Name each of the plot files as plot1.png, plot2.png, etc.
## Create a separate R code file that constructs the corresponding plot.
## Your code file should include code for reading the data so that the plot can be fully reproduced. 
## You must also include the code that creates the PNG file.
## Add the PNG file and R code file to the top-level folder of your git repository (no need for separate sub-folders)

## get file and unzip
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

## create and save the Global_active_power plot
png(file="plot2.png", width=480, height=480, bg="white")
plot(dat$Global_active_power~dat$Date_time, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()

