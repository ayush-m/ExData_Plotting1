#The given txt file contains the data for various dates. To visualise the distribution of Global_Active_Power column of the data,
# we have to plot a histogram of that column.
#Also we need to subset the date according to our requirement.
#Here I have took the dates between 01/feb/2007 and 02/feb/2007
#firstly we will start by reading the data from file into our object named as "data"

data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", nrows=69990)  #read the data from .txt file in the form of a table
#here4 na.string is set to '?' beacuse NA values are reperesented by question mark(?)
data$Date<-as.Date(data$Date, format="%d/%m/%Y")  #setting the Date column of data as Date datatype
data<-data[data$Date>="2007-02-01" & data$Date<="2007-02-02",]  #Extract those rows whose dates in Date column are between 01/feb/2007 and 02/feb/2007 
row.names(data)<-1:nrow(data) #row numbers are distorted on extracting the rows from data that's why we are again assigning it from 1 
png(file="plot1.png") #for opening PNG file device as the name plot1.png
par(bg=NA)  #Set the background parameter as transparent
hist(data$Global_active_power,xlab="Global Active Power (kilowatts)", col="orangered3",main="Global Active Power") #Plot the histogram of "Global_active_power"
dev.off() #close all the graphic devices
