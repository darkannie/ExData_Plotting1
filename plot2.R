##Read, name and subset power consumption from the household data consumption dataset
power <- read.table("./household_power_consumption.txt",skip=1,sep=";")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
Power_Sub <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

##Convert the Date and Time variables to Date/Time classes
Power_Sub_Date <- as.Date(Power_Sub$Date, format="%d/%m/%Y")
Power_Sub_Time <- strptime(Power_Sub$Time, format = "%H:%M:%S")
Power_Sub_DayA <- format(Power_Sub_Time[1:1440], "01-Feb-2007 %H:%M:%S")
Power_Sub_DayB <- format(Power_Sub_Time[1441:2880], "02-Feb-2007 %H:%M:%S")

##plot the line graph using basic plotting functions and save as a PNG file
png("plot2.png", width=480, height=480)
plot(Power_Sub_Time,as.numeric(as.character(Power_Sub$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)")
title(main = "Global Active Power vs Time")
dev.off()