library(dplyr)
Sys.setlocale(category = "LC_ALL", locale = "english")
# Read raw Data
data<- read.csv("./exdata_data_household_power_consumption//household_power_consumption.txt", sep = ";", na.strings = "?")
data$Date<-as.Date(data$Date, format ="%d/%m/%Y")
data<-filter(data, Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")))

data<-mutate(data, datetime= paste(Date, Time, sep = " "))
data$datetime<-strptime(data$datetime, format ="%Y-%m-%d %H:%M:%S")

png(filename = "plot2.png")
plot( data$datetime, data$Global_active_power ,type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
