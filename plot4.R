# reads plot file
source('plotreadfile.R')
d <- plotreadfile('household_power_consumption.txt')
par(mfrow=c(2,2)) # multiple plots, 2 columns 2 rows
# builds timeseries plot
with(d, {
    # plot 1,1
    plot(DateTime, Global_active_power, xlab="", ylab='Global Active Power', type='l')
    # plot 1,2
    plot(DateTime, Voltage, xlab='datetime', type='l')
    # plot 2,1
    plot(DateTime, Sub_metering_1, xlab="", ylab='Energy sub metering', type='n')
    points(DateTime, Sub_metering_1, type='l', col='black')
    points(DateTime, Sub_metering_2, type='l', col='red')
    points(DateTime, Sub_metering_3, type='l', col='blue')
    # adds legend, don't know a way to derive this automatically from points, so spelling it out...    
    legend("topright", c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col=c('black', 'red', 'blue'), lwd=2)
    # plot 2,2
    plot(DateTime, Global_reactive_power, xlab='datetime', type='l')
})
# saves to png
savetopng('plot4.png')