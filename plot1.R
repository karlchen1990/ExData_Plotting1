#set the environement, close the device and 
if(dev.cur()!=1){dev.off()}
Sys.setlocale("LC_TIME","English")

hh<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.string="?",stringsAsFactors = FALSE)
hh$Date<-strptime(hh$Date,"%d/%m/%Y")
hh_select<-hh[which(hh$Date==as.POSIXlt("2007-02-01") | hh$Date==as.POSIXlt("2007-02-02")),]
hist(hh_select$Global_active_power,col = "red1",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.copy(png,filename="plot1.png")
dev.off()

