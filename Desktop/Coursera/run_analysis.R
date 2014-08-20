## Rick Walsh 5/15/2014  run_analysis.r

## load library
library(data.table)

## load and unzip the txt file (done up front)
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## read all the files via read.table

## read the subject data
dfSubjTrain <- read.table("subject_train.txt")
dfSubjTest <- read.table("subject_test.txt")

## read the features (measurement names)
dfFeatures <- read.table("features.txt")

## read the measurement data
dfTrainSet <- read.table("X_train.txt")
dfTestSet <- read.table("X_test.txt")

## read the activities
dfTrainLabel <- read.table("y_train.txt")
dfTestLabel <- read.table("y_test.txt")

## row bind Subjects from the Train and Test data sets
dfSubj<-rbind(dfSubjTrain,dfSubjTest)

## row bind Activities from the Train and Test data
dfLabel<-rbind(dfTrainLabel,dfTestLabel)

## convert the 1-6 values for Activity into the strings below
dfLabel$V1 <- factor(dfLabel$V1, levels = c(1,2,3,4,5,6), 
  labels = c("Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying"))

## set up a vector of all the columns that are to be selected -- 66 in all
## these are the Mean and Std columns from the test/train data
colVector <- c(1:6,41:46,81:86,121:126,161:166,201:202,214:215,227:228,
               241:242,253:254,266:271,345:350,424:429,503:504,516:517,
               529:530,542:543)

## the headers are in column 2, set them in dff
## then use the column vector so only the columns 
##for STD and MEAN will be modified
dff <-dfFeatures[,2]
dff <-dff[colVector]

## now scrub the header data
## get rid of () -
## fix typos, etc
dff<-gsub(fixed=TRUE, ")", "", dff)
dff<-gsub(fixed=TRUE, "(", "", dff)
dff<-gsub(fixed=TRUE, "-", "", dff)
dff<-gsub(fixed=TRUE, ")", "", dff)
dff<-gsub(fixed=TRUE, "tBody", "TimeBody", dff)
dff<-gsub(fixed=TRUE, "fBodyBody", "fBody", dff)
dff<-gsub(fixed=TRUE, "fBody", "FrequencyBody", dff)
dff<-gsub(fixed=TRUE, "tGravity", "TimeGravity", dff)
dff<-gsub(fixed=TRUE, "Acc", "Acceleration", dff)
dff<-gsub(fixed=TRUE, "Mag", "Magnitude", dff)
dff<-gsub(fixed=TRUE, "Gyro", "Gyroscope", dff)
dff<-gsub(fixed=TRUE, "std", "Std", dff)
dff<-gsub(fixed=TRUE, "mean", "Mean", dff)

## row bind the Train and Test data sets
dfDataSet<-rbind(dfTrainSet,dfTestSet)

## reset the dataset df to include only the MEAN and STD columns per colVector
dfDataSet<-dfDataSet[,colVector]

## set the headers to the scrubbed headers from above
colnames(dfDataSet)<-dff

## column bind the Subjects, Activities, and Mean and Std data into one set
dfMeanStd<-cbind(dfSubj,dfLabel,dfDataSet)

## add the headers for Subject and Activity in column 1 and 2
colnames(dfMeanStd)[1:2]<-c('Subject', 'Activity')

## set the frame to a data table so we can use the mean command below with SD
dtMeanStd<- data.table(dfMeanStd)

## lapply so MEAN is run on all columns but the first two
## rolling up by Subject and Activity
dtFinalSet<-dtMeanStd[,lapply(.SD,mean),by="Subject,Activity",.SDcols=3:68]

## set data table to data frame for easy sorting
## then sort by Subject, Activity
dfOrder <- data.frame(dtFinalSet)
dfOrder<-dfOrder[with(dfOrder, order(Subject, Activity)),]

## now set back to data table for writing
dtFinalSet <- data.table(dfOrder)

## write the data with column header, but not row number, to set5.txt as tab-delimited file
write.table(dtFinalSet, "set5.txt", sep="\t", row.names = F, col.names = T)

## done


