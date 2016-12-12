df <- read.csv('household_power_consumption.txt', header = TRUE, sep = ';')
df <- df[df$Date == '1/2/2007' | df$Date == '2/2/2007' | (df$Date == '3/2/2007' & df$Time == '00:00:00'),]
td <- as.character(df$Date)
hs <- as.character(df$Time)
Time <- paste(td, hs, sep = ' ')
Time <- strptime(Time, '%d/%m/%Y %H:%M:%S')
Date <- as.Date(df$Date, '%d/%m/%Y')
GAP<- as.numeric(as.character(df$Global_active_power))
sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))
Voltage <- as.numeric(as.character(df$Voltage))
Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))
quartz()
par(mfrow = c(2,2), mar = c(4,4,1,1))
#for first plot
plot(Time, GAP, xaxt = "n", type = "l", xlab = '', ylab = 'Global Active Power(kilowatts)')
axis.POSIXct(side=1, at=cut(Time, "days"), format="%a") 
#for second plot
plot(Time, Voltage, xaxt = "n", type = "l", xlab = 'datatime')
axis.POSIXct(side=1, at=cut(Time, "days"), format="%a") 
#for thired plot
plot(Time, sub_metering_1, xaxt = "n", type = "l", xlab = '', ylab = 'Energy sub metering')
lines(Time, sub_metering_2, type = "l", col = 'red')
lines(Time, sub_metering_3, type = "l", col = 'blue')
legend('topright', lty=c(1,1), lwd=c(1,1), bty = "n",
       col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
axis.POSIXct(side=1, at=cut(Time, "days"), format="%a") 
#for fouth plot
plot(Time, Global_reactive_power, xaxt = "n", type = "l", xlab = 'datatime')
axis.POSIXct(side=1, at=cut(Time, "days"), format="%a") 
dev.copy(png,'plot4.png')
dev.off()

