# Call prepareDataset() to get the data we need for analysis
source("./prepareDataset.R")
hpc <- prepareDataset()

# Open a PNG device
png("./plot4.png")

# Set the layout to be two rows and two columns
par(mfrow=c(2,2))

# In the first position, plot a line graph that shows Global Active Power over time (same as Plot 2)
with(hpc, plot(Datetime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))

# In the second position, plot a line graph that shows Voltage over time
with(hpc, plot(Datetime, Voltage, type="l", ylab="Voltage", xlab=""))

# In the third position, plot the three sub metering values in different colors (same as Plot 3)
with(hpc, plot(Datetime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
with(hpc, lines(Datetime, Sub_metering_2, col="red"))
with(hpc, lines(Datetime, Sub_metering_3, col="blue"))
legend(x="topright", legend=c("Sub metering 1", "Sub metering 2", "Sub metering 3"), fill=c("black", "red", "blue"))

# In the fourth position, plot a line graph that shows Global Reactive Power over time
with(hpc, plot(Datetime, Global_reactive_power, type="l", ylab="Global Reactive Power (kilowatts)", xlab=""))

# Close the device
dev.off()