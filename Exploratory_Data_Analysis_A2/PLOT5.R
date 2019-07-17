#PLOT5

png(file="C:/Users/Alex/Documents/R/plot5.png")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

x <- SCC[grep("Motor",SCC$Short.Name),]
y <- subset(x,select = c(SCC,SCC.Level.Three))
z <- merge(NEI, y, by="SCC")
w <- subset(z,fips == "24510", select=c(year,Emissions))
w$year <- as.numeric(w$year)

SumEmMo <- function(Year){
  Year <- subset(w, year==Year,select=Emissions)
  sum <- sum(Year[,])
  return(sum)
}

sum99 <- SumEmMo(1999)
sum02 <- SumEmMo(2002)
sum05 <- SumEmMo(2005)
sum08 <- SumEmMo(2008)

Years<- c(1999,2002,2005,2008)
Sums1 <- c(sum99,sum02,sum05,sum08)
df <- data.frame(Years, Sums1)


plot(Years, Sums1, type="l", col="red4", xlab="",ylab="Source",main= "Motor Vehicle Sources of Emissions")

dev.off()
 