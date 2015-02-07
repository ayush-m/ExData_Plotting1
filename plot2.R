#The given txt file contains the data for various dates.Firstly we will start by reading the data from file into
#object named as "data".
#Also we need to subset the date according to our requirement.
#Here, as the requirement I have took the dates between 01/feb/2007 and 02/feb/2007
#Now we will be ploting the graph of time vs Global Active Power
library(lubridate)
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", nrows=69990)  #read the data from .txt file in the form of a table
data$Date<-as.Date(data$Date, format="%d/%m/%Y")  #setting the Date column of data as Date datatype
data<-data[data$Date<="2007-02-02" & data$Date>="2007-02-01",]  #Extract those rows whose dates in Date column are between 01/feb/2007 and 02/feb/2007
data$Date<-as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")  #Combine Date and Time column into one column which represents date and time both in foramt "Year-Month-Dte Hour:Minute:Seconds"
png(file="plot2.png") #for opening PNG file device as the name plot1.png
par(bg=NA)  #Set the background parameter as transparent
plot(data$Date,data$Global_active_power,type="l", xlab="" , ylab="Global Active Power (kilowatts)") #plot a line graph of Date(which now includes data and time both) vs. Global_active_power
dev.off() #close all the graphic devices
