
# load libraries for sql and lattice plots
library(sqldf)
library(lattice)

# read the csv data from disk
Activity <- read.csv("activity.csv", colClasses = c("numeric", "Date", "numeric"))

# use sqldf to return the not null step values
# grouped by date
dateSum<-sqldf('select sum(steps) as Steps from Activity where steps is not null group by date order by date  ')

# display a histogram of the step data
# sql above elimates any NA values from consideration
hist(dateSum$Steps,  xlab='Count of Steps by Day', main="Histogram of Steps")

# determine mean and median of steps per day
median(dateSum$Steps)
mean(dateSum$Steps)

# next we need average steps taken per 5 minute interval across all days
# sql below provides a df with step count, grouped by interval in a df
# sql divides sum by count for an average value per interval
## sqldf('select sum(steps) sumsteps, interval from Activity where steps is not null group by interval order by sumsteps asc ')
timeSum<-sqldf('select interval, sum(steps) / count(*) as AvgSteps from Activity where steps is not null group by interval order by interval  ')

# now create time series line plot of average step count per interval
plot(timeSum, ylab="Steps", xlab="Interval", main="Average Steps per Interval",type = "l")

# next the interval with max steps
# sql will order with highest number first per DESC keyword
maxSteps <-sqldf('select interval, sum(steps) as Steps from Activity where steps is not null group by interval order by Steps desc  ')

# max interval is 835, with step count 10927
maxSteps$interval[1]
maxSteps$Steps[1]

# now find the count of NA values
naList <-sqldf('select count(*) as naSteps from Activity where steps is null   ')

# 2304 NA values found
naList

# strategy is to iterate through the data set
# and for each NA, assume the average of that interval
# and update the dataset with that value
for (i in 1:nrow(Activity))
{
  # if NA
  if (is.na(Activity$steps[i])) {
    # extract the interval, subset on df with average value for that interval
    # and set the number of steps to that average value
    tInterval <- Activity$interval[i]
    ttimeSum <- subset(timeSum, interval==tInterval)
    Activity$steps[i] <- ttimeSum$AvgSteps
  }
}

# now Activity df has no NA's
# write it out to disk
write.csv(Activity, file = "ActivityImpute.csv",   row.names=FALSE)

# read the data into new df
ActivityImpute <- read.csv("ActivityImpute.csv", colClasses = c("numeric", "Date", "numeric"))

# use sqldf to return the not null step values
# grouped by date
dateSum<-sqldf('select sum(steps) as Steps from ActivityImpute where steps is not null group by date order by date  ')

# display a histogram of the step data
# sql above elimates any NA values from consideration
hist(dateSum$Steps,  xlab='Count of Steps by Day', main="Histogram of Steps with no NA")

# determine mean and median of steps per day
median(dateSum$Steps)
mean(dateSum$Steps)

# using sqldf here and for other transformation below
# select the dates from the file for the weekday calculation  
dateList<-sqldf('select distinct (date), " " as weekday from ActivityImpute where steps is not null order by date  ')

# define vector to map to POSIXlt call
wd = c("Weekend","Weekend","Weekday","Weekday","Weekday","Weekday","Weekday")

# iterate through list of dates, get the 0-6 and add 1 to map as 1-7
# then use the vector above to set as weekday or weekend in the df
for(i in 1:nrow(dateList)){
  dateList$weekday[i] <- wd[as.POSIXlt(dateList$date[i])$wday+1]
}

# now merge the Activity data set with the dateList
# so my new data set has weekday/weekend included
wdActivity <- merge(ActivityImpute, dateList, by="date")

# select data by interval, weekday/weekend flag, and average steps
wkSteps <-sqldf('select interval, weekday, sum(steps) / count(*) as Steps from wdActivity group by interval, weekday ')
wkSteps[1:10,]

# plot data by weekend/weekday flag as required
xyplot(Steps ~ interval | weekday, wkSteps,  type = "l" )

