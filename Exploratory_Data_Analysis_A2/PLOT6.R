#PLOT6

png(file="C:/Users/Alex/Documents/R/plot6.png")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subsetting to get the emissions for Baltimore City

x1 <- SCC[grep("Motor",SCC$Short.Name),]
y1 <- subset(x1,select = c(SCC,SCC.Level.Three))
z1 <- merge(NEI, y1, by="SCC")
w1 <- subset(z1,fips == "24510", select=c(year,Emissions))
w1$year <- as.numeric(w1$year) #had to turn to numeric because of a warning

SumEmMoA <- function(Year){
  Year <- subset(w1, year==Year,select=Emissions)
  sum <- sum(Year[,])
  return(sum)
}

sum99A <- SumEmMoA(1999)
sum02A <- SumEmMoA(2002)
sum05A <- SumEmMoA(2005)
sum08A <- SumEmMoA(2008)

Years<- c(1999,2002,2005,2008)
Sums1 <- c(sum99A,sum02A,sum05A,sum08A)
df <- data.frame(Years, Sums1)

#subsetting to get the emissions for Los Angeles

x2 <- SCC[grep("Motor",SCC$Short.Name),]
y2 <- subset(x2,select = c(SCC,SCC.Level.Three))
z2 <- merge(NEI, y2, by="SCC")
w2 <- subset(z2,fips == "06037", select=c(year,Emissions))
w2$year <- as.numeric(w2$year) #had to turn to numeric because of a warning

SumEmMoB <- function(Year){
  Year <- subset(w2, year==Year,select=Emissions)
  sum <- sum(Year[,])
  return(sum)
}

sum99B <- SumEmMoB(1999)
sum02B <- SumEmMoB(2002)
sum05B <- SumEmMoB(2005)
sum08B <- SumEmMoB(2008)

Sums2 <- c(sum99B,sum02B,sum05B,sum08B)
df <- data.frame(Years, Sums2)

par(mfrow=c(2,1))
plot(Years, Sums1, type="l", col="red3", xlab="",ylab="Baltimore")
plot(Years, Sums2, type="l", col="blue4", xlab="",ylab="Los Angeles")

#It is clearly shown that in Baltimore city, emissions from motor vehicles increased up to 85 tons from 1999
#to 2005, and decreased afterwards. As opposed to Los Angeles where there was a steady increase until 2005 and only a
#a small decrease afterwards. It is worth noting that emissions in Baltimore were non existant in 1999 in contrast to
#Los Angeles where the initial value is just a little below 70 tons.
dev.off()

