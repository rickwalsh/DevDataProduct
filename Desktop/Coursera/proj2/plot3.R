## Rick Walsh 5/20/2014  plot3.r

## load data table and ggplot2 libraries
library(data.table)
library(ggplot2)

## read the emissions data (SCC not needed)
## SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

## set up vectors for years and Types
vYear <- c('1999',  '2002',   '2005',  '2008' )
typeList <- c('POINT', 'NONPOINT', 'ON-ROAD', 'NON-ROAD')

## set up an index so code can loop though data
index <- 1

## subset data for Baltimore
NEIWork <- subset(NEI, fips=="24510" )

## set up data frame for plot, copy column names from read in data frame
dfPlot <- data.frame(character(0),character(0),character(0),numeric(0),numeric(0),numeric(0))
colnames(dfPlot)<-colnames(NEI)

## for each of the 4 types, for each of the 4 years loop
for (j in 1:4){
  for (k in 1:4) {
    
    ## subset based upon year and type within Baltimore data
    dYear <- subset(NEIWork, year==vYear[j] & type==typeList[k] )
    
    ## save year, type and sum of emissions
    dfPlot[index,]$type <- as.character(typeList[k])
    dfPlot[index,]$year <- vYear[j]

    dfPlot[index,]$Emissions<-sum(dYear$Emissions)  
    index <- index + 1
    }
}

## set up plot
png("plot3.png",height=480, width=480)

## create plot with multi-line to show the 4 types by year
qplot(year,  Emissions,  data = dfPlot,  color = type, size = I(1.5),
      geom= c('line','point'), xlab = 'Year', ylab = 'Emissions (Tons)', 
      group=type, main='Total Baltimore Emissions By Type')	

dev.off()