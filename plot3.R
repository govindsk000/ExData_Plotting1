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



### plot 3

png("plot3.png", width = 480, height = 480)

plot(filtered_data$Datetime,
     filtered_data$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")

lines(filtered_data$Datetime, filtered_data$Sub_metering_2, col = "red")
lines(filtered_data$Datetime, filtered_data$Sub_metering_3, col = "blue")

legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1)

dev.off()