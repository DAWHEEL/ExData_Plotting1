
#Import data
consump <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")  

#Convert Date & Time variables into single DateTime variable, force data to date type. 
consump$DateTime <- paste(consump$Date, consump$Time)  
consump$Date <- as.Date(consump$Date, format = "%d/%m/%Y")  
consump$DateTime <- strptime(consump$DateTime, format = "%d/%m/%Y %H:%M:%S")  

#Filter years 
consump_range <- subset(consump, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))  

#Create png
png(file = "plot3.png", width = 480, height = 480, antialias = "cleartype")  
par(mar= c(4, 4, 2, 1))

#Implement the plot  
with(consump_range,  plot(x = DateTime, y = Sub_metering_1, xlab = "", ylab = "Energy sub metering", main = NULL, col = "black", type = "l"))  
with(consump_range, lines(x = DateTime, y = Sub_metering_2, col = "red"))  
with(consump_range, lines(x = DateTime, y = Sub_metering_3, col = "blue"))  
legend("topright", lty = 1, col = c("black", "red", "blue"),   
legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), xjust=1)  
dev.off() 
