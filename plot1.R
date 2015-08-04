x <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",
                na.strings = "?",stringsAsFactors = FALSE)
library(dplyr)
y <- filter(x, Date=="1/2/2007"|Date=="2/2/2007")

hist(y$Global_active_power,main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col = "red")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()