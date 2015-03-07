##################################
##
##  Code for generating Plot 1
##  Code assumes data is located in working directory
##  in file: household_power_consumption.txt
##  data can be found at: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
##
##################################

## load file into data frame
data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

## Convert date variables to date
data$Date <- as.Date(as.character(data$Date), format="%d/%m/%Y")

## create date/time vector and bind it as new column
DateTime <- strptime(paste(as.character(data$Date), data$Time), format="%Y-%m-%d %H:%M:%S")
data <- cbind(data, DateTime)

## Filter down to just 2007-02-01 thru 2007-02-02
data <- data[(data$Date == "2007-02-01") | (data$Date == "2007-02-02"),]

## open PNG device
png(filename = "plot1.png", width =480, height=480, bg="transparent")

## Draw histogram
hist(data$Global_active_power, col ="red", xlab ="Global Active Power (kilowatts)", main ="Global Active Power")

## close PNG device
dev.off()
