
#Import data
consump <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")  

#Convert Date & Time variables into single DateTime variable, force data to date type. 
consump$DateTime <- paste(consump$Date, consump$Time)  
consump$Date <- as.Date(consump$Date, format = "%d/%m/%Y")  
consump$DateTime <- strptime(consump$DateTime, format = "%d/%m/%Y %H:%M:%S")  

#Filter years 
consump_range <- subset(consump, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))  

#Create png
png(file = "plot1.png", width = 480, height = 480, antialias = "cleartype")  
par(mar= c(4, 4, 2, 1))

#Implement the plot  
with(consump_range,hist(Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red"))  
dev.off() 





