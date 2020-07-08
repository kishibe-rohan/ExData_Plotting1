# load required data

file <- "household_power_consumption.txt" #assumed to be in same working directory
data <- read.table(file,header=TRUE,sep=";",stringsAsFactors = FALSE,dec=".")
reqData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


#convert date and time from data into R classes for easy manipulation
date_time <- strptime(paste(reqData$Date, reqData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# set up data 
globalActivePower <- as.numeric(reqData$Global_active_power)
globalReactivePower <- as.numeric(reqData$Global_reactive_power)
voltage <- as.numeric(reqData$Voltage)
sub_mt1 <- as.numeric(reqData$Sub_metering_1)
sub_mt2 <- as.numeric(reqData$Sub_metering_2)
sub_mt3 <- as.numeric(reqData$Sub_metering_3)

#set up for plot

png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))      #Setting up display 

#plotting one by one
plot(date_time,globalActivePower,type="l",xlab="",ylab="Global Active Power",cex=0.2)

plot(date_time,voltage,type="l",xlab="datetime",ylab="Voltage")

plot(date_time,sub_mt1,type="l",xlab="",ylab="Energy Submetering")
lines(date_time,sub_mt2,type="l",col="red")
lines(date_time,sub_mt3,type="l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(date_time,globalReactivePower,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.off()
