#The given txt file contains the data for various dates.Firstly we will start by reading the data from file into
#object named as "data".
#Also we need to subset the date according to our requirement.
#Here, as the requirement I have took the dates between 01/feb/2007 and 02/feb/2007


data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", nrows=69990)  #read the data from .txt file in the form of a table
data$Date<-as.Date(data$Date, format="%d/%m/%Y")  #setting the Date column of data as Date datatype
data<-data[data$Date<="2007-02-02" & data$Date>="2007-02-01",]  #Extract those rows whose dates in Date column are between 01/feb/2007 and 02/feb/2007
data$Date<-as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")  #Combine Date and Time column into one column which represents date and time both in foramt "Year-Month-Dte Hour:Minute:Seconds"
png(file="plot4.png") #for opening PNG file device as the name plot4.png
par(bg=NA, mfrow=c(2,2))  #Set the background parameter as transparent and also set the row property of graph as 2x2 i.e. we can plot 4 graph now 2 in a row and  2 in a column
with(data, {
plot(Date,Global_active_power,type="l", xlab="" , ylab="Global Active Power") #plot a line graph of Date(which now includes data and time both) vs. Global_active_power
plot(Date,Voltage, type="l", xlab="datetime" , ylab="Voltage")  #plot a line graph of Date(which now includes data and time both) vs. Voltage
plot(Date,Sub_metering_1, type="n", xlab="" , ylab="Energy sub metering") #plot a blank graph with only axes
lines(Date, Sub_metering_1, ylim=c(0,40), col="black")  #plot a line graph of date vs Sub_merering_1 onto previously plotted blank graph with black line
lines(Date, Sub_metering_2, ylim=c(0,40), col="red")  #plot a line graph of date vs Sub_merering_2 onto the previously plotted graph with red line
lines(Date, Sub_metering_3, ylim=c(0,40), col="blue") #plot a line graph of date vs Sub_merering_3 onto the previously plotted graph with blue line
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=c(1,1,1), lwd=c(1,1,1), bty="n", col=c("black", "red", "blue"))  #Set the legend for given graph at the top right side of graph
plot(Date, Global_reactive_power, type="l", xlab="datetime" , ylab="Global_reactive_power") #plot a line graph of Date(which now includes data and time both) vs. Global_reactive_power
})
dev.off() #close all the graphic devices
