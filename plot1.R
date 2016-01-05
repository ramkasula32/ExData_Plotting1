#### Course Project 1 of Exploratory Data Analysis. 
#### Created on 5th Jan 2016 by Ram Kasula
#### The script plot1.R creates graphics device plot1.png

data_location <- ("./data/household_power_consumption.txt")
read_data <- read.table(data_location, header=TRUE, stringsAsFactors=FALSE, sep=";", dec=".")
# nrow(read_data)  [1] 2075259 ncol(read_data)  [1] 9

subset_readdata <- subset(read_data, grepl("^1/2/2007|^2/2/2007", read_data$Date))
# subset_readdata <- read_data[grep("^1/2/2007|^2/2/2007",read_data$Date),]
# nrow(subset_readdata) [1] 2880 

Global_active_power <- as.numeric(subset_readdata$Global_active_power)
png("plot1.png", width=480, height=480)
hist(Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()