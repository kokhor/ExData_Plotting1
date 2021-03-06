x <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",
                na.strings = "?",stringsAsFactors = FALSE)
library(dplyr)
y <- filter(x, Date=="1/2/2007"|Date=="2/2/2007")

z <- strptime(paste(y$Date, y$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
plot(z, y$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(z, y$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(z, y$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(z, y$Sub_metering_2, type="l", col="red")
lines(z, y$Sub_metering_3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=, lwd=1, col=c("black", "red", "blue"), bty="o")

plot(z, y$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")



dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()