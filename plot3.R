## Read data from downloaded file
## set nrows to 70000 because data of interest is in rows ~(66000 - 70000) and the last 1.9+ million rows of the dataset are unneeded
mydat<-read.table("household_power_consumption.txt", header = TRUE, nrows = 70000, sep = ";", na.strings = "?", stringsAsFactors = FALSE, colClasses = c("character", "character", rep("numeric",7)))

## Combine date and time and create new column 'datetime' for plotting
datetime<-as.POSIXct(paste(mydat$Date, mydat$Time), format="%d/%m/%Y %H:%M:%S")
mydat$datetime<-datetime

## Select the two dates for the assignment (2007-02-01 and 2007-02-02)
mydat2<-mydat[mydat$datetime>"2007-1-31 23:59:00" & mydat$datetime<"2007-2-3 00:00:00",]

## plot line of Sub_metering_1 over time
plot(mydat2$datetime, mydat2$Sub_metering_1, type = "l", main=NULL, xlab = "", ylab="Energy sub metering")

## add line of Sub_metering_2 over time
lines(mydat2$datetime, mydat2$Sub_metering_2, col = "red")

## add line of Sub_metering_3 over time
lines(mydat2$datetime, mydat2$Sub_metering_3, col = "blue")

## add legend
legend("topright", lty = 1, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"))

## save to png file
dev.copy(png, file = "plot3.png")

## close device
dev.off()