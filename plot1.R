library(chron) # load library to format time
library(sqldf) # load library to read csv file and run SQL statement on read dataframe

# read csv file and filter out data based on dates: 1/2/2007 and 2/2/2007

data <- read.csv.sql("household_power_consumption.txt", "select * from file where Date = '1/2/2007' or Date = '2/2/2007' ", sep = ";")

#change date format

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#change time format

data$Time <- times(data$Time)

#start png grDevice

png(filename='plot1.png', width=480, height=480)

# plot a histogram of the Global Active Power

with(data, hist(Global_active_power, col = 'red', xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power'))

#turn off the grDevice

dev.off()