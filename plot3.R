library(dplyr)
Sys.setlocale(category = "LC_ALL", locale = "english")
# Read raw Data
data<- read.csv("./exdata_data_household_power_consumption//household_power_consumption.txt", sep = ";", na.strings = "?")
# Convert Date variables to Date-Classes
data$Date<-as.Date(data$Date, format ="%d/%m/%Y")
# Filtering the Data by Date
data<-filter(data, Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")))

# Create new Column with combined Date and Time varianble
data<-mutate(data, datetime= paste(Date, Time, sep = " "))
#Convert Date/Time variable to Date/Time Class
data$datetime<-strptime(data$datetime, format ="%Y-%m-%d %H:%M:%S")

# Checking which Submetering is best for scaling the plot
quantile(data$Sub_metering_1)
quantile(data$Sub_metering_2)
quantile(data$Sub_metering_3)

# Set PNG as Graphic Device
png(filename = "plot3.png")
# Ploting the initial Graph without any Lines 
plot( data$datetime, data$Sub_metering_1 ,type = "n", ylab = "Energy sub metering", xlab = "")
# Adding Lines for Submetering in deferent colors
lines(data$datetime, data$Sub_metering_1, type ="l", col = "black")
lines(data$datetime, data$Sub_metering_2, type ="l", col = "red")
lines(data$datetime, data$Sub_metering_3, type ="l", col= "blue")
# Adding Legend
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty= c(1,1,1) )
# Closing Gaphic Device
dev.off()
