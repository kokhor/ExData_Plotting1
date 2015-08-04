x <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",
                na.strings = "?",stringsAsFactors = FALSE)
library(dplyr)
y <- filter(x, Date=="1/2/2007"|Date=="2/2/2007")

z <- strptime(paste(y$Date, y$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

plot(z, y$Sub_metering_1, type="l", ylab="Energy Sub Metering", xlab="")
lines(z, y$Sub_metering_2, type="l", col="red")
lines(z, y$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()