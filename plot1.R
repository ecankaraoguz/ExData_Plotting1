# Loading libraries.
library(sqldf)

# Reading the dataset.
data <- read.csv.sql("~/Desktop/household_power_consumption.txt", 
                       sql = "select * from file where Date = '1/2/2007' or Date = '2/2/2007'", 
                       sep = ";",
                       header = TRUE)

# Opening the png device.
png("plot1.png", width = 480, height = 480)

# Plotting the histogram for Global Active Power.
hist(data$Global_active_power, 
     col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")

# Closing the device.
dev.off()