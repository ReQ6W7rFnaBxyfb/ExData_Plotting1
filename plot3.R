## Read in data for two days
data<-fread("grep \"^\\(Date\\|[12]/2/2007\\)\" ..\\household_power_consumption.txt", header=T, sep=";", na.strings="?", stringsAsFactors = F, colClasses=c("character", "character", rep("numeric",7)))

## create a column  with POXISct version of the date and time
data$Date_time <- as.POSIXct(paste(data$Date,data$Time), tz=Sys.timezone(), "%d/%m/%Y %H:%M:%S")

## create and save the sub-metering chart
png(file="plot3.png", width=480, height=480, bg="white")

with(data, {
    plot(Sub_metering_1~Date_time, type="l", ylab="Energy sub metering", xlab="")
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="o",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    lines(Sub_metering_2~Date_time,col='Red')
    lines(Sub_metering_3~Date_time,col='Blue')
    bg="white"
})

dev.off()
