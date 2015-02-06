## Read the electricity power use data and produce a plot to match the relevant
## example.

## Open the data file.
## Assuming data file is in current working directory.
## setwd("C:/Users/mere_p/Desktop/PM/DS Specialisation/04 Exploratory Data Analysis/ExData_Plotting1")

fileName <- 'household_power_consumption.txt'
##setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )

powerData <- read.table(file = fileName, header = TRUE, sep = ';', 
                        na.strings = '?', 
                        colClasses = c('character', 'character', 
                                       rep.int('numeric', 7)))

## Keep only the dates of interest
powerData <- powerData[powerData$Date == '1/2/2007' | 
                       powerData$Date == '2/2/2007', ]

## Create a new column with the POSIX datetime.
powerData$DateTime <- as.POSIXct(paste(powerData$Date, powerData$Time), 
                                 format="%d/%m/%Y %H:%M:%S")

## Open a PNG device to save the plot as a PNG file
png('plot2.png', width = 480, height = 480, bg = "transparent")

## Create the plot.
plot(powerData$Global_active_power, 
     type = 'l',
     x = powerData$DateTime,
     xlab = '', 
     ylab = 'Global Active Power (kilowatts)'
     )

## Close the display device
dev.off()
