# load required data

file <- "household_power_consumption.txt" #assumed to be in same working directory
data <- read.table(file,header=TRUE,sep=";",stringsAsFactors = FALSE,dec=".")
reqData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


#convert date and time from data into R classes for easy manipulation
date_time <- strptime(paste(reqData$Date, reqData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# set up data and plot
globalActivePower <- as.numeric(reqData$Global_active_power)
png("plot2.png",width = 480,height = 480)
plot(x=date_time,y=globalActivePower,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()