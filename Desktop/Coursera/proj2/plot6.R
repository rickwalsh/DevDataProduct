## Rick Walsh 5/20/2014  plot6.r

## load libraries for data table and ggplot2
library(data.table)
library(ggplot2)

## read the emissions data
##SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

## set up vectors for years, FIPS, and names of FIPS locations
vYear <- c('1999',  '2002',   '2005',  '2008' )
vFips <- c('24510', '06037')
vLoc <- c('Baltimore', 'Los Angeles')

## subset data by FIPS code
## and by ON-ROAD type to get Motor Vehicle data only
NEIWork <- subset(NEI, (fips==vFips[1] | fips==vFips[2]) & type == 'ON-ROAD')

## set up data frame for plot and set column names
dfPlot <- data.frame(numeric(0),character(0),character(0),numeric(0),numeric(0),numeric(0))
colnames(dfPlot)<-colnames(NEI)

## set up index for loop
index <- 1

## for each of 4 years and each of 2 FIPS
for (j in 1:4){
  for (k in 1:2) {
    
    ## subset based upon year and fips
    dYear <- subset(NEIWork, year==vYear[j] & fips==vFips[k] )
    
    ## save location name for plot (not fips), year, and sum of emissions
    dfPlot[index,]$fips <- as.character(vLoc[k])
    dfPlot[index,]$year <- vYear[j]

    dfPlot[index,]$Emissions<-sum(dYear$Emissions)  
    index <- index + 1
    }
}

## set up plot
png("plot6.png",height=480, width=480)

## generate plot
qplot(year,  Emissions,  data = dfPlot,  color = fips,  size=I(1.5),
      geom=c('point','line'), group=fips, xlab="Year", ylab="Emissions (Tons)",
      main='Emissions: Baltimore and Los Angeles')	
dev.off()
