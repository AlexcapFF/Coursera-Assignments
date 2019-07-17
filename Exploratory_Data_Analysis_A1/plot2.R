#Downloaded the dataset manually

png(file="C:/Users/Alex/Documents/R/plot2.png",width = 480, height = 480)

pcon <- read.table("C:/Users/Alex/Documents/R/household_power_consumption.txt", header= TRUE, sep=";", na.strings = "?")
                                                                            # Reading the dataset into R
EnUsageFeb <- pcon[66637:69516,]
                                                                            #Subsetting, in order to use the observations needed

DateTime <- strptime(paste(EnUsageFeb$Date, EnUsageFeb$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
                                                                            # Creating a merged date and time variable


plot(DateTime,EnUsageFeb$Global_active_power, type = "l",xlab="", ylab = "Global active power (kilowatts)", col="coral4")
                                                                            # Created the plot. Which shows, as expected a large consumption
                                                                            # around noon

dev.off()
