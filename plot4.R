#### Optional Code -- specify work directory ###########
#setwd("Y:/Documents/Coursera/Exploratory Data Analysis/exdata-data-household_power_consumption")
########################################################

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              dest ="exdata-data-household_power_consumption.zip")

#data will be a dataframe containing the raw data
data = read.delim(unzip("exdata-data-household_power_consumption.zip"),sep = ";",na.strings = "?")

#data2 will subset the data and add a "date and time" field
data2 = data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
data2$Date.and.Time = strptime(paste(data2$Date,data2$Time),"%d/%m/%Y %H:%M:%S")

attach(data2)
png(filename = "plot4.png",width = 480, height = 480,bg = "transparent")
par(mfrow=c(2,2))
plot(Date.and.Time, Global_active_power,type="l",ylab="Global Active Power",xlab="")
plot(Date.and.Time, Voltage,type="l",ylab="Voltage",xlab="datetime")
plot(Date.and.Time, Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(Date.and.Time, Sub_metering_2,col="red",type="l")
lines(Date.and.Time, Sub_metering_3,col="blue",type="l")
legend("topright",col = c("black", "red", "blue"),lty=1,bty="n",
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(Date.and.Time, Global_reactive_power,type="l",xlab="datetime")
dev.off()
detach(data2)

