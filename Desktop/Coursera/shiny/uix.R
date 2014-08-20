
shinyUI(pageWithSidebar(
  headerPanel("Batting Average"),
  sidebarPanel(
    sliderInput('Year', 'Select a Year between 1950 and 2012',format = "####",
                value = 1980, min = 1950, max = 2012, step=1, round=TRUE)
  ),
  mainPanel(
    plotOutput('myHist')
  )
))
#?sliderInput
