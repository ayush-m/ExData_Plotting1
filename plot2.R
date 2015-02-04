data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", nrows=69990)
data$Date<-as.Date(data$Date, format="%d/%m/%Y")
data<-data[data$Date<="2007-02-02" & data$Date>="2007-02-01",]
data$Date<-as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
png(file="plot2.png")
par(bg=NA)
plot(data$Date,data$Global_active_power,type="l", xlab="" , ylab="Global Active Power (kilowatts)")
dev.off()