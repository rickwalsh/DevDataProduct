## Rick Walsh 5/20/2014  plot4.r

#load data table library
library(data.table)

## read the emission and SCC data
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

## save a copy  
NEIWork<-NEI

## create SCCwork using GREP on 'coal' or 'lignite' so only coal-related
## SCC codes to be used
SCCWork <- SCC[grepl("coal", SCC$SCC.Level.Three, ignore.case=TRUE) 
               | grepl("Lignite", SCC$SCC.Level.Three, ignore.case=TRUE),]

## subset on coal SCC codes, so data is only for coal SCC's
NEIWork <- subset(NEI, SCC %in% SCCWork$SCC)

## create a DataFrame for the plot data
dfPlot <- data.frame(character(0),character(0),character(0),numeric(0),character(0),numeric(0))

## copy the column names from the read-in DF to the plot DF
colnames(dfPlot)<-colnames(NEI)

## set up date vector
vYear <- c('1999',  '2002',   '2005',  '2008' )

## set up index to loop
index <- 1

## for each of the 4 years
for (j in 1:4){
  
  ## subset based upon year with coal only data
  dYear <- subset(NEIWork, year==vYear[j] )
  
  ## save year and emissions (for coal subset)
  dfPlot[index,]$year <- vYear[j]
  dfPlot[index,]$Emissions<-sum(dYear$Emissions) / 1000
  index <- index + 1
}

## set up the range of Emission
g_range <- range(dfPlot$Emission)

## create plot file with proper h and w
png("plot4.png",height=480, width=480)

## plot for coal
plot (dfPlot$year, dfPlot$Emissions, type="o", col="blue", 
      ylim=g_range, xlab="Year", ylab="Emissions (1000's Tons)",
      main="United States Coal-Related PM25 Emissions")

dev.off()

