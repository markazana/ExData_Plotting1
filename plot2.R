## This source code draws plot1.png
## Fork https://github.com/rdpeng/ExData_Plotting1

## download the necessary files and unzip first
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./exdata_data_household_power_consumption.zip")
unzip(zipfile="./exdata_data_household_power_consumption.zip",exdir=".")

## read the data file
sampleData <- read.csv("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", nrows = 5)
classes <- sapply(sampleData, class)

## rows to read = 60sec x 24hr x 2days = 2,880 rows
csvFile <- read.csv("household_power_consumption.txt", sep = ";", header = FALSE, na.strings = "?", skip=66637, nrows=2880,
           colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

colnames(csvFile) <- colnames(sampleData)
str(csvFile)

csvFile$datetime <- strptime(paste(csvFile$Date,csvFile$Time),format = "%d/%m/%Y %H:%M:%S")


#head(csvFile)
#tail(csvFile)

## Plotting to PDF
png(file = "plot2.png")

## setting margins
par(mfrow = c(1, 1), mar = c(4, 4, 2, 1))

## draw plot
with(csvFile, plot(datetime, Global_active_power,
                   type = "l",
                   ylab = "Global Active Power (kilowatts)",
                   xlab = NA
                   ))

dev.off() ## Close the PDF file device
