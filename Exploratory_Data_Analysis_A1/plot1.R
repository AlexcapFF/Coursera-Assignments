#Downloaded the dataset manually

png(file="C:/Users/Alex/Documents/R/plot1.png",width = 480, height = 480)

pcon <- read.table("C:/Users/Alex/Documents/R/household_power_consumption.txt", header= TRUE, sep=";", na.strings = "?")
                                                                            # Reading the dataset into R
EnUsageFeb <- pcon[66637:69516,]
                                                                            #Subsetting, in order to use the observations needed


hist(EnUsageFeb$Global_active_power, col= "red4",	main= "Global Active Power", xlab="Global active power (kilowatts)")
                                                                            # Creating the first histogram
                                                                            # Which shows that the most frequent observation is between 0-0.5 kilowatts
                                                                            # 0-0.5 kilowatts followed by 1-1.5 kilowatts

dev.off()
