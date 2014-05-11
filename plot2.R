##### Read in Data #####

kwh<-read.table("./household_power_consumption.txt",header=TRUE,sep=";",as.is=TRUE,na.strings="?")
kwh$Date2<-as.Date( kwh$Date, "%d/%m/%Y")
subset_kwh<-subset(kwh,Date2==as.Date("2007-02-01") | Date2==as.Date("2007-02-02"))
subset_kwh<-within(subset_kwh,datetime<-strptime(paste(subset_kwh$Date, subset_kwh$Time, sep=" "), format="%d/%m/%Y %H:%M:%S"))

##### Plot  #####
par(mar=c(5,5,2,2))
plot(subset_kwh$datetime,subset_kwh$Global_active_power,type="n",main=" ",xlab="",ylab="Global Active Power(kilowatts)")
lines(subset_kwh$datetime,subset_kwh$Global_active_power)
dev.copy(png,"./plot2.png")
dev.off()
