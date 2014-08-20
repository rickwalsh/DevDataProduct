storm <- read.csv("repdata-data-StormData.csv.bz2", header = TRUE, nrows=902297, 
                  comment.char="", fileEncoding = "ISO-8859-15")
head(storm)

stormX <- read.csv("repdata-data-StormData.csv.bz2", header = TRUE, comment.char="", 
                   fileEncoding = "ISO-8859-15", nrows=10, 
colClasses=c("NULL" ,   "BGN_DATE" ,  "BGN_TIME"  , "NULL" , "COUNTY" ,    "COUNTYNAME",
"STATE" , "EVTYPE" ,   "NULL" , "NULL"  ,  "NULL", "END_DATE" , 
 "NULL" ,  "NULL", "NULL", "NULL" , "NULL" ,   "NULL", "NULL" ,    "NULL"  ,    "NULL" , 
"NULL"  ,"FATALITIES" ,"INJURIES" , 
 "PROPDMG" ,   "PROPDMGEXP", "CROPDMG" ,   "CROPDMGEXP", "NULL" ,       "NULL",
 "NULL" , "NULL",   "NULL" , "NULL", "NULL", "NULL",  "REFNUM" ) )

stormX <- read.csv("repdata-data-StormData.csv.bz2", header = TRUE, comment.char="", 
                   fileEncoding = "ISO-8859-15", 
            colClasses=c("NULL" ,   NA ,  NA  , "NULL" , NA ,    NA,
                         NA , NA ,   "NULL" , "NULL"  ,  "NULL", NA , 
                                "NULL" ,  "NULL", "NULL", "NULL" , "NULL" ,   "NULL", "NULL" ,    "NULL"  ,    "NULL" , 
                                "NULL"  ,NA ,NA , 
                         NA ,   NA, NA ,   NA, "NULL" ,       "NULL",
                                "NULL" , "NULL",   "NULL" , "NULL", "NULL", "NULL",  NA ) )
storm[900000:900050,]
head(stormX)
library(sqldf)BGN_DATE 
sqldf('select count(*), EVTYPE  from stormX where ( FATALITIES > 0 OR INJURIES > 0) group by EVTYPE order by count(*) DESC' )
sqldf('select count(*)   from stormX where ( FATALITIES > 0 OR INJURIES > 0)  ' )
sqldf('select count(*)   from stormX where ( PROPDMG > 0 OR CROPDMG > 0)  ' )
sqldf('select count(*)   from stormX where PROPDMG > 0 and PROPDMGEXP not in ( "M","B", "K" ) ' )
sqldf('select count(*)   from stormX where CROPDMG > 0 and CROPDMGEXP  not in ( "M","B", "K" ) ' )

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
