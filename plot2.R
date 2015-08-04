x <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",
                na.strings = "?",stringsAsFactors = FALSE)
library(dplyr)
y <- filter(x, Date=="1/2/2007"|Date=="2/2/2007")

z <- strptime(paste(y$Date, y$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

plot(z, y$Global_active_power,type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()