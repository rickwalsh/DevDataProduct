corr <- function(directory, thresh = 0) {
  filenames <- list.files(path=directory, full=TRUE, pattern="*.csv")
  filelist <- lapply(filenames, read.csv, header=TRUE   )
  df = do.call(rbind.data.frame, filelist[1:332])
  good <- complete.cases(df)
  dfgood <- df[good,][,]
  df1 <- dfgood[c("ID")]
  mycor=data.frame(df)
  
  myNum=numeric(0)
  j<-1
  for ( i in 1:332 ) {  
    gd <- df1["ID"] == i
    if (length (df1[gd,]) >= thresh){
      myCorr <- dfgood[gd,]
      myNum[j] <- cor(myCorr$sulfate,myCorr$nitrate)
      j<-j+1
    }
  }
  myNum
}