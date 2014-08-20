# 
# library(Lahman)
# data(Batting)
# sBatting <-subset(Batting, AB >= 300 )
# sBatting$avg <- 1000* sBatting$H / sBatting$AB  
# 
# shinyServer(
#   function(input, output) {
#     text(63, 150, 'here')
# 
#     sBatting <-subset(Batting, AB >= 300 )
#     sBatting$avg <- 1000* sBatting$H / sBatting$AB  
#     
# #      sBattingDisp<-subset(sBatting,  yearID==input$Year )
#       sBattingDisp<-subset(sBatting,  yearID==1968 )
#       output$myHist <- renderPlot({
#       hist(sBattingDisp$avg, xlab='Batting Average ', col='lightblue', 
#            xlim=c(150,400), breaks=15, main='Histogram')
# #      mse <- mean((galton$child - mu)^2)
# #      mavg <- mean(sBattingDisp$avg)
# #      lines(c(mavg, mavg), c(0, 200),col="red",lwd=5)
# #      text(63, 150, paste("Min = ", min(sBattingDisp$avg)))
# #      text(63, 140, paste("Max = ", max(sBattingDisp$avg)))
#     })
#     
#   }
# )


library(UsingR)
data(galton)

shinyServer(
  function(input, output) {
    output$myHist <- renderPlot({
      hist(galton$child, xlab='child height', col='lightblue',main='Histogram')
      mu <- 60
      lines(c(mu, mu), c(0, 200),col="red",lwd=5)
      mse <- mean((galton$child - mu)^2)
      text(63, 150, paste("mu = ", mu))
      text(63, 140, paste("MSE = ", round(mse, 2)))
    })
    
  }
)

