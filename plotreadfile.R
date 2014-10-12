#
# reads power consuption file
#
# 
# common functions for plotting exercises
#

#
# reads file
#
plotreadfile <- function(name) {
    if (!file.exists("data.csv")) {
        # samples a few rows to derive types
        rowsample <- read.table(name, sep=";", header=TRUE, nrows=10, fill=TRUE, na.strings=c("?"))
        classes <- sapply(rowsample, class) 
        d <- read.table(name, sep=";", header=TRUE, colClass=classes, fill=TRUE, na.strings=c("?"))
        d <- d[d$Date %in% c('1/2/2007','2/2/2007'),] # only dates we care about
#        d$DateTime <- as.POSIXct(paste(Date, Time), format="%e/%m/%Y %H:%M:%S") # merge Date and Time into a DateTime column
        d <- transform(d, DateTime=as.POSIXct(paste(Date, Time), format='%e/%m/%Y %H:%M:%S')) # merge Date and Time into a DateTime column
        d <- d[,!names(d) %in% c('Date','Time')] # remove Date and Time columns - no longer needed
        write.csv(d, "data.csv")
    }
    read.csv('data.csv', stringsAsFactors=FALSE) # took me 6 hours to figure out this string as factors bug.. :(
    d <- transform(d, DateTime=as.POSIXct(DateTime)) # need POSIXct type to draw proper line plots
} 

#
# saves to png with standard width/height
#
savetopng <- function(name) {
    dev.copy(png, file=name, width=480, height=480, res=72) # saves png 480x480 pixels, default resolution
#    dev.copy(png, file=name) # saves png 480x480 pixels, default resolution
    dev.off()
}
