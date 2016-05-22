# Call prepareDataset() to get the data we need for analysis
source("./prepareDataset.R")
hpc <- prepareDataset()

# Open a PNG device
png("./plot2.png")

# Plot a line graph that shows Global Active Power over time
with(hpc, plot(Datetime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))

# Close the device
dev.off()