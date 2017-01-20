hh<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.string="?",stringsAsFactors = FALSE)
hh_time<-hh
hh_time$Time<-strptime(paste(hh$Date,hh$Time),"%d/%m/%Y %H:%M:%S")
hh_time$Date<-strptime(hh_time$Date,"%d/%m/%Y")
hh_select<-hh_time[which(hh_time$Date==as.POSIXlt("2007-02-01") | hh_time$Date==as.POSIXlt("2007-02-02")),]
plot(hh_select$Time,hh_select$Global_active_power,type = "l",ylab = "Global Active Power (kilowatts)",xlab = "")
dev.copy(png,filename="plot2.png")
dev.off()