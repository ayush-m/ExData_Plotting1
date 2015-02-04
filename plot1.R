#This will read the household_power_consumption.txt into a table named "data"
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", nrows=69990)  
#convert Date column as Date data type
data$Date<-as.Date(data$Date, format="%d/%m/%Y")
#Subsetting of data from the date from 01/Feb/2007 to 02/Feb/2007
data<-data[data$Date>="2007-02-01" & data$Date<="2007-02-02",]
#While doing the above subsetting the row names become different(i.e. not from 1 to number of rows in data)
row.names(data)<-1:nrow(data)
png(file="plot1.png") # open png graphic device
par(bg=NA)  #Sets the background of the graph as transparent
hist(data$Global_active_power,xlab="Global Active Power (kilowatts)", col="orangered3",main="Global Active Power")
dev.off() #Close the graphic devices
