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

### plot 2

png("plot2.png", width = 480, height = 480)

plot(filtered_data$Datetime,
     filtered_data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()

