install.packages("httr")
library(httr)
install.packages("httpuv")
library(httpuv)
install.packages("jsonlite")
library(jsonlite)
install.packages("sqldf")
library(sqldf)
oauth_endpoints("github")

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. Register an application at https://github.com/settings/applications
#    Insert your values below - if secret is omitted, it will look it up in
#    the GITHUB_CONSUMER_SECRET environmental variable.
#
#    Use http://localhost:1410 as the callback url
myapp <- oauth_app("github", key="30bd21a47060c871b2f2", secret="347495abaafc7bab971e9e3fd9335c39daab0554")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
req <- GET("https://api.github.com/users/jtleek/repos", config(token = github_token))
stop_for_status(req)
json1 <- content(req)
json2 <- jsonlite::fromJSON(toJSON(json1))
json2[,"name"]
req
json1$name="datasharing"
= "datasharing"
class(json2)
x<-subset(json2, name="datasharing")
sdata<-subset(json2, name=="datasharing")
sdata[,"created_at"]


https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv 
## set wd and load data table library
setwd("c://users//rick.walsh//desktop//coursera")
library(data.table)

## create data frame to store data from file
s <-data.frame(date, time, numeric(0), numeric(0), numeric(0),  numeric(0), numeric(0), numeric(0), numeric(0)) 

## load the txt file
acs <-read.table("getdata-data-ss06pid.csv", sep=",", header = TRUE)
acs
x<-sqldf("select pwgtp1 from acs where AGEP < 50")
x[1:20,]
y1<-unique(acs$AGEP)
y2<-sqldf("select distinct AGEP from acs")
y1
x

con = url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode=readLines(con)
close(con)
nchar(htmlCode[10])
nchar(htmlCode[20])
nchar(htmlCode[30])
nchar(htmlCode[100])

ff="getdata-wksst8110.for"
read.fwf(ff, widths, header = FALSE, sep = "\t",
         skip = 0, row.names, col.names, n = -1,
         buffersize = 2000, ...)

records <- read.fwf(ff, widths=c(27,5,31),skip=4)
sum(as.numeric(records[[4:20],2]))
records[[5:10],2]
sum(records[,2])
