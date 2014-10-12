# reads plot file
source('plotreadfile.R')
d <- plotreadfile('household_power_consumption.txt')
# builds timeseries plot
par(mfrow=c(1,1)) 
plot(d$DateTime, d$Global_active_power, type='l', xlab='', ylab='Global Active Power (kilowatts)')
# saves to png
savetopng('plot2.png')