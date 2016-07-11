
# plot2.r

# Load data
library(dplyr)
power_all <- read.csv("household_power_consumption.txt", header = TRUE, sep=";", dec=".",na.strings = "?")
power <- filter (power_all, Date=="1/2/2007" | Date=="2/2/2007" )

# Remove large data frame that is no longer requiured
rm(power_all)


power$Date <- strptime(power$Date, "%d/%m/%Y")
power$DateTime <- strptime(paste(power$Date,power$Time), "%Y-%m-%d %H:%M:%OS")

# Draw histogram
png(file="plot2.png")
with(power, plot(DateTime, Global_active_power, type='l', ylab="Global Active Power (kilowatts)", xlab=""))
dev.off()

