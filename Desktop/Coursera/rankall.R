rankall <- function(inDisease, inNum = "best"){
  
  sState<-"State"
  sHosp<-"Hospital.Name"
  sHA<-"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
  sHF<-"Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure" 
  sPN<-"Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"  
  
##  inNum = "worst";
##inNum<-20
##  inDisease<-"pneumonia"
##inDisease<-"heart failure
##inDisease<-"heart attack"
##inState<-"MD"
  
  iSort<-0
  decreas_flg = FALSE
  
  if (inNum == "best") {
    iSort = 1;
  }
  if (inNum == "worst") {
    iSort = 1;
    decreas_flg = TRUE
  }
  
  if ( (iSort==0) & (!(is.numeric(inNum) ) ))
      {
      stop ("invalid num") 
      }
  if ( iSort==0) {
      iSort <- inNum
      }

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
  
  xState <- unique(outcome[,7])
  xState <- xState[order(xState)]

  rs <- data.frame(hospital = character(0), state = character(0))
  myvars <- c(sState, sDS, sHosp)
  s <- data.frame(character(0), numeric(0), character(0))
  s1 <- data.frame(character(0), numeric(0), character(0))
  s <- outcome[myvars]
  s[,2]<-as.numeric(s[,2])

  for (i in seq_along(xState)){
##    print (xState[i])
    s1 <- subset(s, State == xState[i]) 
    if (nrow(s1)==0){
      stop("invalid state")
     }
    ordered <- s1[order(s1[,2],s1[,3],decreasing = decreas_flg),]

    x<-as.character(ordered[iSort,3])
    if (is.na(x)){
      x<-"<NA>"
    }
##    print (x)
##    print (xState[i])
    rs <- rbind(rs, data.frame(  x, xState[i]) )
  }
colnames(rs) <- c("hospital", "state")
rs
}  

