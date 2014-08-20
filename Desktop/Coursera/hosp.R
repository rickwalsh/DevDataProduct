setwd("c:/users/rick.walsh/desktop/coursera")
outcome <-read.csv("outcome-of-care-measures.csv", colClasses="character")
outcome <-read.csv("outcome-of-care-measures.csv" )
head(outcome)
ncol(outcome)
nrow(outcome)
sout<-as.numeric(outcome[,7])
sout<- (outcome[,7])
sout
hist(outcome[,11])
outcome
s<-split(outcome,outcome$State)
class(outcome)
class(s$MA)
names(s)
s30<-"Hospital 30-Day Death (Mortality) Rates from Heart Attack"
s1<-s["TX"]
s1[s30]
s30
s1<-split(s$TX,s$s30)
names(outcome)
sState<-"State"
sHA<-"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure" 
"Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"  
s["Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"]
str(s)
df <- data.frame((unlist(s1), byrow=T)
                 unlist(s1)
dfx <-data.frame(unlist(s))

filelist <- lapply(filenames, read.csv, header=TRUE )
df1 = do.call(cbind.data.frame, outcome)
df1
df <- df1[c(sState,sHA)]
df<-df1[c(7,11)]
df
names(df1)
good <- complete.cases(df)
df[1,1]
df
df1[,2]
dfx <- dfx[c("State")]
dfx
ordered <- df[order(newdata2[,2])]
result <- ordered[1,1]
result
class(s)
myvars <- c(sState, sHA)
newdata <- outcome[myvars]
names(newdata)
newdata2 <- subset(newdata, State == "TX" & ) 
newdata2
ordered <- newdata2[order(newdata2[,2],newdata2[,1]),]

best <- function(inState, inDisease){
  
sState<-"State"
sHosp<-"Hospital.Name"
sHA<-"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
sHF<-"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure" 
sPN<-"Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"  

##inDisease<-"pneumonia"
##inState<-"MD"
sDS<-"none"
if (inDisease=="heart attack"){
  sDS<-sHA
}
if (inDisease=="heart failure"){
  sDS<-sHF
}
if (inDisease=="pneumonia"){
  sDS<-sPN
}
if (sDS=="none"){
  stop("invalid outcome")
}

outcome <-read.csv("outcome-of-care-measures.csv", colClasses = "character" )

myvars <- c(sState, sDS, sHosp)
s <- data.frame(character(0), numeric(0), character(0))
s1 <- data.frame(character(0), numeric(0), character(0))
s <- outcome[myvars]
s[,2]<-as.numeric(s[,2])
s1 <- subset(s, State == inState) 
if (nrow(s1)==0){
  stop("invalid state")
}
ordered <- s1[order(s1[,2],s1[,3]),]
x<-as.character(ordered[1,3])
x
}  

ordered
best("TX","heart failure")
best("TX","heart attack")
best("MD","pneumonia")
best("MD","heart attack")
str(ordered[,2])
str(s1)

sampleData <- read.csv("outcome-of-care-measures.csv", header = TRUE, 
                       nrows = 5)
classes <- sapply(sampleData, class)

sampleData <- read.csv("outcome-of-care-measures.csv", header = TRUE, 
 colClasses=c("Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"="numeric"),
 nrows = 5)
"factor"

or just do it after you read the data

dat <- read.csv("kdfjdkf")
apply(sampleData, 11, numeric)

submit()
rankhospital ("TX", "heart failure", 4)
rankhospital ("TX", "heart failure", 1)
rankhospital ("TX", "heart failure")
rankhospital ("MD", "heart attack", "worst")
rankhospital ("MN", "heart attack", 5400)
rankhospital ("MN", "heart attack", "rick")
rankhospital ("XX", "heart attack", 2)

tail(rankall("heart failure"), 10)
head(rankall("heart attack", 20),10)
tail(rankall("pneumonia", "worst"),3)

