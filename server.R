#
# Shiny app for Data Products Coursera
# Rick Walsh 7/15/2014
# server.R

# read the data from Lahman
# Subset the data by year from slider value
# if box is checked show line for median and/or mean
# show a histogram of the data
#

library(Lahman)
data(Batting)

# subset for players with 200 or more AB per season
sBatting <-subset(Batting, AB >= 200 )

# add an AVERAGE column dividing Hits by At Bats times 1000
sBatting$avg <-  1000 * round (sBatting$H / sBatting$AB , 3) 

#use this for locating the stat strings
yLoc <- .017

shinyServer(
  function(input, output) {
     output$myHist <- renderPlot({
       
       # get the year selected
       inYear <- input$inYear
       
       # subset the data by year
       sBattingDisp <- subset (sBatting, yearID==inYear)
       
       # calculate average value of the batting averages
       # along with median
       avgDisp <- round(mean(sBattingDisp$avg),0)
       medDisp <- round(median(sBattingDisp$avg),0)
       
       # draw a histogram of the data
       hist(sBattingDisp$avg, xlab='Batting Average (.000 times 1000)', col='lightblue', 
          xlim=c(150,400), ylim=c(0,.02), breaks=15, main=paste('Year ', inYear), freq=FALSE)
       
       # if the checkbox for Avg is selected draw a red line at the average
       if (input$showAvg==TRUE){
          lines(c(avgDisp, avgDisp), c(0, .01),col="red",lwd=5)
       }
       # if the checkbox for Median is selected draw a blue line at the median
       if (input$showMed==TRUE){
        lines(c(medDisp, medDisp), c(.01, .02),col="blue",lwd=5)
       }
      
       # show the minimum, maximum, stdev, average and median for the year selected
       text(350, yLoc-0.002, paste("Min = ", min(sBattingDisp$avg)))
       text(350, yLoc-0.002*2, paste("Max = ", max(sBattingDisp$avg)))
       text(350, yLoc-0.002*3, paste("StdDev = ", round(sd(sBattingDisp$avg),1)   ))
       text(350, yLoc-0.002*4, paste("Avg (RED) = ", avgDisp))
       text(350, yLoc-0.002*5, paste("Median (BLUE) = ", medDisp))
      })
      }
)

