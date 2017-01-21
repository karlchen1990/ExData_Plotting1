#set the environement, close the device and 
if(dev.cur()!=1){dev.off()}
Sys.setlocale("LC_TIME","English")

hh<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.string="?",stringsAsFactors = FALSE)
hh_time<-hh
hh_time$Time<-strptime(paste(hh$Date,hh$Time),"%d/%m/%Y %H:%M:%S")
hh_time$Date<-strptime(hh_time$Date,"%d/%m/%Y")
hh_select<-hh_time[which(hh_time$Date==as.POSIXlt("2007-02-01") | hh_time$Date==as.POSIXlt("2007-02-02")),]
plot(hh_select$Time,hh_select$Sub_metering_1,type = "l",col="black",xlab="",ylab="Energy sub metering")
points(hh_select$Time,hh_select$Sub_metering_3,type = "l",col="blue")
lines(hh_select$Time,hh_select$Sub_metering_2,type = "l",col="red")
legend("topright",c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"),text.col=c("black","red","blue"),lwd = 0.5,cex=0.75,y.intersp = 0.5,col=c("black","red","blue"))
dev.copy(png,filename="plot3.png")
dev.off()