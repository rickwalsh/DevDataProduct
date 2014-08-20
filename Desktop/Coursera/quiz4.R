https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv 
## set wd and load data table library
setwd("c://users//rick.walsh//desktop//coursera")
library(data.table)

## create data frame to store data from file
s <-data.frame(date, time, numeric(0), numeric(0), numeric(0),  numeric(0), numeric(0), numeric(0), numeric(0)) 

## load the txt file
acs <-read.table("getdata-data-ss06hid.csv", sep=",", header = TRUE)
getdata-data-GDP
x<-colnames(acs )

nrow(acs)
ncol(acs)
names(acs)
x1<-strsplit(x, "wgtp")

x1[123]
acs


acs <-read.csv("getdata-data-GDP.csv", sep=",", skip=5, nrows=190, header = F)

x<-colnames(acs )

nrow(y)
ncol(acs)
names(acs)
x1<-strsplit(x, "wgtp")

x1[123]
y<-acs$V5
y

y[5:]
y1 
y1<-gsub("," , "", y)
y2<-y1[5:240]
y3<-gsub("\\." , " ", y2)
y4<-y3
y4<-numeric(0)
mean(as.numeric(y1))
[1] 377652.4
y4
class(y3)
