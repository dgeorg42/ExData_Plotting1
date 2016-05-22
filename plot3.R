# Call prepareDataset() to get the data we need for analysis
source("./prepareDataset.R")
hpc <- prepareDataset()

# Open a PNG device
png("./plot3.png")

# Plot the first sub metering field as a line graph
with(hpc, plot(Datetime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))

# Add the second sub metering field, with a red line
with(hpc, lines(Datetime, Sub_metering_2, col="red"))

# Add the third sub metering field, with a blue line
with(hpc, lines(Datetime, Sub_metering_3, col="blue"))

# Add the legend
legend(x="topright", legend=c("Sub metering 1", "Sub metering 2", "Sub metering 3"), fill=c("black", "red", "blue"))

# Close the device
dev.off()