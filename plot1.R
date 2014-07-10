## Estimated size if the data set
setwd("C:/Users/Tina/Documents/Coursera/Exploratory Data Analysis/ExData_Plotting1")

estSize <- 2075259 * (7 * 8 + 2*104)/1024/1024 #MB

today = as.Date(Sys.time())
urldata<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipfile<-"HousholdPowerConsumption.zip"
download.file(urldata, zipfile)
# unzip the file
unzip(zipfile, overwrite=TRUE)
## Read the data
powercons <-read.table(file = "household_power_consumption.txt"
                       , header = TRUE, sep = ";",stringsAsFactors = FALSE
                       , na.strings = "?")
##Subset the data
subpowercons <- powercons[powercons$Date %in% c("1/2/2007","2/2/2007"),]
## Convert datetimes
datetime<-strptime(paste(subpowercons$Date,subpowercons$Time)
                   , format = "%d/%m/%Y %H:%M:%S",tz="")
subpowercons <- cbind(subpowercons, datetime)
##Plot 1
hist(subpowercons$Global_active_power
     , main = "Global Active Power"
     , xlab = "Global Active Power (kilowatts)"
     , col = "red"
     , cex.axis = .8
     , cex.lab=.8
     , cex.main=.8
     )
## Copy hist to png file
dev.copy(png,file = "plot1.png", width = 480, height = 480) 
##Close the open device
dev.off()
