# shinyUI(pageWithSidebar(
#   headerPanel("Example plot"),
#   sidebarPanel(
#     sliderInput('mu', 'Guess at the mean',value = 70, min = 62, max = 74, step = 0.05,)
#   ),
#   mainPanel(
#     plotOutput('newHist')
#   )
# ))

shinyUI(pageWithSidebar(
  headerPanel("Example plot"),
  sidebarPanel(
    sliderInput('mu', 'Guess at the mu',value = 70, min = 60, max = 80, step = 0.05,)
  ),
  mainPanel(
    plotOutput('myHist')
  )
))
