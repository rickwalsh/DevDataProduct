library(sqldf)
library(lattice)
Activity <- read.csv("activity.csv", colClasses = c("numeric", "Date", "numeric"))
Activity <- read.csv("activityimpute.csv", colClasses = c("numeric", "Date", "numeric"))

dateList<-sqldf('select distinct (date), " " as weekday from Activity where steps is not null order by date  ')
dateList

weekdays(dateList[1,])
as.POSIXlt(dateList$date)$wday+1
weekdays(as.Date(dateList$date))
wd = c("Weekend","Weekend","Weekday","Weekday","Weekday","Weekday","Weekday")

for(i in 1:nrow(dateList)){
  dateList$weekday[i] <- wd[as.POSIXlt(dateList$date[i])$wday+1]
}

head(Activity)
Activity <- timeSum
wdActivity <- merge(Activity,dateList,by="date")
head(wdActivity)

xyplot(steps ~ interval | weekday, wdActivity,  type = "l", group = weekday)

dateSum<-sqldf('select sum(steps) as Steps from Activity where steps is not null group by date order by date  ')
hist(dateSum$Steps)

median(dateSum$Steps)
mean(dateSum$Steps)
sqldf('select sum(steps) sumsteps, interval from Activity where steps is not null   group by interval order by sumsteps asc ')
 
timeSum<-sqldf('select interval, sum(steps) / count(*) as AvgSteps from Activity where steps is not null group by interval order by interval  ')
timeSum
plot(timeSum, ylab="xx", main="yy",type = "l")

maxSteps <-sqldf('select interval, sum(steps) / count(*) as AvgSteps from Activity where steps is not null group by interval order by AvgSteps desc  ')
maxSteps$interval[1]

naList<-sqldf('select count(*) as naSteps from Activity where steps is null   ')
naList

head(Activity)
i<-1
for (i in 1:nrow(Activity))
{
  if (is.na(Activity$steps[i])) {
    tInterval <- Activity$interval[i]
    ttimeSum <- subset(timeSum, interval==tInterval)
    Activity$steps[i] <- ttimeSum$AvgSteps
  }
}

write.csv(Activity, file = "ActivityImpute.csv",   row.names=FALSE)

is.na(Activity$steps[i]) 
tInterval
timeSum[279,0]
ttimeSum
Activity$steps[1:150]
length(Activity)
Activity[1:300,]
subset(timeSum, interval==tInterval)
