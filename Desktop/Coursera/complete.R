complete <- function(directory, id = 1:332) {
  filenames <- list.files(path=directory, full=TRUE, pattern="*.csv")
  filelist <- lapply(filenames, read.csv, header=TRUE  )
  df = do.call(rbind.data.frame, filelist[id])
  good <- complete.cases(df)
  dfgood <- df[good,][,]
  df1 <- dfgood[c("ID")]
  mydata=data.frame(id=numeric(0),nobs=numeric(0))
  j<-1
  for ( i in id ) {  
    gd <- df1["ID"] == i
    mydata[j,1] <- i
    mydata[j,2] <- length (df1[gd,])
    j<-j+1
  }
  mydata
}
