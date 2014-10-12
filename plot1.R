# reads plot file
source('plotreadfile.R')
d <- plotreadfile('household_power_consumption.txt')
# builds histogram
par(mfrow=c(1,1)) 
hist(d$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")
# saves to png
savetopng('plot1.png')

