## Rick Walsh 5/20/2014  plot1.r

yearEmission <- function (nYear) {
  
  for (j in 1:4){
    dYear <- subset(NEIWork, year==nYear[j] )
  
    dfPlot[index,]$year <- nYear[j]
    dfPlot[index,]$Emissions<-sum(dYear$Emissions) / 1000
    index <- index + 1
  }
##  dfPlot
}

yearEmissionType <- function(nYear, dfIN ) {
  
  for (i in 1:4){
    dYear <- subset(NEIWork, year==nYear & type==typeList[i] )
  
    dfIN$year<-nYear
    dfIN$type<-typeList[i]
    dfIN$Emissions<-sum(dYear$Emissions) / 1000
    }
  dfIN
}
## setwd to where all files are located for processing
setwd("c://users//rick.walsh//desktop//coursera//proj2")
library(data.table)
library(ggplot2)
## read the subject data
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")
NEIWork<-NEI

##typeList <- unique(NEI$type)
##typeList
##dfPlot <- NEI[1,]
dfPlot <- data.frame(character(0),character(0),character(0),numeric(0),character(0),numeric(0))
colnames(dfPlot)<-colnames(NEI)

vYear <- c('1999',  '2002',   '2005',  '2008' )
typeList <- c('POINT', 'NONPOINT', 'ON-ROAD', 'NON-ROAD')
index <- 1
for (j in 1:4){
  dYear <- subset(NEIWork, year==vYear[j] )
  
  dfPlot[index,]$year <- vYear[j]
  dfPlot[index,]$Emissions<-sum(dYear$Emissions) / 1000
  index <- index + 1
}

dfPlot
class(typeList)
g_range <- range(dfPlot$Emission)

plot (dfPlot$year, dfPlot$Emissions, type="o", col="blue", 
      ylim=g_range, xlab="Year", ylab="Emissions (1000s)")
##      , xlim=c(1999, 2002, 2005, 2008))

NEIWork<-NEI
NEIWork <- subset(NEIWork, fips=="24510" )

dfPlot <- data.frame(character(0),character(0),character(0),numeric(0),character(0),numeric(0))
colnames(dfPlot)<-colnames(NEI)

index <- 1
for (j in 1:4){
  dYear <- subset(NEIWork, year==vYear[j]  )
  
  dfPlot[index,]$year <- vYear[j]
  dfPlot[index,]$Emissions<-sum(dYear$Emissions) / 1000
  index <- index + 1
}
dfPlot

vYear <- c('1999',  '2002',   '2005',  '2008' )
typeList <- c('POINT', 'NONPOINT', 'ON-ROAD', 'NON-ROAD')

NEIWork<-NEI
NEIWork <- subset(NEIWork, fips=="24510" )
##typeList <- unique(NEI$type)
dfPlot <- data.frame(character(0),character(0),character(0),numeric(0),numeric(0),numeric(0))
colnames(dfPlot)<-colnames(NEI)
dYear <- dfPlot
str(typeList)
index <- 1

dYear1 <- subset(NEIWork, year==vYear[2] & type==typeList[2] )
dYear1

dfPlot[index,'type'] <-  "TEST"
dfPlot[index,]$year <- vYear[1]

##dYear <- subset(NEIWork, year==vYear[1] & type==typeList[3] )
##dYear
for (j in 1:4){
  for (k in 1:4) {
    dYear <- subset(NEIWork, year==vYear[j] & type==typeList[k] )
    dYear$type
    dfPlot[index,]$type <- as.character(typeList[k])
##    dfPlot[index,]$type <- "TEST"
    dfPlot[index,]$year <- vYear[j]

    dfPlot[index,]$Emissions<-sum(dYear$Emissions)  
    index <- index + 1
    }
}
dfPlot
str(dfPlot)
p <- 

  qplot(year,  Emissions,  data = dfPlot,  color = type,   geom='line', group=type, facets = .~type)	

qplot(year,  Emissions,  data = dfPlot,	facets = .~type, geom = "bar" )	

p + geom_line()

qplot(year,  Emissions,	data = dfPlot,	color	=	type, geom = "line", group=year)	
facets  =	.	~
  ggplot(data=dfPlot, aes(x=year, y=Emissions, group=Emissions)) + geom_line() 
+ geom_point()

warnings()
dfPlot <- NEI[1,]
dfPlot[1,]<-yearEmission(1999, dfPlot[1,])
dfPlot[2,]<-yearEmission(2002, dfPlot[2,])
dfPlot[3,]<-yearEmission(2005, dfPlot[3,])
dfPlot[4,]<-yearEmission(2008, dfPlot[4,])
g_range <- range(dfPlot$Emission)

plot (dfPlot$year, dfPlot$Emissions, type="o", col="blue", 
      ylim=g_range, xlab="Year", ylab="Emissions (1000s)")

NEIWork<-NEI
NEIWork <- subset(NEIWork, fips=="24510" )

dfPlot <- NEI[1,]
dfPlot[1,]<-yearEmissionType(1999, dfPlot[1,] )
dfPlot[2,]<-yearEmissionType(2002, dfPlot[2,] )
dfPlot[3,]<-yearEmissionType(2005, dfPlot[3,] )
dfPlot[4,]<-yearEmissionType(2008, dfPlot[4,] )
g_range <- range(dfPlot$Emission)
"POINT"    "NONPOINT" "ON-ROAD"  "NON-ROAD"
plot (dfPlot$year, dfPlot$Emissions, type="o", col="blue", 
      ylim=g_range, xlab="Year", ylab="Emissions (1000s)")

##, xlim=c(1999, 2002, 2005, 2008))
head(NEI)


dfPlot$year
dPMTot1999 <- subset(dfData, year==1999  & Pollutant=='PM25-PRI')
dPMTot2002 <- subset(dfData, year==2002  & Pollutant=='PM25-PRI')
dPMTot2005 <- subset(dfData, year==2005  & Pollutant=='PM25-PRI')
dPMTot2008 <- subset(dfData, year==2008  & Pollutant=='PM25-PRI')



## load and unzip the txt file (done up front)
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### finding coal
> SCC_coal_comb <- SCC[grepl("coal", SCC$SCC.Level.Three, ignore.case=TRUE) | grepl("Lignite", SCC$SCC.Level.Three, ignore.case=TRUE),]
> NEI_coal_comb <- subset(NEI, SCC %in% SCC_coal_comb$SCC)
inx <- grep("cars", SCC[, columns with category names])
Instead of cars try other words like vehicle and check out the result using value = TRUE in your grep call.
This will return the index where those categories would be found. Then you just need the sources IDs.
SCC[inx, 1]
type == "ON-ROAD"


## read all the files via read.table

## read the subject data
dfCode <- readRDS("Source_Classification_Code.rds")
dfData <- readRDS("summarySCC_PM25.rds")
dfCode[2 , 1:15]
write.csv(dfCode, "code3.txt" )

dfCode[1:10,'Year']
dfData[6:10,]
dim(dfCode)
dPMTotal <- subset(dfDatadfData$year==1999 | dfData$year==2002 | dfData$year==2005 | dfData$year==2008)
dPMTotal <- subset(dfData,  ((year==1999 |  year==2002 |  year==2005 |  year==2008) &
                     Pollutant=='PM25-PRI'))
dPMTotal[6:10,]
unique(dfData$Pollutant)
unique(dfData$type)



write.file(dfData, "proj2.txt", sep="\t", row.names = F, col.names = T)
dPMTot1999 <- subset(dfData, year==1999  & Pollutant=='PM25-PRI')
dPMTot2002 <- subset(dfData, year==2002  & Pollutant=='PM25-PRI')
dPMTot2005 <- subset(dfData, year==2005  & Pollutant=='PM25-PRI')
dPMTot2008 <- subset(dfData, year==2008  & Pollutant=='PM25-PRI')

EmTot1999<- sum(dPMTot1999$Emissions)
EmTot2002<- sum(dPMTot2002$Emissions)
EmTot2002<- sum(dPMTot2002$Emissions)
EmTot2005<- sum(dPMTot2005$Emissions)
EmTot2008<- sum(dPMTot2008$Emissions)
x<-c(EmTot1999, EmTot2002)
x
plot (c(1999,2002,2005,2008), c(EmTot1999, EmTot2002,EmTot2005, EmTot2008))

dPMTotBalt1999 <- subset(dPMTot1999, fips=="24510")
dPMTotBalt2002 <- subset(dPMTot2002, fips=="24510")
dPMTotBalt2005 <- subset(dPMTot2005, fips=="24510")
dPMTotBalt2008 <- subset(dPMTot2008, fips=="24510")

EmTotBalt1999<- sum(dPMTotBalt1999$Emissions)
EmTotBalt2002<- sum(dPMTotBalt2002$Emissions)
EmTotBalt2005<- sum(dPMTotBalt2005$Emissions)
EmTotBalt2008<- sum(dPMTotBalt2008$Emissions)

plot (c(1999,2002,2005,2008), c(EmTotBalt1999, EmTotBalt2002,EmTotBalt2005, EmTotBalt2008))

qplot (year, c(EmTotBalt1999, EmTotBalt2002,EmTotBalt2005, EmTotBalt2008)
       color=)
qplot(displ,  hwy,	data	=	mpg,	color	=	drv)	

qplot 
dtPMTotal<- data.table(dPMTotal)
dPMTotal
dtFinalSet<-dtPMTotal[,lapply(.SD,total),by='year',.SDcols='Emissions']


shist<-as.numeric(as.character(dPMTotal$Emissions))
shist<- dPMTotal
hist(shist, col = "red", xlab="G ",      ylab="Frequency", main="G r")

dPMTotal2000 <- subset(dfData,  year==2000)


a1<- subset(ac,  AGS == 6 && ACR == 1)
nrow(dfData)
nrow(dPMTotal)
nrow(dPMTotal2000)
class(dfData)
class(dPMTotal)

## read the features (measurement names)
dfFeatures <- read.table("features.txt")

## read the measurement data
dfTrainSet <- read.table("X_train.txt")
dfTestSet <- read.table("X_test.txt")

## read the activities
dfTrainLabel <- read.table("y_train.txt")
dfTestLabel <- read.table("y_test.txt")

## row bind Subjects from the Train and Test data sets
dfSubj<-rbind(dfSubjTrain,dfSubjTest)

## row bind Activities from the Train and Test data
dfLabel<-rbind(dfTrainLabel,dfTestLabel)

## convert the 1-6 values for Activity into the strings below
dfLabel$V1 <- factor(dfLabel$V1, levels = c(1,2,3,4,5,6), 
                     labels = c("Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying"))

## set up a vector of all the columns that are to be selected -- 66 in all
## these are the Mean and Std columns from the test/train data
colVector <- c(1:6,41:46,81:86,121:126,161:166,201:202,214:215,227:228,241:242,253:254,266:271,345:350,424:429,503:504,516:517,529:530,542:543)

## the headers are in column 2, set them in dff
## then use the column vector so only the columns 
##for STD and MEAN will be modified
dff <-dfFeatures[,2]
dff <-dff[colVector]

## now scrub the header data
## get rid of () -
## fix typos, etc
dff<-gsub(fixed=TRUE, ")", "", dff)
dff<-gsub(fixed=TRUE, "(", "", dff)
dff<-gsub(fixed=TRUE, "-", "", dff)
dff<-gsub(fixed=TRUE, ")", "", dff)
dff<-gsub(fixed=TRUE, "tBody", "TimeBody", dff)
dff<-gsub(fixed=TRUE, "fBodyBody", "fBody", dff)
dff<-gsub(fixed=TRUE, "fBody", "FrequencyBody", dff)
dff<-gsub(fixed=TRUE, "tGravity", "TimeGravity", dff)
dff<-gsub(fixed=TRUE, "Acc", "Acceleration", dff)
dff<-gsub(fixed=TRUE, "Mag", "Magnitude", dff)
dff<-gsub(fixed=TRUE, "Gyro", "Gyroscope", dff)
dff<-gsub(fixed=TRUE, "std", "Std", dff)
dff<-gsub(fixed=TRUE, "mean", "Mean", dff)

## row bind the Train and Test data sets
dfDataSet<-rbind(dfTrainSet,dfTestSet)

## reset the data to include only the MEAN and STD columns per colVector
dfDataSet<-dfDataSet[,colVector]

## set the headers to the scrubbed headers from above
colnames(dfDataSet)<-dff

## column bind the Subjects, Activities, and Mean and Std data into one set
dfMeanStd<-cbind(dfSubj,dfLabel,dfDataSet)

## add the headers for Subject and Activity in column 1 and 2
colnames(dfMeanStd)[1:2]<-c('Subject', 'Activity')

## set the frame to a data table so we can use the mean command below with SD
dtMeanStd<- data.table(dfMeanStd)

## lapply so MEAN is run on all columns but the first two
## rolling up by Subject and Activity
dtFinalSet<-dtMeanStd[,lapply(.SD,mean),by="Subject,Activity",.SDcols=3:68]

## write the data with column header, but not row number, to set5.txt as tab-delimited file
write.table(dtFinalSet, "set5.txt", sep="\t", row.names = F, col.names = T)

## done
## read it back to verify (commented out in final version)
## rdt <- read.table("set5.txt", header=T )

