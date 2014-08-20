setwd("c://users//rick.walsh//desktop//coursera//proj2")
library(data.table)
file <- "getdata-data-ss06hid.csv"

## load the txt file
acx <-read.csv(file, header = TRUE)
head(acx)
greater than 10 acres who sold more than $10,000 worth of agriculture products
ACR=3 AGS=6
agricultureLogical1<-acx$ACR == 1 & acx$AGS == 6

hello <-read.csv(file, header = TRUE)
head(hello)
k<-which(with(hello, ACR == 3 & AGS == 6  ))
k<-which(with(hello, ACR == 1   ))
head(k)
class(k)
head(agricultureLogical1)

class(agricultureLogical1)
agricultureLogical<- subset(ac, ACR == 1 & AGS == 6)
a1<- subset(ac,  AGS == 6 && ACR == 1)
a2<- ac$AGS == 6 
& ac$ACR == 1
a2
which(a2)
ac[125,"ACR"]
y<-(acs$ACR == 1 && acs$AGS == 6)

y<-which(acs$ACR == 1 & acs$AGS == 6)
class(y)
head(y)
which (y)
class(x)
X$ags
head(y)
x<-sqldf("select pwgtp1 from acs where AGEP < 50")
x$AGS
?which

install.packages("jpeg")  ## if necessary

library(jpeg)
fj<-"https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
dfile<-"jeff.jpg"
download.file(fj,dfile,mode='wb')
img <- readJPEG( dfile, native=TRUE)
quantile(img,probs=c(.3,.8))

f1<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
f2<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
dfile1<-"FGDP.csv"
dfile2<-"FEDSTATS.csv"
download.file(f1,dfile1,mode='wb')
download.file(f2,dfile2,mode='wb')
head(s1)
s1 <-read.csv(dfile1, header = TRUE, stringsAsFactors=FALSE, skip=4,nrows=190)
##s1 <-read.csv(dfile1, header = TRUE, stringsAsFactors=FALSE, skip=4 )
s2 <-read.csv(dfile2, header = TRUE)
nrow(s1)
nrow(s2)
colnames(s1)[1] <- "CountryCode"
colnames(s1)[5] <- "GDP"
colnames(s1)[2] <- "Rank"
colnames(s2)[3] <- "OECD"
colnames(s2)[3] <- "OECD"
s2$CountryCode
s1
s1$GDP <- as.numeric(gsub(",","", s1$GDP))
s1$GDP          
sx1 <- merge(x = s1, y = s2, by = "CountryCode")
sx1
sx$Rank
head(sx$OECD)
xOECD<-subset(sx, OECD == "High income: OECD");
xNOECD<-subset(sx, OECD == "High income: nonOECD");
High income: nonOECD
head(xOECD$OECD)
nrow(sx)
nrow(xOECD)
nrow(xNOECD)
newsx<-sx[order(-sx$Rank),]
nrow(newsx)
newsx[1:13,c("Short.Name","Rank")]
newsx<-sx[order(-sx$GDP),]
newsx[1:13,c("CountryCode","GDP")]
rank(newsx[1:13,c("Short.Name","GDP")])
mean(xOECD$Rank)
mean(xNOECD$Rank)
xOECD<-subset(newsx, OECD == "High income: OECD");
head(xOECD$OECD)
newsx<-sx[order(-sx$GDP),]
newsx
xRank <- rank(sx[order(-sx$GDP),])
xRank

newsx[1:13,c("CountryCode","GDP")]
rank(newsx[13,c("CountryCode","GDP")])
colnames(s1)[3] <- "GDP"

colnames(s1)[3] <-"OECD"
"High income: OECD"
newsx[1:13,c( "GDP")]
rank(newsx[13,c( "GDP")])


nrow(newsx)
nrow(sx)
newsx[,c("CountryCode","GDP")]
sx[,c("CountryCode","GDP")]

s2 <-read.csv(dfile2, header = TRUE)
colnames(s2)[3] <-"OECD"
head(s2)
table(s2$OECD %in% c("High income: nonOECD", "High income: OECD"))
sx$RankGroup = cut(sx$Rank,breaks=(quantile(sx$Rank)))
sx$RankGroup2 = cut2(sx$Rank,g=5)

sx$RankGroup = cut(sx$Rank,breaks=(quantile(sx$Rank)), probs = seq(0, 1, by = 0.20))
breaks, labels=c("1","2","3","4","5")
sx$RankGroup2
table(sx$RankGroup2,sx$OECD)
sx["Income Group"]
head(sx)
colnames(s2)[3] <- "OECD"
help(quantile)
install.packages("Hmisc")
library(Hmisc)
l