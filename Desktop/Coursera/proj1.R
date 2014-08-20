library(sqldf)
Activity <- read.csv("activity.csv", colClasses = c("numeric", "Date", "numeric"))
ActivitySum1007 <- subset(Activity, date=="2012-10-07")
ActivitySum1008 <- subset(Activity, date=="2012-10-08")
ActivitySum1009 <- subset(Activity, date=="2012-10-09")

dateList<-sqldf('select distinct (date) from Activity order by date  ')
dateList

dateSum<-sqldf('select sum(steps) from Activity where steps is not  null group by date order by date  ')
dateSum
str(dateSum)
hist(dateSum)

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
