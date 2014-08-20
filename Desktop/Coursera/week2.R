
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


