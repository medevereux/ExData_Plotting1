## Course Project 1
## plot2.R
# I assume that household_power_consumption.txt is in your working directory
setwd("~/Documents/Machine Learning/Data Science/Exploratory Data Analysis/Week 1/Project/ExData_Plotting1")
power<-read.table("household_power_consumption.txt",header=FALSE,skip=66637,nrows=69518-66638,col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),sep=";")
power$Date.Time<-as.POSIXct(paste(power$Date, power$Time), format="%d/%m/%Y %H:%M:%S")
power<-cbind(power$Date.Time,power)
power$Date.Time<-NULL
colnames(power)[1]<-"Date.Time"
# Draw and ouput plot2.png
png(filename="plot2.png")
with(power,plot(Global_active_power~Date.Time,type="l",xlab="",ylab="Global Active Power (kilowatts)"))
dev.off()
