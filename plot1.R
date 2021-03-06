library(lubridate)
df <- read.csv('household_power_consumption.txt', header = TRUE, sep = ';')
df <- df[df$Date == '1/2/2007' | df$Date == '2/2/2007',]
df$Date <- as.Date(df$Date, '%d/%m/%Y')
df$Time <- hms(df$Time)
GAP<- as.numeric(as.character(df$Global_active_power))
quartz()
hist(GAP, col = 'red', main = 'Global Active Power', xlab = 'Global Active Power(kilowatts)')
dev.copy(png,'plot1.png')
dev.off()