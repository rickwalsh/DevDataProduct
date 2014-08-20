#
# Shiny app for Data Products Coursera
# Rick Walsh 7/15/2014
# ui.R

# set up a Page With Sidebar
# include the Help documentation as required
# include a slider for year
# include check boxes for mean and median
#
# App uses the Lahman database of baseball stats
#
library(shiny)
library(shinyapps)

shinyUI(pageWithSidebar(
  headerPanel("Major League Baseball Batting Averages by Year"),
  sidebarPanel(
    helpText(
      "The diagram is a density plot histogram of the batting averages for players ",
      "with over 200 at bats in the selected year.",
      "",
      "Use the slider bar to select a year between 1950 and 2012. ",
      "",
      "To see the mean and median values with a red or blue line, ",
      "check the box for each.",
      "",
      "The data is from the Lahman database of Major League Baseball statistics.",
      ""
    ),
    sliderInput('inYear', 'Select a Year: ',value = 1980, min = 1950, max = 2012, 
                format = "####", step =1)
   ,
       
    checkboxInput(inputId = "showAvg",
                  label ="Show Average Batting Average (RED) ",
                  value = FALSE) 
   ,
   checkboxInput(inputId = "showMed",
                 label ="Show Median Batting Average (BLUE) ",
                 value = FALSE)    ),
  mainPanel(
    plotOutput('myHist')
  )
))
