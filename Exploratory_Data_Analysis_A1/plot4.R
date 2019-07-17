#Downloaded the dataset manually

png(file="C:/Users/Alex/Documents/R/plot4.png",width = 480, height = 480)

pcon <- read.table("C:/Users/Alex/Documents/R/household_power_consumption.txt", header= TRUE, sep=";", na.strings = "?")
                                                                            # Reading the dataset into R
EnUsageFeb <- pcon[66637:69516,]
                                                                            #Subsetting, in order to use the observations needed

DateTime <- strptime(paste(EnUsageFeb$Date, EnUsageFeb$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
                                                                            # Creating a merged date and time variable


par(mfrow=c(2,2))
plot(DateTime,EnUsageFeb$Global_active_power, type = "l",xlab="", ylab = "Global active power (kilowatts)", col="coral4")

plot(DateTime, EnUsageFeb$Sub_metering_1, col= "tomato", type="l",ylab = "Energy sub metering", xlab=" ")
points(DateTime,EnUsageFeb$Sub_metering_2, col="dodgerblue", type="l")
points(DateTime,EnUsageFeb$Sub_metering_3, col="grey0", type="l", ylab = "Energy sub metering")
legend(x="topright" , legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col =c("tomato","dodgerblue","grey0"), lty= "solid")

plot(DateTime, EnUsageFeb$Voltage, type="l", xlab=" ", ylab="Voltage", col="midnightblue")

plot(DateTime, EnUsageFeb$Global_reactive_power, type="l",xlab=" ",ylab="Global reactive power",col="black")

dev.off()
