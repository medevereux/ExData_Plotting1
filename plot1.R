## Course Project 1
## plot1.R
# I assume that household_power_consumption.txt is in your working directory
setwd("~/Documents/Machine Learning/Data Science/Exploratory Data Analysis/Week 1/Project/ExData_Plotting1")
power<-read.table("household_power_consumption.txt",header=FALSE,skip=66637,nrows=69518-66638,col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),sep=";")
power$Date.Time<-as.POSIXct(paste(power$Date, power$Time), format="%d/%m/%Y %H:%M:%S")
power<-cbind(power$Date.Time,power)
power$Date.Time<-NULL
colnames(power)[1]<-"Date.Time"
# Draw and ouput plot1.png
png(filename="plot1.png")
with(power,hist(Global_active_power,col='red',main="Global Active Power",xlab="Global Active Power (kilowatts)",ylim=c(0,1200),las=1))
dev.off()
