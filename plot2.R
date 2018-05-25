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

# Set PNG as Graphic Device
png(filename = "plot2.png")
# Plotting the Line-Graph
plot( data$datetime, data$Global_active_power ,type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
# Closing Gaphic Device
dev.off()
