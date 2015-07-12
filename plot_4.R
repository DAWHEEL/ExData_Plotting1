
#Import data
consump <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")  

#Convert Date & Time variables into single DateTime variable, force data to date type. 
consump$DateTime <- paste(consump$Date, consump$Time)  
consump$Date <- as.Date(consump$Date, format = "%d/%m/%Y")  
consump$DateTime <- strptime(consump$DateTime, format = "%d/%m/%Y %H:%M:%S")  

#Filter years 
consump_range <- subset(consump, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))  

#Create png
png(file = "plot4.png", width = 480, height = 480, antialias = "cleartype")  
par(mar= c(4, 4, 2, 1))
par(mfrow = c(2, 2)) 

#Implement the plot  
#Plot Row1,Co1umn1  
with(consump_range, plot(x = DateTime, y = Global_active_power, xlab = "", ylab = "Global Active Power", main = NULL, col = "black", type = "l"))  

#Plot Row1,Co1umn2 
with(consump_range, plot(x = DateTime, y = Voltage, xlab = "datetime", ylab = "Voltage", main = NULL, col = "black", type = "l"))  

#Plot Row2,Co1umn1 
with(consump_range,   
     plot(x = DateTime, y = Sub_metering_1, xlab = "", ylab = "Energy sub metering", main = NULL, col = "black", type = "l"))  
with(consump_range, lines(x = DateTime, y = Sub_metering_2, col = "red"))  
with(consump_range, lines(x = DateTime, y = Sub_metering_3, col = "blue"))  
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")  

#Plot Row2,Co1umn2   
with(consump_range, plot(x = DateTime, y = Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power",   main = NULL, col = "black", type = "l"))  
dev.off() 