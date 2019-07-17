#Downloaded the dataset manually

png(file="C:/Users/Alex/Documents/R/plot3.png",width = 480, height = 480)

pcon <- read.table("C:/Users/Alex/Documents/R/household_power_consumption.txt", header= TRUE, sep=";", na.strings = "?")
                                                                            # Reading the dataset into R
EnUsageFeb <- pcon[66637:69516,]
                                                                            #Subsetting, in order to use the observations needed

DateTime <- strptime(paste(EnUsageFeb$Date, EnUsageFeb$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
                                                                            # Creating a merged date and time variable


plot(DateTime, EnUsageFeb$Sub_metering_1, col= "tomato", type="l",ylab = "Energy sub metering", xlab = " ")
points(DateTime,EnUsageFeb$Sub_metering_2, col="dodgerblue", type="l",ylab = "Energy sub metering")
points(DateTime,EnUsageFeb$Sub_metering_3, col="grey0", type="l", ylab = "Energy sub metering")
legend(x="topright" , legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col =c("tomato","dodgerblue","grey0"), lty= "solid")				
                                                                            # Made the next plot, which was categorized by color as shown in the legend

dev.off()
