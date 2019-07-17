#PLOT1

png(file="C:/Users/Alex/Documents/R/plot1.png")

 NEI <- readRDS("summarySCC_PM25.rds")
 SCC <- readRDS("Source_Classification_Code.rds")
 
#Getting the sum of 'Emissions' for each year

 SumEm <- function(Year){
  Year <- subset(NEI, year==Year,select=Emissions)
  sum <- sum(Year[,])
  return(sum)
  }

#We have a first clear view that total emissions have decreased over the years

 sum99 <- SumEm(1999)
 sum02 <- SumEm(2002)
 sum05 <- SumEm(2005)
 sum08 <- SumEm(2008)


 x<- c(1999,2002,2005,2008)
 y <- c(sum99,sum02,sum05,sum08)

#I will use 'options("scipen")' to negate the scientific notation for large numbers
 
 options("scipen"=100)

 plot(x,y, type="l",ylim = c(1000000,8000000),xlab="", ylab = "Emissions of PM2.5(tons)",main="Total Emissions of Pollutant PM2.5(tons) from Every Source",lwd="2",col="red4")

#The plot shows what summing up the emissions already showed. 
#There was a great decrease of emissions from 1999 to 2002. 
#Followed by a somewhat stable status(with a declining tendency) up to 2005.
#And continued to 2008 with an even greater decline than that of 1999-2002.
 
 dev.off()