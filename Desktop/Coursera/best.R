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