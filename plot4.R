library(sqldf) # load library to read csv file and run SQL statement on read dataframe

# read csv file and filter out data based on dates: 1/2/2007 and 2/2/2007

data <- read.csv.sql("household_power_consumption.txt", "select * from file where Date = '1/2/2007' or Date = '2/2/2007' ", sep = ";")

#change date format

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#convert the date format and insert new date-time column in dataframe

data$Datetime <- as.POSIXct(paste(as.Date(data$Date), data$Time))

#start png grDevice

png(filename='plot4.png', width=480, height=480)

# set the number of rows and columns for plotting

par(mfrow=c(2,2), mar=c(4,4,2,1))

# plot all 4 plots

with(data, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, bty = "n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       xlab="datetime")
})

#turn off the grDevice

dev.off()