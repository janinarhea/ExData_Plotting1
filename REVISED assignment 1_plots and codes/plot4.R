# Read dataset from csv file
data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = '?',
                 nrows = 2075259, check.names = FALSE, stringsAsFactors = FALSE,
                 comment.char = "", quote = '\"')

# Get the subset commprising the first two days of February 2007 
data_subset <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

# Convert date and time variables
data_subset$Date <- as.Date(data_subset$Date, format = "%d/%m/%Y")
date_time <- paste(as.Date(data_subset$Date), data_subset$Time)
data_subset$Datetime <- as.POSIXct(date_time)

# Create plots
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(data_subset, {
        plot(Global_active_power~Datetime, type = "l", 
             ylab = "Global Active Power", xlab = "")
        plot(Voltage~Datetime, type = "l",
             ylab = "Voltage", xlab = "datetime")
        plot(Sub_metering_1~Datetime, type = "l", 
             ylab = "Energy Sub metering", xlab = "")
        lines(Sub_metering_2~Datetime, col = 'Red')
        lines(Sub_metering_3~Datetime, col = 'Blue')
        legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2,
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power~Datetime, type = "l", 
             ylab = "Global_reactive_power", xlab = "datetime")
        })

# Save plot as PNG file
dev.copy(png, file = "plot4.png", height = 480, width = 480)