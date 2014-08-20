
pollutantmean <- function(directory, pollutant, id = 1:332) {
  filenames <- list.files(path=directory, full=TRUE, pattern="*.csv")
  filelist <- lapply(filenames, read.csv, header=TRUE )
  df1 = do.call(rbind.data.frame, filelist[id])
  df <- df1[c(pollutant)]
  good <- complete.cases(df)
  dfgood <- df[good,]
  meansvec <- mean(dfgood )
  round (meansvec, digits=3) 
}

filenames <- list.files(path="specdata", full=TRUE, pattern="*.csv")
filelist <- lapply(filenames, read.csv, header=TRUE, nrow=50 )
filelist <- lapply(filenames, read.csv, header=TRUE  )
df = do.call(rbind.data.frame, filelist[1:32])
good <- complete.cases(df)
dfgood <- df[good,][,]
dfgood
df1 <- dfgood[c("ID")]
df1
gd <- df1["ID"] == 5
length (df1[gd,])

for ( i in 1:32 ) {
 gd <- df1["ID"] == i
 print (length (df1[gd,]))
}
}