data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?",
                   stringsAsFactors = FALSE)

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

filtered_data <- subset(data, 
                        Date == as.Date("2007-02-01") | 
                          Date == as.Date("2007-02-02"))

filtered_data$Datetime <- strptime(
  paste(filtered_data$Date, filtered_data$Time),
  "%Y-%m-%d %H:%M:%S"
)

### plot 4

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

# 1
plot(filtered_data$Datetime, filtered_data$Global_active_power,
     type = "l", ylab = "Global Active Power", xlab = "")

# 2
plot(filtered_data$Datetime, filtered_data$Voltage,
     type = "l", ylab = "Voltage", xlab = "datetime")

# 3
plot(filtered_data$Datetime, filtered_data$Sub_metering_1,
     type = "l", ylab = "Energy sub metering", xlab = "")
lines(filtered_data$Datetime, filtered_data$Sub_metering_2, col = "red")
lines(filtered_data$Datetime, filtered_data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"), lty = 1)

# 4
plot(filtered_data$Datetime, filtered_data$Global_reactive_power,
     type = "l", ylab = "Global_reactive_power", xlab = "datetime")

dev.off()