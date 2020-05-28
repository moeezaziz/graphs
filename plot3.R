data<-read.table("household_power_consumption.txt", sep = ";", header = TRUE)
data1<-data
data1$Date<-as.vector(data$Date)
datacut<-data1$Date=="1/2/2007"|data1$Date=="2/2/2007"
data1$Time<-as.vector(data$Time)
datetime<-paste(data1$Date,data1$Time,sep = " ")
datetime<-datetime[datacut]
datetime<-as.POSIXct(datetime,format="%d/%m/%Y %H:%M:%S",tz=Sys.timezone())
sm1<-as.numeric(as.vector(data$Sub_metering_1[datacut]))
sm2<-as.numeric(as.vector(data$Sub_metering_2[datacut]))
sm3<-as.numeric(as.vector(data$Sub_metering_3[datacut]))
png("plot3.png")
plot(datetime,sm1,type="l",xlab=" ",ylab="Energy sub metering")
lines(datetime,sm2,col="red")
lines(datetime,sm3,col="blue")
legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=c(2,2,2), col=c("black","red","blue"))
dev.off()