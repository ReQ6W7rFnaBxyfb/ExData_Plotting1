## get and unzip
fileUrl <- 'http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
if (!file.exists('..\\household_power_consumption.zip')) {
    download.file(fileUrl, '..\\household_power_consumption.zip', method='wininet')
    unzip('..\\household_power_consumption.zip',exdir="..")
}

