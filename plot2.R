## Read in data for two days
data<-fread("grep \"^\\(Date\\|[12]/2/2007\\)\" ..\\household_power_consumption.txt", header=T, sep=";", na.strings="?", stringsAsFactors = F, colClasses=c("character", "character", rep("numeric",7)))

## create a column  with POXISct version of the date and time
data$Date_time <- as.POSIXct(paste(data$Date,data$Time), tz=Sys.timezone(), "%d/%m/%Y %H:%M:%S")

## create and save the Global_active_power plot
png(file="plot2.png", width=480, height=480, bg="white")

with(data, { plot(data$Global_active_power~data$Date_time, type="l", ylab="Global Active Power (kilowatts)", xlab="") })

dev.off()

