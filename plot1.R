

# plot1.r

# Load data
library(dplyr)
power_all <- read.csv("household_power_consumption.txt", header = TRUE, sep=";", dec=".",na.strings = "?")
power <- filter (power_all, Date=="1/2/2007" | Date=="2/2/2007" )

# Remove large data frame that is no longer requiured
rm(power_all)


power$Date <- strptime(power$Date, "%d/%m/%Y")
power$DateTime <- strptime(paste(power$Date,power$Time), "%Y-%m-%d %H:%M:%OS")

# Draw histogram
png(file="plot1.png")
hist(power$Global_active_power, col="red", xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()

