## Rick Walsh 5/20/2014  plot2.r

## load data table library
library(data.table)

## read the emissions data (SCC not needed)
## SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

## subset for Baltimore City only using FIPS
NEIWork<-subset(NEI, fips=='24510' )

## create a DataFrame for the plot data
dfPlot <- data.frame(character(0),character(0),character(0),numeric(0),character(0),numeric(0))

## copy the column names from the read-in DF to the plot DF
colnames(dfPlot)<-colnames(NEI)

## set up date vector
vYear <- c('1999',  '2002',   '2005',  '2008' )

## use and index to loop through for each year
index <- 1

## for each of the 4 years, sum the emissions 
for (j in 1:4){
  
  ## subset by year
  dYear <- subset(NEIWork, year==vYear[j] )
  
  ## save year, and emissions in 1000s of tons
  dfPlot[index,]$year <- vYear[j]
  dfPlot[index,]$Emissions<-sum(dYear$Emissions) / 1000
  index <- index + 1
}

## set up the range of Emission
g_range <- range(dfPlot$Emission)

## create plot file with proper h and w
png("plot2.png",height=480, width=480)

plot (dfPlot$year, dfPlot$Emissions, type="o", col="blue",  
      ylim=g_range, xlab="Year", ylab="Emissions (in 1000s of Tons)", 
      main="Baltimore PM25 Emissions")

dev.off()

