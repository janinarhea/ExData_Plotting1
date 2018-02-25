# Read dataset from csv file
data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = '?',
                 nrows = 2075259, check.names = FALSE, stringsAsFactors = FALSE,
                 comment.char = "", quote = '\"')

# Get the subset commprising the first two days of February 2007 
data_subset <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

# Convert date and time variables
data_subset$Date <- as.Date(data_subset$Date, format = "%d/%m/%Y")

# Create a histogram plot 
hist(data_subset$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")

# Save resulting plot into a PNG file
dev.copy(png, file = "plot1.png", height = 480, width = 480)



