#### Course Project 1 of Exploratory Data Analysis. 
#### Created on 5th Jan 2016 by Ram Kasula
#### The script plot4.R creates graphics device plot4.png

data_location <- ("./data/household_power_consumption.txt")
read_data <- read.table(data_location, header=TRUE, stringsAsFactors=FALSE, sep=";", dec=".")
# nrow(read_data)  [1] 2075259 ncol(read_data)  [1] 9

subset_readdata <- subset(read_data, grepl("^1/2/2007|^2/2/2007", read_data$Date))
# nrow(subset_readdata) [1] 2880 

Global_active_power <- as.numeric(subset_readdata$Global_active_power)
Sub_metering_1 <- as.numeric(subset_readdata$Sub_metering_1)
Sub_metering_2 <- as.numeric(subset_readdata$Sub_metering_2)
Sub_metering_3 <- as.numeric(subset_readdata$Sub_metering_3)
Global_reactive_power <- as.numeric(subset_readdata$Global_reactive_power)
Voltage <- as.numeric(subset_readdata$Voltage)
Date <- subset_readdata$Date
Time <- subset_readdata$Time
x <- paste(Date,Time,sep=" ")
date_n_time <- strptime(x, "%d/%m/%Y %H:%M:%S") 

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) # ploting in 2 X 2 rows by column

# plot in [1,1]
plot(date_n_time, Global_active_power, xlab="", ylab="Global Active Power",type="l", cex=0.2)

# plot in [1,2]
plot(date_n_time, Voltage,  xlab="datetime", ylab="Voltage", type="l")

# plot in [2,1]
plot(date_n_time,  Sub_metering_1, ylab="Energy Submetering", xlab="", type="l")
lines(date_n_time, Sub_metering_2, col="red", type="l")
lines(date_n_time, Sub_metering_3, col="blue", type="l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd=2.5, col=c("black", "red", "blue"), bty="o")

# plot in [2,2]
plot(date_n_time, Global_reactive_power, xlab="datetime", ylab="Global_reactive_power",  type="l")
dev.off()