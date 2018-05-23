library(dplyr)
# Read raw Data
data<- read.csv("./exdata_data_household_power_consumption//household_power_consumption.txt", sep = ";", na.strings = "?")
data$Date<-as.Date(data$Date, format ="%d/%m/%Y")
data<-filter(data, Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")))

png(filename = "plot1.png")
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
