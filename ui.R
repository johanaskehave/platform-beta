library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(),
  dashboardSidebar(disable = TRUE),
  dashboardBody(
    
    # Boxes need to be put in a row (or column)
    fluidRow(
      box(plotlyOutput("plot1")),
      
      box(
        title = "Ændre på forudsætningerne nedenfor:",
        sliderInput("slider0", "Øget ugentligt arbejdstid (timer)", min = 0.1, max = +5, value = 2.3, step = 0.1),
        sliderInput("slider01", "Gennemsnitlig årlig vækst (%)", min = -10, max = +10, value = 1.7, step = 0.1),
        sliderInput("slider02", "Eskport priselasticitet (%)", min = -20, max = +20, value = -5, step = 0.1),
        sliderInput("slider03", "Nettoledighed efter år 2020 (%)", min = -20, max = +20, value = 3.1, step = 0.1),
        sliderInput("slider04", "Holdbarhedsindikator (% af BNP)", min = -10, max = +10, value = 0.6, step = 0.1)
      )
    )
    
  )
)



# 1: 50 %
# 2: 10 %
# 3: 25 %
# 4: 15 %

