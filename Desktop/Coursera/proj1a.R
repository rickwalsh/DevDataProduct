library(sqldf)
Activity <- read.csv("activity.csv", colClasses = c("numeric", "Date", "numeric"))

dateList<-sqldf('select distinct (date) from Activity where steps is not null order by date  ')
dateList

dateSum<-sqldf('select sum(steps) as Steps from Activity where steps is not null group by date order by date  ')
hist(dateSum)

m <- data.frame(c(  "Date", "numeric(0)", "numeric(0)"))
m

dateSum<-sqldf('select sum(steps) from Activity where steps is not null group by date order by date  ')


n1 <- data.frame(StepDate = date, StepMean= numeric(0), StepMedian= numeric(0),stringsAsFactors=FALSE)
n2 <- data.frame(StepDate = date, StepMean= "numeric(0)", StepMedian= "numeric(0)",stringsAsFactors=FALSE)
str(n2 )
df1<-sqldf('select date, avg(steps), median(steps) from Activity where steps is not null group by date'  )
df1
str(MedianMean)
df<-sqldf('select date, steps from Activity where steps is not null'  )
n2$StepDate<-dateList$date[i]
n2$StepMean <- as.numeric(1)
n2$StepMedian <- as.numeric(2)
ActivityDF$steps
rbind(n1, n2)
n1
n2
i<-41
for (i in dateList) {
  ActivityDF <- subset(df, date==dateList$date[i])
  mean(ActivityDF$steps)
  median(ActivityDF$steps)
  rbind(MedianMean, c(dateList$date[i],as.numeric(mean(ActivityDF$steps)),median(ActivityDF$steps)))
}
ActivityDF
c(dateList$date[i],as.numeric(mean(ActivityDF$steps)),median(ActivityDF$steps))

as.numeric(mean(ActivityDF$steps))
str(mean(ActivityDF$steps))
  dActivityDF$steps
Activity [101:110,]
y<-sum(ActivitySum1008$steps,na.rm=TRUE)
y <- na.omit(ActivitySum1008$steps)

df <- df1[c(pollutant)]

good <- complete.cases(ActivitySum1009$steps)
good
df  <- ActivitySum1009$steps[good]
df

plot(Activity$steps~Activity$interval, type="b")
rowSums
y<-sum(ActivitySum1008$steps,na.rm=TRUE)
y
ActivitySum1007$steps
steps <- ActivitySum1008$steps[!is.na(ActivitySum1008$steps)]
sum(steps)
ActivitySum1008$steps
x<-na.omit(ActivitySum1008$steps)
x
sqlds
