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
                   , format = "%m/%d/%Y %H:%M:%S",tz="")
subpowercons <- cbind(subpowercons, datetime)

  
  ##Plot 4
  par(mfrow=c(2,2), cex = .6)
  ## Posn 1,1
  plot(subpowercons$datetime, subpowercons$Global_active_power
       , type="l"
       , ylab = "Global Active Power"
       , xlab = ""
  )
  ## Posn 1,2
  plot(subpowercons$datetime, subpowercons$Voltage
       , type="l"
       , xlab = "datetime"
       , ylab = "Voltage"
  )
  
  ##Posn 2,1
  yrange<-range(c(subpowercons$Sub_metering_1,subpowercons$Sub_metering_2,subpowercons$Sub_metering_3))
  plot(subpowercons$datetime, subpowercons$Sub_metering_1
       , ylim = yrange
       , type="l"
       , ylab = "Energy sub metering"
       , xlab = ""
  )
  lines(subpowercons$datetime,subpowercons$Sub_metering_2, col = "red")
  lines(subpowercons$datetime,subpowercons$Sub_metering_3, col = "blue")
  legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
         , col = c("black","red","blue"),lty = 1
         , bty = "n")
  ## Posn 2,2
  plot(subpowercons$datetime, subpowercons$Global_reactive_power
       , type="l"
       , ylab = "Global_reactive_power"
       , xlab = "datetime"
  )


## Copy to png file
dev.copy(png,file = "plot4.png", width = 480, height = 480) 
##Close the open device
dev.off()