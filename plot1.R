data<-read.table("household_power_consumption.txt", sep = ";", header = TRUE)
data1<-data
data1$Date<-as.vector(data$Date)
datacut<-data1$Date=="1/2/2007"|data1$Date=="2/2/2007"
gap<-as.numeric(data$Global_active_power[datacut])
png("plot1.png")
hist(gap,main=paste("Global Active Power"),xlab = paste("Global Active Power (killowatts)"), col = "Red")
dev.off()
