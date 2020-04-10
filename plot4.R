# Load in data
data <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings="?")

# Subset the correct dates and making a new variable that combines date and time
datasubset <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
datasubset$Date <- as.character(datasubset$Date)
datasubset$Time <- as.character(datasubset$Time)
datasubset$datatime <- strptime(paste(datasubset$Date, datasubset$Time), format = "%d/%m/%Y %H:%M:%S")

# Setting global parameters
par(mfcol= c(2,2))

# Plotting 1st plot
plot(datasubset$datatime, datasubset$Global_active_power, 
     ylab = "Global Active Power",
     xlab = "",
     pch = NA_integer_)

# Adding line
lines(datasubset$datatime, datasubset$Global_active_power)

# Plotting 2nd plot
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
       lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n")

# Plotting 3rd plot
with(datasubset, plot(datatime, Voltage,
                      pch = ""))

# Adding lines
lines(datasubset$datatime, datasubset$Voltage)

# Plotting 4th plot
with(datasubset, plot(datatime, Global_reactive_power,
                      pch = ""))

# Adding lines
lines(datasubset$datatime, datasubset$Global_reactive_power)

# Copy to graphics device
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()



