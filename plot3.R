# load required data

file <- "household_power_consumption.txt" #assumed to be in same working directory
data <- read.table(file,header=TRUE,sep=";",stringsAsFactors = FALSE,dec=".")
reqData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


#convert date and time from data into R classes for easy manipulation
date_time <- strptime(paste(reqData$Date, reqData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# set up data 
globalActivePower <- as.numeric(reqData$Global_active_power)
sub_mt1 <- as.numeric(reqData$Sub_metering_1)
sub_mt2 <- as.numeric(reqData$Sub_metering_2)
sub_mt3 <- as.numeric(reqData$Sub_metering_3)

#plot

png("plot3.png",width = 480,height=480)
plot(date_time,sub_mt1,type="l",xlab="",ylab="Energy Submetering")
lines(date_time,sub_mt2,type="l",col="red")
lines(date_time,sub_mt3,type="l",col="blue")

legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1,lwd=2.5,col=c("black","red","blue"))
dev.off()