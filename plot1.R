library(dplyr)
# Read raw Data
data<- read.csv("./exdata_data_household_power_consumption//household_power_consumption.txt", sep = ";", na.strings = "?")
# Convert Date variables to Date-Classes
data$Date<-as.Date(data$Date, format ="%d/%m/%Y")
# Filtering the Data by Date
data<-filter(data, Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")))

# Set PNG as Graphic Device
png(filename = "plot1.png")

# Plot the Histogramm
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

# Closing Gaphic Device
dev.off()
