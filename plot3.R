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
png('plot3.png', width = 480, height = 480, bg = "transparent")

## Create the plot.
plot(powerData$Sub_metering_1, 
     type = 'l',
     x = powerData$DateTime,
     xlab = '', 
     ylab = 'Energy sub metering'
)
lines(powerData$Sub_metering_2, x = powerData$DateTime, col = 'red')
lines(powerData$Sub_metering_3, x = powerData$DateTime, col = 'blue')
legend(x = 'topright', legend = names(powerData)[7:9], bg = 'transparent', 
       lty = 1, col = c('black', 'red', 'blue'))

## Close the display device
dev.off()
