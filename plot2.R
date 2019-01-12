library(sqldf) # load library to read csv file and run SQL statement on read dataframe
library(chron) # load library to format time

# read csv file and filter out data based on dates: 1/2/2007 and 2/2/2007

data <- read.csv.sql("household_power_consumption.txt", "select * from file where Date = '1/2/2007' or Date = '2/2/2007' ", sep = ";")

#change date format

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#change time format

data$Time <- times(data$Time)

#start png grDevice

png(filename='plot2.png', width=480, height=480)

# plot Global Active Power

with(data, plot(Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="", axes = FALSE))

# draw box around the plot

box(lty = 1, col = 'black')

#set the x-axis and y-axis ticks

axis(2,at=c(0,2,4,6))
axis(1, at = c(0,1500,2900),labels = c("Thu","Fri","Sat"))

#turn off the grDevice

dev.off()