
library(sqldf)
library(ggplot2)
library(plyr)
library(reshape2)
## read in the data, skipping colums not needed for analysis via colClasses
storm <- read.csv("repdata-data-StormData.csv.bz2", header = TRUE, comment.char="",  fileEncoding = "ISO-8859-15", 
            colClasses=c("NULL" , NA ,  NA  , "NULL" , NA , NA, NA , NA ,   "NULL" , "NULL"  ,  
                         "NULL", NA , "NULL" ,  "NULL", "NULL", "NULL" , "NULL" , "NULL", "NULL" , 
                         "NULL" , "NULL" , "NULL", NA, NA, NA, NA, NA ,   NA, "NULL" ,  "NULL",
                         "NULL" , "NULL",   "NULL" , "NULL", "NULL", "NULL",  NA ) )

## subset and create DF that includes any event with any fatailies or injuries
stormHealth <- subset(storm, FATALITIES > 0 | INJURIES > 0)

## from that list determine the most frequent Event Types as well as least frequent
healthDF <- sqldf('select count(*) count, EVTYPE  from stormHealth group by EVTYPE having count(*) <= 10 order by count(*) DESC' )
sum(healthDF$count)

healthDF <- sqldf('select count(*) count, EVTYPE  from stormHealth group by EVTYPE having count(*) > 10 order by count(*) DESC' )
sum(healthDF$count)

cDataBad  <- c(
'TORNADO'                  ,'LIGHTNING'                ,'TSTM WIND'                ,'FLASH FLOOD',          
'THUNDERSTORM WIND'        ,'EXCESSIVE HEAT'           ,'HIGH WIND'                ,'FLOOD',                   
'RIP CURRENT'              ,'THUNDERSTORM WINDS'       ,'HAIL'                     ,'AVALANCHE',               
'RIP CURRENTS'             ,'WINTER STORM'             ,'STRONG WIND'              ,'HEAT',                    
'WILDFIRE'                 ,'HEAVY SNOW'               ,'WILD/FOREST FIRE'        ,'HEAVY RAIN',              
'EXTREME COLD'             ,'HIGH WINDS'               ,'ICE STORM'                ,'FOG',                     
'EXTREME COLD/WIND CHILL', 'URBAN/SML STREAM FLD')

cDataGood  <- c(
  'TORNADO'                  ,'LIGHTNING'                ,'THUNDERSTORM WIND'       ,'FLOOD',          
  'THUNDERSTORM WIND'        ,'HEAT'           ,'HIGH WIND'                ,'FLOOD',                   
  'RIP CURRENT'              ,'THUNDERSTORM WIND'       ,'HAIL'                     ,'AVALANCHE',               
  'RIP CURRENT'             ,'WINTER STORM'             ,'HIGH WIND'              ,'HEAT',                    
  'WILDFIRE'                 ,'HEAVY SNOW'               ,'WILDFIRE'        ,'HEAVY RAIN',              
  'EXTREME COLD'             ,'HIGH WIND'               ,'WINTER STORM'                ,'FOG',                     
  'EXTREME COLD', 'URBAN/SML STREAM FLD')

cMap <- cbind(cDataGood, cDataBad)
colnames(cMap) <- c("EVTYPEREPLACE", "EVTYPE")

evtypeDF <- merge (stormHealth, cMap, by="EVTYPE" )
head(evtypeDF)

## from that list determine the most frequent Event Types as well as least frequent
healthDF <- sqldf('select count(*) count, EVTYPEREPLACE  from evtypeDF group by EVTYPEREPLACE having count(*) <= 10 order by count(*) DESC' )
sum(healthDF$count)

healthDF <- sqldf('select count(*) count, EVTYPEREPLACE  from evtypeDF group by EVTYPEREPLACE having count(*) > 10 order by count(*) DESC' )
sum(healthDF$count)
head(healthDF)

df <- data.frame( totalIncidents=numeric(0), numHarm=numeric(0), evtype=character(), stringsAsFactors=FALSE)
i <- 1
## iterate and build DF of total count of incidents, sum of injury+fatality by event type
for (i in 1:nrow(healthDF))
{
  stormHealthSub <- subset(evtypeDF, EVTYPEREPLACE == healthDF[i,"EVTYPEREPLACE"])
  df[i,"totalIncidents"]  <- healthDF[i,"count"]
  df[i,"numHarm"]  <- sum(stormHealthSub$FATALITIES) + sum(stormHealthSub$INJURIES)
  df[i,"totalIncidents"]  <- healthDF[i,"count"]
  df[i,"evtype"]  <- as.character(healthDF[i,"EVTYPEREPLACE"])
}
head(stormHealthSub)

df <- sqldf ('select * from df order by numHarm DESC')
qplot(x=1:8 , y=numHarm, fill=evtype, xlab="Top 8 Event Types", 
      ylab="Total Number of Fatalities and Injuries",  
      data=df[1:8,], geom="bar", stat="identity", position="dodge")

## now damage

## subset and create DF that includes any event with any fatailies or injuries
stormDamage <- subset(storm, PROPDMG > 0 | CROPDMG > 0)
head(stormDamage)

##sqldf ('select REFNUM, PROPDMG from stormDamage where PROPDMGEXP = "B" and PROPDMG > 10 order by PROPDMG desc ')
##sqldf ('select * FROM stormDamage where REFNUM= 581535')

propDF <- merge (stormDamage, cMap, by="EVTYPE" )
head(propDF)

## from that list determine the most frequent Event Types as well as least frequent
damageDF <- sqldf('select count(*) count, EVTYPEREPLACE  from propDF group by EVTYPEREPLACE having count(*) <= 10 order by count(*) DESC' )
sum(damageDF$count)

damageDF <- sqldf('select count(*) count, EVTYPEREPLACE  from propDF group by EVTYPEREPLACE having count(*) > 10 order by count(*) DESC' )
sum(damageDF$count)

dfp <- data.frame(total=numeric(0), avgDamage=numeric(0), damages=numeric(0), evtype=character(), stringsAsFactors=FALSE)
i <- 1
## iterate and build DF of total count of incidents, sum of injury+fatality by event type
for (i in 1:nrow(damageDF))
{
  stormDamageSub <- subset(propDF, EVTYPEREPLACE == damageDF[i,"EVTYPEREPLACE"])
  
  stormDamageSubMBK <- subset(stormDamageSub, EVTYPEREPLACE == damageDF[i,"EVTYPEREPLACE"] & PROPDMGEXP =="K")
  propTotal <- sum(stormDamageSubMBK$PROPDMG)  
  stormDamageSubMBK <- subset(stormDamageSub, EVTYPEREPLACE == damageDF[i,"EVTYPEREPLACE"] & PROPDMGEXP =="M")
  propTotal <- propTotal + sum(stormDamageSubMBK$PROPDMG) * 1000
  stormDamageSubMBK <- subset(stormDamageSub, EVTYPEREPLACE == damageDF[i,"EVTYPEREPLACE"] & PROPDMGEXP =="B")
  propTotal <- propTotal + sum(stormDamageSubMBK$PROPDMG) * 1000000
  
  stormDamageSubMBK <- subset(stormDamageSub, EVTYPEREPLACE == damageDF[i,"EVTYPEREPLACE"] & CROPDMGEXP =="K")
  propTotal <- propTotal + sum(stormDamageSubMBK$CROPDMG)  
  stormDamageSubMBK <- subset(stormDamageSub, EVTYPEREPLACE == damageDF[i,"EVTYPEREPLACE"] & CROPDMGEXP =="M")
  propTotal <- propTotal + sum(stormDamageSubMBK$CROPDMG) * 1000
  stormDamageSubMBK <- subset(stormDamageSub, EVTYPEREPLACE == damageDF[i,"EVTYPEREPLACE"] & CROPDMGEXP =="B")
  propTotal <- propTotal + sum(stormDamageSubMBK$CROPDMG) * 1000000
  dfp[i,"damages"]  <- propTotal / 1000000
  dfp[i,"avgDamage"]  <-  dfp[i,"damages"] / damageDF[i,"count"]
  dfp[i,"total"]  <- i
  dfp[i,"evtype"] <- as.character(damageDF[i,"EVTYPEREPLACE"])
}

dfp <- sqldf ('select * from dfp order by avgdamage DESC')
dfp <- sqldf ('select * from dfp order by damages DESC')

qplot(x=1:8 , y=damages, fill=evtype, xlab="Top 8 Event Types", 
      ylab="Total Damages of Property and Crops (billions)", ylim(-50, 600), 
      data=dfp[1:8,], geom="bar", stat="identity", position="dodge")
qplot(x=1:8  , y=avgDamage, fill=evtype, xlab="Top 8 Event Types", 
      ylab="Average Damages of Property and Crops per Event (billions)", ylim(-50, 600), 
      data=dfp[1:8,], geom="bar", stat="identity", position="dodge")

## end


qplot(x=total , y=avgDamage, fill=evtype, xlab="Top 14 Event Types", 
      ylab="Average Damages of Property and Crops per Event", ylim(-50, 600), 
      data=dfp, geom="bar", stat="identity", position="dodge")
head(stormHealthSub)


df1<-df[1:10,]
evtype
df
nrow(df)
http://www.r-bloggers.com/using-r-barplot-with-ggplot2/
  http://r4stats.com/examples/graphics-ggplot2/



df1<-tapply(evtypeDF$FATALITIES + evtypeDF$INJURIES, evtypeDF$EVTYPEREPLACE, sum, simplify=FALSE)
df1<-tapply(evtypeDF$count, evtypeDF$EVTYPEREPLACE, sum, simplify=FALSE)
 df1$AVALANCHE
df1[2]
dfProperty <- data.frame(RefNum=numeric(0), PropDmgTotal=numeric(0) )
df <- data.frame(matrix(unlist(df1), nrow=30, byrow=F))
subset(evtypeDF, EVTYPEREPLACE == "THUNDERSTORM WIND")
subset(evtypeDF, EVTYPE == "THUNDERSTORM WIND")

healthDF$EVTYPE

## we care about the top 10 most frequent only for analysis
evtypeWork <- healthDF[1:25,]
evtypeDF <- merge (storm, cMap, by="EVTYPE" )
head(evtypeDF)
df1<-tapply(evtypeDF$count, evtypeDF$EVTYPEREPLACE, sum, simplify=FALSE)
unlist(df1)

df <- data.frame(totalIncidents=numeric(0), numHarm=numeric(0), evtype=character(), stringsAsFactors=FALSE)
df2[1:15,] <- unlist(df1)
df <- data.frame(totalIncidents=numeric(0), numHarm=numeric(0), evtype=character(), stringsAsFactors=FALSE)

## iterate and build DF of total count of incidents, sum of injury+fatality by event type
for (i in 1:nrow(evtypeDF))
{
  stormHealthSub <- subset(stormHealth, EVTYPE == evtypeDF[i,"EVTYPE"])
  df[i,"totalIncidents"]  <- evtypeDF[i,"count"]
  df[i,"numHarm"]  <- sum(stormHealthSub$FATALITIES) + sum(stormHealthSub$INJURIES)
  df[i,"evtype"]   <- as.character(evtypeDF[i,"EVTYPE"])
}

female<-c(s[1],s[2],s[3]) 
male<-c(s[4],s[5],s[6]) 
r<-cbind(df$numHarm,df$totalIncidents)  
row.names(r)   <- evtypeDF$EVTYPE

tapply(Orange$circumference,Orange$Tree,mean,simplify=FALSE)
r
## then plot them as a grouped Bar Plot
counts <- table(df$numHarm, df$totalIncidents)

library(lattice)
barchart(Bloodvalue~factor(group),data=yourdata,groups=PatientID)
barchart(totalIncidents~numHarm ,data=df )

barplot(df$totalIncidents, main="Injury", xlab="Position",
        ylab="Entropy", ylim=c(0,10000),  names.arg=df$evtype)
mydata <- data.frame(Barplot1=rbinom(5,16,0.6), Barplot2=rbinom(5,16,0.25),
                     Barplot3=rbinom(5,5,0.25), Barplot4=rbinom(5,16,0.7))
mydata <- data.frame(df,df)
barplot(as.matrix(mydata), main="Interesting", ylab="Total", beside=TRUE, 
        col=terrain.colors(5))
legend(13, 12, c("Label1","Label2","Label3","Label4","Label5"), cex=0.6, 
       fill=terrain.colors(5))
library(ggplot2)
library(plyr)
library(reshape2)
df1<-df[1:10,]
evtype
http://www.r-bloggers.com/using-r-barplot-with-ggplot2/
  http://r4stats.com/examples/graphics-ggplot2/
p1<-qplot(x=c(0,10), y=totalIncidents, fill=evtype,  xlab="Xotal", ylab="Total",
                       data=df1, geom="bar", stat="identity",
                       position="dodge")
p2<-qplot(x=c(0,10), y=numHarm, fill=evtype,  xlab="Xotal", ylab="Total",
          data=df1, geom="bar", stat="identity",
          position="dodge")


stormDamage <- subset(storm, PROPDMG > 0)
evtypeDF <- healthDF[1:10,]
# Create a histogram, assign to "plot1"
plot1 <- qplot(price,data=diamonds,binwidth=1000)

# Create a scatterplot
plot2 <- qplot(carat,price,data=diamonds)
ggplot(df1, aes(posttest) ) +
  +   geom_histogram(color = "white") +
  +   facet_grid(gender ~ .)
multiplot(p1, p2,  cols=2)

nrow(stormDamage)
stormDF <- sqldf('select count(*) count from stormDamage where PROPDMGEXP in ("M","B","K")  ' )
stormDF
stormDF <- sqldf('select count(*) count from stormDamage where PROPDMGEXP not in ("M","B","K")  ' )
stormDF

cf0 <- c('K','M','B')
cf1 <- c(1,1000,1000000)

stormDamage <- subset(storm, PROPDMG > 0 & (PROPDMGEXP == "M" | PROPDMGEXP == "B" | PROPDMGEXP == "K" ))
dfProperty <- data.frame(RefNum=numeric(0), PropDmgTotal=numeric(0) )

for (i in 1:nrow(healthDF))
{
  stormHealthSub <- subset(stormHealth, EVTYPE == healthDF[i,"EVTYPE"])
  df[i,"totalIncidents"]  <- healthDF[i,"count"]
  df[i,"numHarm"]  <- sum(stormHealthSub$FATALITIES) + sum(stormHealthSub$INJURIES)
  df[i,"evtype"]   <- as.character(healthDF[i,"EVTYPE"])
}

for (i in 1:nrow(stormDamage))
{
  if (stormDamage[i, "PROPDMGEXP"] == "B"){
    propFactor <- 1000000  
  } else {  
    if (stormDamage[i, "PROPDMGEXP"] == "M"){
    propFactor <- 1000}
    else {
    propFactor <- 1
    }
  }     
  dfProperty[i,"RefNum"] = stormDamage[i, "REFNUM"]
  dfProperty[i,"PropDmgTotal"] = stormDamage[i, "PROPDMG"] * propFactor
}
storm [ , "PROPDMGEXP"]
stormDamage <- subset(storm, PROPDMG > 0 | CROPDMG > 0)
stormDamage <- subset(storm, CROPDMG > 0)

stormDF <- sqldf('select count(*) count from stormDamage where CROPDMGEXP in ("M","B","K" )  ' )
stormDF
stormDF <- sqldf('select count(*) count from stormDamage where CROPDMGEXP not in ("M","B","K")  ' )
stormDF
stormDF <- sqldf('select CROPDMG, CROPDMGEXP from stormDamage where CROPDMGEXP = ""  ' )

sqldf('select count(*) count, CROPDMGEXP from stormDamage group by CROPDMGEXP ' )

dfNumbers <- data.frame(RefNum=numeric(0), PropDmgTotal=numeric(0), CropDmgTotal=numeric(0) )

for (i in 1:nrow(healthDF))
{
  stormHealthSub <- subset(stormHealth, EVTYPE == healthDF[i,"EVTYPE"])
  df[i,"totalIncidents"]  <- healthDF[i,"count"]
  df[i,"numHarm"]  <- sum(stormHealthSub$FATALITIES) + sum(stormHealthSub$INJURIES)
  df[i,"evtype"]   <- as.character(healthDF[i,"EVTYPE"])
}


healthDF <- sqldf('select count(*) count, EVTYPE  from stormHealth group by EVTYPE having count(*) > 10 order by count(*) DESC' )
sum(healthDF$count)

head(stormDamage)
colnames(stormHealth)
healthDF <- sqldf('select count(*) count, EVTYPE  from stormHealth group by EVTYPE having count(*) <= 10 order by count(*) DESC' )
sum(healthDF$count)

healthDF <- sqldf('select count(*) count, EVTYPE  from stormHealth group by EVTYPE having count(*) > 10 order by count(*) DESC' )
sum(healthDF$count)
healthDF

df <- data.frame(totalIncidents=numeric(0), numHarm=numeric(0), evtype=character(), stringsAsFactors=FALSE)

for (i in 1:nrow(healthDF))
{
  stormHealthSub <- subset(stormHealth, EVTYPE == healthDF[i,"EVTYPE"])
  df[i,"totalIncidents"]  <- healthDF[i,"count"]
  df[i,"numHarm"]  <- sum(stormHealthSub$FATALITIES) + sum(stormHealthSub$INJURIES)
  df[i,"evtype"] <- as.character(healthDF[i,"EVTYPE"])
}



head(df)
str(df)
df
df[1,"count"]  <- 10
head(stormHealthSub)
healthDF <- sqldf('select count(*), EVTYPE  from stormHealth group by EVTYPE order by count(*) DESC' )
healthDF <- sqldf('select count(*), EVTYPE  from stormHealth group by EVTYPE order by count(*) DESC' )

stormHealth <- subset(stormHealth, FATALITIES > 0 | INJURIES > 0)

storm[900000:900050,]
head(stormX)
library(sqldf)BGN_DATE 
sqldf('select count(*), EVTYPE  from stormX where ( FATALITIES > 0 OR INJURIES > 0) group by EVTYPE order by count(*) DESC' )
sqldf('select count(*) from stormX where ( FATALITIES > 0 OR INJURIES > 0)  ' )
sqldf('select count(*) from stormX where ( PROPDMG > 0 OR CROPDMG > 0)  ' )
sqldf('select count(*) from stormX where PROPDMG > 0 and PROPDMGEXP not in ( "M","B", "K" ) ' )
sqldf('select count(*) from stormX where CROPDMG > 0 and CROPDMGEXP  not in ( "M","B", "K" ) ' )

sqldf('select BGN_DATE, EVTYPE, FATALITIES from stormX where STATE="FL" and FATALITIES > 0 order by FATALITIES ASC' )
sqldf('select * from stormX  where BGN_TIME = "0325"  ' )
sqldf('select * from stormX  where PROPDMGEXP = "B"  ' )
sqldf('select * from storm   where REFNUM = "605943"  ' )

stormXEVT <- subset(stormX, FATALITIES > 0 | INJURIES > 0)
stormXSummaryAug9
stormFL3 <- subset(storm, REFNUM == "605943")
stormFL3
nrow(stormX)
unique(storm$PROPDMGEXP)
unique(storm$FATALITIES)
colnames(storm)
