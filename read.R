## Read in data for two days
library(data.table)
if (!exists("dat")) {
    dat<-fread("grep \"^\\(Date\\|[12]/2/2007\\)\" ..\\household_power_consumption.txt", header=T, 
               sep=";", na.strings="?", stringsAsFactors = F, colClasses=c("character", "character", rep("numeric",7)))
    
    ## create a column  with POXISct version of the date and time
    dat$Date_time <- as.POSIXct(paste(dat$Date,dat$Time), tz=Sys.timezone(), "%d/%m/%Y %H:%M:%S")
}
