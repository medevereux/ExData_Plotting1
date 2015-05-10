## Course Project 1
## plot4.R
# I assume that household_power_consumption.txt is in your working directory
setwd("~/Documents/Machine Learning/Data Science/Exploratory Data Analysis/Week 1/Project/ExData_Plotting1")
power<-read.table("household_power_consumption.txt",header=FALSE,skip=66637,nrows=69518-66638,col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),sep=";")
power$Date.Time<-as.POSIXct(paste(power$Date, power$Time), format="%d/%m/%Y %H:%M:%S")
power<-cbind(power$Date.Time,power)
power$Date.Time<-NULL
colnames(power)[1]<-"Date.Time"
# Draw and ouput plot4.png
png(filename="plot4.png")
oldpar<-par(mfrow=c(2,2))
with(power,plot(Global_active_power~Date.Time,type="l",xlab="",ylab="Global Active Power (kilowatts)"))
with(power,plot(Voltage~Date.Time,type="l",xlab="datetime"))
with(power,plot(Sub_metering_1~Date.Time,type="l",col="black",ylab="Energy sub metering",xlab=""))
with(power,lines(Date.Time,Sub_metering_2,col="red"))
with(power,lines(Date.Time,Sub_metering_3,col="blue"))
with(power,legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"),text.font=1,cex=1,bty="n"))
with(power,plot(Global_reactive_power~Date.Time,type="l",xlab="datetime"))
par(oldpar)
dev.off()