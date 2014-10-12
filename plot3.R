# reads plot file
source('plotreadfile.R')
d <- plotreadfile('household_power_consumption.txt')
# builds timeseries plot
par(mfrow=c(1,1)) 
with(d, {
    plot(DateTime, Sub_metering_1, type='n')
    points(DateTime, Sub_metering_1, type='l', col='black')
    points(DateTime, Sub_metering_2, type='l', col='red')
    points(DateTime, Sub_metering_3, type='l', col='blue')
    # adds legend, don't know a way to derive this automatically from points, so spelling it out...    
    legend("topright", c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), col=c('black', 'red', 'blue'), lwd=1, cex=0.7)
})
# saves to png
savetopng('plot3.png')