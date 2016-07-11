
# plot3.r

# Load data
library(dplyr)
power_all <- read.csv("household_power_consumption.txt", header = TRUE, sep=";", dec=".",na.strings = "?")
power <- filter (power_all, Date=="1/2/2007" | Date=="2/2/2007" )

# Remove large data frame that is no longer requiured
rm(power_all)


power$Date <- strptime(power$Date, "%d/%m/%Y")
power$datetime <- strptime(paste(power$Date,power$Time), "%Y-%m-%d %H:%M:%OS")

# Draw histogram
png(file="plot3.png")

with(power, plot(datetime, Sub_metering_1 , type='l', ylab="Energy sub metering",xlab=""))
with(power, points(datetime, Sub_metering_2 , type='l', col="red"))
with(power, points(datetime, Sub_metering_3 , type='l', col="blue"))
legend("topright", lty=1, col = c("black","blue", "red"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

dev.off()


