# Load in data
data <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings="?")

# Subset the correct dates and making a new variable that combines date and time
datasubset <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
datasubset$Date <- as.character(datasubset$Date)
datasubset$Time <- as.character(datasubset$Time)
datasubset$datatime <- strptime(paste(datasubset$Date, datasubset$Time), format = "%d/%m/%Y %H:%M:%S")

# Setting margins
par(mar = c(4, 4, 2, 2))

# Plotting
with(datasubset, plot(datatime, Sub_metering_1, 
                      type = "n",
                      xlab = "",
                      ylab = "Energy sub metering"))

# Adding lines
with(datasubset, lines(datatime, Sub_metering_1))
with(datasubset, lines(datatime, Sub_metering_2, col = "red"))
with(datasubset, lines(datatime, Sub_metering_3, col = "blue"))

# Adding legend
legend("topright", 
       lty = 1, 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Copy to graphics device
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
