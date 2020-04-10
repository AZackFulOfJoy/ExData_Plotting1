# Load in data
data <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings="?")

# Subset the correct dates
datasubset <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

# Plotting
hist(datasubset$Global_active_power, 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     col = "red",
     xaxt = "n",
     yaxt = "n")

# Adding the ranges of axis
xlimits = seq(0, 6, by = 2)
axis(1, at = xlimits)
ylimits = seq(0, 1200, by = 200)
axis(2, at = ylimits)

# Copy to graphics device
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
