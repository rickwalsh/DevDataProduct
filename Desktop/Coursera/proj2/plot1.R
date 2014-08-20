## Rick Walsh 5/20/2014  plot1.r

## load data table library
library(data.table)

## read the emissions data (SCC not needed in this plot)
## SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

## save a copy  
NEIWork<-NEI

## create a DataFrame for the plot data
dfPlot <- data.frame(character(0),character(0),character(0),numeric(0),character(0),numeric(0))

## copy the column names from the read-in DF to the plot DF
colnames(dfPlot)<-colnames(NEI)

## set up date vector
vYear <- c('1999',  '2002',   '2005',  '2008' )

## use and index to loop through for each year
index <- 1

## for each of the 4 years, sum the emissions 
## save the year and sum in a DF
for (j in 1:4){
  dYear <- subset(NEIWork, year==vYear[j] )
  
  ## save in 1000s of tons
  dfPlot[index,]$year <- vYear[j]
  dfPlot[index,]$Emissions<-sum(dYear$Emissions) / 1000
  index <- index + 1
}

## get the range of Emission
g_range <- range(dfPlot$Emission)

## create plot1 file with proper h and w
png("plot1.png",height=480, width=480)

## plot the emissions
plot (dfPlot$year, dfPlot$Emissions, type="o", col="blue", 
      ylim=g_range, xlab="Year", ylab="Emissions (in 1000s of Tons)", 
      main="United States Total PM25 Emissions")

dev.off()

