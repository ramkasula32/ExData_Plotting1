#### Course Project 1 of Exploratory Data Analysis. 
#### Created on 5th Jan 2016 by Ram Kasula
#### The script plot2.R creates graphics device plot2.png

data_location <- ("./data/household_power_consumption.txt")
read_data <- read.table(data_location, header=TRUE, stringsAsFactors=FALSE, sep=";", dec=".")
# nrow(read_data)  [1] 2075259 ncol(read_data)  [1] 9

subset_readdata <- subset(read_data, grepl("^1/2/2007|^2/2/2007", read_data$Date))
# nrow(subset_readdata) [1] 2880 

Global_active_power <- as.numeric(subset_readdata$Global_active_power)
Date <- subset_readdata$Date
Time <- subset_readdata$Time
x<- paste(Date,Time,sep=" ")
date_n_time <- strptime(x, "%d/%m/%Y %H:%M:%S") 
png("plot2.png", width=480, height=480)
plot(date_n_time, Global_active_power,xlab="", ylab="Global Active Power (kilowatts)", type="l" )
dev.off()
