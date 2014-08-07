## load library
library(sqldf)

## read file and select rows based on string "1/1/2007" and store in dataframe DF
df <- read.csv.sql("~/household_power_consumption.txt", sep=";",sql = 'select * from file where Date = "1/2/2007" or Date="2/2/2007"')
## closing connection after reading the file
closeAllConnections()

## Create a new DateTime variable merging Date and Time variable.
df$DateTime <- strptime(paste(df$Date, df$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

## Open a graphic device for a PNG file width 480 and height 480
png(filename = "plot4.png", width = 480, height = 480)

## set system to english
Sys.setlocale("LC_TIME", "English")
## set margins
par(mar=c(4,4,4,2))
## set 2 columns and 2 rows for the plots
par(mfcol = c(2,2))

## drawing upperleft plot
plot(df$DateTime,df$Global_active_power, type="l",xlab="",ylab="Global Active Power")

## drawing lowerleft plot
plot(df$DateTime,df$Sub_metering_1, , type="l", xlab="",ylab="Energy sub metering", col="black")
lines(df$DateTime, df$Sub_metering_2, col = "red")
lines(df$DateTime, df$Sub_metering_3, col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n", text.col=c("black","red","blue"), text.font = 1, lty=1, col=c("black","red","blue"))

## drawing upper right plot
plot(df$DateTime,df$Voltage, type="l",xlab="Datetime",ylab="Voltage")

## drawing lower right plot
plot(df$DateTime,df$Global_reactive_power, type="l",xlab="Datetime",ylab="Global_reactive_power")

## put the name of the plot
mtext(side=3, line=-1, text="Plot 4", font = 2, adj=0, outer=T) 

## close the graphic device
dev.off(which = dev.cur())