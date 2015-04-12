# Loading libraries.
library(sqldf)

# Reading the dataset.
data <- read.csv.sql("~/Desktop/household_power_consumption.txt", 
                     sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", 
                     sep = ";",
                     header = TRUE)

# Converting time variables to numeric values.
date_and_time <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Plotting.
png("plot2.png", width=480, height=480)

plot(date_and_time, 
     data$Global_active_power, 
     type = "l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")

dev.off()
