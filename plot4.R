##### Read in Data #####

kwh<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",as.is=TRUE,na.strings="?")
kwh$Date2<-as.Date( kwh$Date, "%d/%m/%Y")
subset_kwh<-subset(kwh,Date2==as.Date("2007-02-01") | Date2==as.Date("2007-02-02"))
subset_kwh<-within(subset_kwh,datetime<-strptime(paste(subset_kwh$Date, subset_kwh$Time, sep=" "), format="%d/%m/%Y %H:%M:%S"))

##### Plot #####
par(mfrow=c(2,2))

plot(subset_kwh$datetime,subset_kwh$Global_active_power,type="n",main=" ",xlab="",ylab="Global Active Power(kilowatts)")
lines(subset_kwh$datetime,subset_kwh$Global_active_power)

plot(subset_kwh$datetime,subset_kwh$Voltage,type="n",main=" ",xlab="datetime",ylab="Voltage")
lines(subset_kwh$datetime,subset_kwh$Voltage)

plot(subset_kwh$datetime,subset_kwh$Sub_metering_1,type="n",main=" ",xlab="",ylab="Energy sub metering")
lines(subset_kwh$datetime,subset_kwh$Sub_metering_1,col="black")
lines(subset_kwh$datetime,subset_kwh$Sub_metering_2,col="red")
lines(subset_kwh$datetime,subset_kwh$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,box.lwd=0)

plot(subset_kwh$datetime,subset_kwh$Global_reactive_power,type="n",main=" ",xlab="datetime",ylab="Global_reactive_power")
lines(subset_kwh$datetime,subset_kwh$Global_reactive_power)


dev.copy(png,"./plot4.png")
dev.off()
