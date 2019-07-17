#PLOT2

png(file="C:/Users/Alex/Documents/R/plot2.png")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subsetted the data in order to show the sum of emissions of Baltimore city for each year
 SumEmB <- function(Year){
  Year <- subset(NEI, fips == "24510" & year==Year,select=Emissions)
  sum <- sum(Year[,])
  return(sum)
  }

 sumB99 <- SumEmB(1999)
 sumB02 <- SumEmB(2002)
 sumB05 <- SumEmB(2005)
 sumB08 <- SumEmB(2008)

 x<- c(1999,2002,2005,2008)
 y<- c(sumB99,sumB02,sumB05,sumB08)


 plot(x,y,type="l",xlab="",ylab="Emissions of PM2.5(tons)", main="Total Emissions of Pollutant PM2.5 in Baltimore City, Maryland",lwd="2")

#Interestingly enough we see that despite a great decline from the year 1999 to 2002
#there was a large increase, reaching up to 3000 tons of total emissions from 2002 to 2005
#followed by a steady decrease and reaching below 2000 tons of total emissions by the year 2008
 
 dev.off()