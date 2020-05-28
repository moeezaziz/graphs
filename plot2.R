data<-read.table("household_power_consumption.txt", sep = ";", header = TRUE)
data1<-data
data1$Date<-as.vector(data$Date)
datacut<-data1$Date=="1/2/2007"|data1$Date=="2/2/2007"
data1$Time<-as.vector(data$Time)
gap<-as.numeric(as.vector(data$Global_active_power[datacut]))
datetime<-paste(data1$Date,data1$Time,sep = " ")
datetime<-datetime[datacut]
datetime<-as.POSIXct(datetime,format="%d/%m/%Y %H:%M:%S",tz=Sys.timezone())
png("plot2.png")
plot(datetime,gap,type = "l", xlab = " ", ylab = "Global Active Power (killowatts)")
dev.off()