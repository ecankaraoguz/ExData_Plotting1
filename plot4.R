# Loading libraries.
library(sqldf)

# Reading the dataset.
data <- read.csv.sql("~/Desktop/household_power_consumption.txt", 
                     sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", 
                     sep = ";",
                     header = TRUE)

# Converting time variables to numeric values.
date_and_time <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

# Plotting.
with(data, {
  
plot(date_and_time, 
     data$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)")

plot(date_and_time,
     data$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

plot(date_and_time, 
     data$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")

lines(date_and_time,
      data$Sub_metering_2,
      type = "l",
      col = "red")

lines(date_and_time,
      data$Sub_metering_3,
      type = "l",
      col = "blue")

legend("topright", 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, 
       lwd = 2.5, 
       col = c("black", "red", "blue"))

plot(date_and_time,
     data$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = " Global Reactive Power")
})

dev.off()