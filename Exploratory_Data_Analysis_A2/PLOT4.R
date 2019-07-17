#PLOT4

png(file="C:/Users/Alex/Documents/R/plot4.png")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

x <- SCC[grep("Coal",SCC$SCC.Level.Three),]
y <- x[grep("Fuel Comb", x$EI.Sector),]
z <- subset(y,select=c("SCC","SCC.Level.Three"))

total <- merge(NEI,z, by="SCC")


SumEmSo <- function(Year, Source){
  Year <- subset(total, year==Year,select=c(Emissions, SCC.Level.Three))
  Source <- subset(Year, SCC.Level.Three==Source, select= Emissions)
  sum <- sum(Source[,])
  return(sum)
}

AnthCoal <- c(SumEmSo(1999,"Anthracite Coal"),SumEmSo(2002,"Anthracite Coal"),SumEmSo(2005,"Anthracite Coal"),SumEmSo(2008,"Anthracite Coal"))
GasCoal <- c(SumEmSo(1999,"Gasified Coal"),SumEmSo(2002,"Gasified Coal"),SumEmSo(2005,"Gasified Coal"),SumEmSo(2008,"Gasified Coal"))
WasCoal <- c(SumEmSo(1999,"Waste Coal"),SumEmSo(2002,"Waste Coal"),SumEmSo(2005,"Waste Coal"),SumEmSo(2008,"Waste Coal"))
BitCoal <- c(SumEmSo(1999,"Bituminous/Subbituminous Coal"),SumEmSo(2002,"Bituminous/Subbituminous Coal"),SumEmSo(2005,"Bituminous/Subbituminous Coal"),SumEmSo(2008,"Bituminous/Subbituminous Coal"))

CoalComb <- c(AnthCoal, GasCoal, WasCoal, BitCoal)
Years <- c(1999,2002,2005,2008)
Sources <- c("Anthracite Coal","Anthracite Coal","Anthracite Coal","Anthracite Coal","Gasified Coal","Gasified Coal","Gasified Coal","Gasified Coal","Waste Coal","Waste Coal","Waste Coal","Waste Coal","Bituminous/Subbituminous Coal","Bituminous/Subbituminous Coal","Bituminous/Subbituminous Coal","Bituminous/Subbituminous Coal")

df <- c(Years, Sources, CoalComb)

par(mfrow=c(2,2),mar=c(4,4,2,2))
plot(Years, AnthCoal, col="black",type="l",lwd=2,xlab="",ylab="Anthracite Coal")
plot(Years, GasCoal, col="green",type="l",lwd=2,xlab="",ylab="Gasified Coal")
plot(Years, WasCoal, col="blue4",type="l",lwd=2,xlab="",ylab="Waste Coal")
plot(Years, BitCoal, col="red4",type="l",lwd=2,xlab="",ylab="Bituminous/Subbituminous Coal")

#1st Graph: Emissions from coal combustion with anthracite coal, have shown a steady at first and then a rapid decline
#Initial total emissions were above 7000 tons in 1999 and decreased only down to 6500 tons by 2005, followed by
#a great fall of over 5000 tons by 2008.
#2nd Graph: Here we see total emissions from coal combustion with gasified coal. Those emission were non-existant in 1999
#and from that point onwards kept on increasing. by 2002 there were 0.1 tons of emissions, which after a declining course,
#rose up to 0.6 tons in 2008.
#3rd Graph: In this type of emissions we have an increasing course from 0 to 20 tons in 2002, followed by a small raise and
#fell again down to 0 in 2008
#4th Graph: In this graph we see an overall 200.000 tons less emissions in the interval 1999-2008. Up until 2005 there was a
#small amount of emissions decreasing. However, since 2005 and up to 2008, there was a great diminish in total emissions
#Note: It's worth noting that emissions in the 2nd and 3rd graph are much too low, compared to the first and especially the 4th
#graph(as one would notice by comparing the y-axes of each graph)
dev.off()
