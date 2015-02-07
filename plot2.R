#The given txt file contains the data for various dates.Firstly we will start by reading the data from file into
#object named as "data".
#Also we need to subset the date according to our requirement.
#Here, as the requirement I have took the dates between 01/feb/2007 and 02/feb/2007
#Now we will be ploting the graph of time vs 
# we have to plot a histogram of that column.




data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", nrows=69990)
data$Date<-as.Date(data$Date, format="%d/%m/%Y")
data<-data[data$Date<="2007-02-02" & data$Date>="2007-02-01",]
data$Date<-as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
png(file="plot2.png")
par(bg=NA)
plot(data$Date,data$Global_active_power,type="l", xlab="" , ylab="Global Active Power (kilowatts)")
dev.off()
