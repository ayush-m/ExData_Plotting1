data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", nrows=69990)  
data$Date<-as.Date(data$Date, format="%d/%m/%Y")
data<-data[data$Date>="2007-02-01" & data$Date<="2007-02-02",]
row.names(data)<-1:nrow(data)
png(file="plot1.png")
par(bg=NA)
hist(data$Global_active_power,xlab="Global Active Power (kilowatts)", col="orangered3",main="Global Active Power")
dev.off()
