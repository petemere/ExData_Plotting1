## Read the electricity power use data and produce a plot to match the relevant
## example.

## Open the data file.
## Assuming data file is in current working directory.
## setwd("C:/Users/mere_p/Desktop/PM/DS Specialisation/04 Exploratory Data Analysis/ExData_Plotting1")

fileName <- 'household_power_consumption.txt'
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
setAs("character","myTime", function(from) strptime(from, format="%T"))

powerData <- read.table(file = fileName, header = TRUE, sep = ';', 
                        na.strings = '?', 
                        colClasses = c('myDate', 'myTime', 
                                       rep.int('numeric', 7)))
## Keep only the dates of interest
powerData <- powerData[powerData$Date >= as.Date('2007-02-01') & 
                       powerData$Date <= as.Date('2007-02-02'), ]

## Open a PNG device to save the plot as a PNG file
png('plot1.png', width = 480, height = 480, bg = "transparent")

## Create the plot.
hist(x = powerData$Global_active_power, col = 'red', 
     xlab = 'Global Active Power (kilowatts)', 
     ylab = 'Frequency', 
     main = 'Global Active Power')

## Close the display device
dev.off()
