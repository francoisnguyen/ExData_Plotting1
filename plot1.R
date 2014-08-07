## load library
library(sqldf)

## read file and select rows based on string "1/1/2007" and "2/2/2007" and store in dataframe DF
df <- read.csv.sql("~/household_power_consumption.txt", sep=";",sql = 'select * from file where Date = "1/2/2007" or Date="2/2/2007"')
## closing connection after reading the file
closeAllConnections()

## Open a graphic device for a PNG file width 480 and height 480
png(filename = "plot1.png", width = 480, height = 480)


## set margins
par(mar=c(5,4,6,3))
## draw the histograme
hist(df$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
## put the name of the plot
mtext(side=3, line=-1, text="Plot 1", font = 2, adj=0, outer=T) 

## close the graphic device
dev.off(which = dev.cur())