hh<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.string="?",stringsAsFactors = FALSE)
hh_time<-hh
hh_time$Time<-strptime(paste(hh$Date,hh$Time),"%d/%m/%Y %H:%M:%S")
hh_time$Date<-strptime(hh_time$Date,"%d/%m/%Y")
hh_select<-hh_time[which(hh_time$Date==as.POSIXlt("2007-02-01") | hh_time$Date==as.POSIXlt("2007-02-02")),]

par(mfrow=c(2,2))
plot(hh_select$Time,hh_select$Global_active_power,xlab = "",ylab = "Global Active Power",type = "l")
plot(hh_select$Time,hh_select$Voltage,xlab = "datetime",ylab = "Voltage",type = "l")
plot(hh_select$Time,hh_select$Sub_metering_1,type = "l",col="black",xlab="",ylab = "Energy sub metering")
lines(hh_select$Time,hh_select$Sub_metering_2,type = "l",col="red")
points(hh_select$Time,hh_select$Sub_metering_3,type = "l",col="blue")
legend("topright",c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"),text.col=c("black","red","blue"),cex=0.75,lwd=0.5,col=c("black","red","blue"),bty="n")
plot(hh_select$Time,hh_select$Global_reactive_power,type = "l",xlab = "datetime",ylab = "Global_relative_power")

dev.copy(png,filename="plot4.png")
dev.off()