# 
# The prepareDataset() function will download and read the Household Power Consumption file, and prepare the
# resulting dataframe for analysis by:
#    1 - subsetting only the days we want (this could be parameterised); and
#    2 - adding a new Datetime column (class POSIXct) that merges the Date and Time columns (class character vector)
#
prepareDataset <- function() {
	
	# If the ZIP file doesn't exist, download it.
	if (!file.exists("./household_power_consumption.zip")){
		download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "./household_power_consumption.zip")
	}

	# If the TXT file doesn't exist, unzip it.
	if (!file.exists("./household_power_consumption.txt")){
		unzip("./household_power_consumption.zip")
	}

	# Read the data file
	hpc <- read.table("./household_power_consumption.txt", sep=";", header=TRUE, colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings=c("?"))

	# Get the two days that we need
	hpc <- subset(hpc, (Date=="1/2/2007" | Date=="2/2/2007"))

	# Make sure the dplyr library is loaded
	library(dplyr)

	# Merge the date and time character columns into a single datetime column
	mutate(hpc, Datetime=as.POSIXct(paste(hpc$Date, hpc$Time), format="%d/%m/%Y %H:%M:%S"))
}