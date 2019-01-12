library(sqldf) # load library to read csv file and run SQL statement on read dataframe
library(chron) # load library to format time

# read csv file and filter out data based on dates: 1/2/2007 and 2/2/2007

data <- read.csv.sql("household_power_consumption.txt", "select * from file where Date = '1/2/2007' or Date = '2/2/2007' ", sep = ";")

#change date format

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#change time format

data$Time <- times(data$Time)

#start png grDevice

png(filename='plot3.png', width=480, height=480)

#plot all three variables in the same plot

with(data, {plot(Sub_metering_1,main="", ylab="Energy sub metering",xlab="",type="l",col="black",axes=FALSE) # plot sub_metering_1 in black
lines(Sub_metering_2,col="red",type="l") # plot sub_metering_2 in red
lines(Sub_metering_3,col="blue",type="l")}) # plot sub_metering_3 in blue

#draw box around the plot

box(lty = 1, col = 'black')

#set x and y-axis ticks

axis(1, at = c(0,1500,2900),labels = c("Thu","Fri","Sat"))
axis(2, at = c(0,10,20,30),labels = c("0","10","20","30"))

# set legend

legend("topright",legend=c("Sub-metering1","Sub-metering2","Sub-metering3"),col=c("black","red","blue"),lty=c(1,1,1),lwd=1)

#turn off the grDevice
dev.off()
