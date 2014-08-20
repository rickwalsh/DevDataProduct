## Rick Walsh 5/20/2014  plot5.r

## load library for data table
library(data.table)

## read the emissions data
##SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

## subset for Baltimore City and type of ON-ROAD 
## for Motor Vehicles per requirements
NEIWork<-subset(NEI, fips=='24510' & type == 'ON-ROAD' )

## create a DataFrame for the plot data
dfPlot <- data.frame(character(0),character(0),character(0),numeric(0),character(0),numeric(0))

## copy the column names from the read-in DF to the plot DF
colnames(dfPlot)<-colnames(NEI)

## set up date vector
vYear <- c('1999',  '2002',   '2005',  '2008' )

## set up index for loop
index <- 1

## for each of the 4 years
for (j in 1:4){
  
  ## subset by year within Baltimore On Road data
  dYear <- subset(NEIWork, year==vYear[j] )
  
  ## save the year and emissions sum
  dfPlot[index,]$year <- vYear[j]
  dfPlot[index,]$Emissions<-sum(dYear$Emissions)  
  index <- index + 1
}

## set up the range of Emission
g_range <- range(dfPlot$Emission)

## create plot1 file with proper h and w
png("plot5.png",height=480, width=480)

plot (dfPlot$year, dfPlot$Emissions, type="o", col="blue",  
      ylim=g_range, xlab="Year", ylab="Emissions (Tons)", main="Motor Vehicle PM25 Emissions: Baltimore ")

dev.off()

