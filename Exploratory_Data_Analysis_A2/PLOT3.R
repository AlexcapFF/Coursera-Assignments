#PLOT3
library(ggplot2)

png(file="C:/Users/Alex/Documents/R/plot3.png")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SumEmBTy <- function(Year, Type){
  Year <- subset(NEI, fips == "24510" & year==Year,select=c(Emissions,type))
  Type <- subset(Year, type==Type,select= Emissions)
  sum <- sum(Type[,])
  return(sum)
}

Point <- c(SumEmBTy(1999,"POINT"),SumEmBTy(2002,"POINT"),SumEmBTy(2005,"POINT"),SumEmBTy(2008,"POINT"))
NonPoint <- c(SumEmBTy(1999,"NONPOINT"),SumEmBTy(2002,"NONPOINT"),SumEmBTy(2005,"NONPOINT"),SumEmBTy(2008,"NONPOINT"))
OnRoad <- c(SumEmBTy(1999,"ON-ROAD"),SumEmBTy(2002,"ON-ROAD"),SumEmBTy(2005,"ON-ROAD"),SumEmBTy(2008,"ON-ROAD"))
NonRoad <- c(SumEmBTy(1999,"NON-ROAD"),SumEmBTy(2002,"NON-ROAD"),SumEmBTy(2005,"NON-ROAD"),SumEmBTy(2008,"NON-ROAD"))



Years <- c(1999,2002,2005,2008)

TotalEmissions <- c(Point,NonPoint,OnRoad,NonRoad)
Types<- c("POINT","POINT","POINT","POINT","NONPOINT","NONPOINT","NONPOINT","NONPOINT","ON-ROAD","ON-ROAD","ON-ROAD","ON-ROAD","NON-ROAD","NON-ROAD","NON-ROAD","NON-ROAD")

DF <- data.frame(Years, Types, TotalEmissions)

Plot <- ggplot(data=DF, aes(Years, TotalEmissions, col= Types))
Plot+geom_line()+theme_bw()+xlab("")+ylab("Sum of Emissions")+ggtitle("Emissions by Types of Sources")

#From the graph we can see that three out of four types of sources, with "point" being the exception, 
#have stedily decreased from 1999 to 2002. All three were mostly steady in between the years 2002 to 2005 with
#"on-road" showing a small decrease and "non-road" a small increase. However, all three kept on decreasing after
#2005 and up to 2008 with "non-road" decreasing the most and "on-road" the least.
#The great difference of all, was made by the source "point", which doubled its initial value as opposed to the rest,
#in 2005. But from that point onwards, showed the greatest decrease in emissions.

dev.off()
