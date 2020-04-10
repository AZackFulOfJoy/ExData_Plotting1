# Load in data
data <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings="?")

# Subset the correct dates and making a new variable that combines date and time
datasubset <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
datasubset$Date <- as.character(datasubset$Date)
datasubset$Time <- as.character(datasubset$Time)
datasubset$datatime <- strptime(paste(datasubset$Date, datasubset$Time), format = "%d/%m/%Y %H:%M:%S")

# Plotting
plot(datasubset$datatime, datasubset$Global_active_power, 
     ylab = "Global Active Power (kilowatts)",
     xlab = "",
     pch = NA_integer_)

# Adding line
lines(datasubset$datatime, datasubset$Global_active_power)

# Copy to graphics device
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()

