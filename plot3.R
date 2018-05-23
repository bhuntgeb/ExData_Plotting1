library(dplyr)
Sys.setlocale(category = "LC_ALL", locale = "english")
# Read raw Data
data<- read.csv("./exdata_data_household_power_consumption//household_power_consumption.txt", sep = ";", na.strings = "?")
data$Date<-as.Date(data$Date, format ="%d/%m/%Y")
data<-filter(data, Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")))

data<-mutate(data, datetime= paste(Date, Time, sep = " "))
data$datetime<-strptime(data$datetime, format ="%Y-%m-%d %H:%M:%S")

quantile(data$Sub_metering_1)
quantile(data$Sub_metering_2)
quantile(data$Sub_metering_3)

png(filename = "plot3.png")
plot( data$datetime, data$Sub_metering_1 ,type = "n", ylab = "Energy sub metering", xlab = "")
lines(data$datetime, data$Sub_metering_1, type ="l", col = "black")
lines(data$datetime, data$Sub_metering_2, type ="l", col = "red")
lines(data$datetime, data$Sub_metering_3, type ="l", col= "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty= c(1,1,1) )
dev.off()
