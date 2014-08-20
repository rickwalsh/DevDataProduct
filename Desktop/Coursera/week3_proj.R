setwd("c://users//rick.walsh//desktop//coursera")

library(data.table)
xTrain <- "X_train.txt"
yTrain <- "y_train.txt"

xTest <- "X_test.txt"
yTest <- "y_test.txt"

features <- "features.txt"
strain <- "subject_train.txt"
stest <- "subject_test.txt"
actlabel<- "activity_labels.txt"

## load the txt file
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
dfactl <- read.table(actlabel)
dfactl  

dfsubjtrain <- read.table(strain)
dfsubjtrain
dfsubjtest <- read.table(stest)
dfsubjtest
[1,]
dffeat <- read.table(features)
dffeat
[561,]
dim(dffeat)
dftrain <- read.table(xTrain)
str(dftrain)  
dftrain
dftrain[2,2]
dftest <- read.table(xTest)
dftest[1,]
dim(dftrain)
dfytrain <- read.table(yTrain)
str(dfytrain)  
dfytrain[1,]
dfytest <- read.table(yTest)
str(dfytest)  
dfytest
[1,]

##dftest <- lapply(as.list(subfold2), function(y) read.table(paste0(getwd(),'/UCI HAR Dataset/test/',y)))
nrow(dftest)
nrow(dftrain)
nrow(dfsubj)
nrow(dfsubjtest)

dfs<-rbind(dfsubjtrain,dfsubjtest)
dfd<-rbind(dftrain,dftest)
dfl<-rbind(dfytrain,dfytest)

df<-cbind(dfs,dfl,dfd)
##df<-cbind(dfs,dfd)
df[31:35,1:3]

dfx <- df[,c(1,2,7,8)]
dfx[1:10,]
df[,c("A","B","E")]


nrow(df)
head(df1)
colnames(df1) <- dffeat[,2]
dffeat[,2]
