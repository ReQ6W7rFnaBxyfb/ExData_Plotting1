## Read in data for two days
data<-fread("grep \"^\\(Date\\|[12]/2/2007\\)\" ..\\household_power_consumption.txt", header=T, sep=";", na.strings="?", stringsAsFactors = F, colClasses=c("character", "character", rep("numeric",7)))

## create a column  with POXISct version of the date and time
data$Date_time <- as.POSIXct(paste(data$Date,data$Time), tz=Sys.timezone(), "%d/%m/%Y %H:%M:%S")

## create and save the Global_active_power histogram
png(file="plot1.png", width=480, height=480, bg="white")

hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()




