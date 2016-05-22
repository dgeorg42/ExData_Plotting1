# Call prepareDataset() to get the data we need for analysis
source("./prepareDataset.R")
hpc <- prepareDataset()

# Open a PNG device
png("./plot1.png")

# Plot the histogram of Global Active Power
hist(hpc$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# Close the device
dev.off()