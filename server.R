library(shiny)
library(shinydashboard)
library(plotly)

source(list.files("functions", full.names = TRUE))

server <- function(session, input, output) {
  
  
  # Playground --------------------------------------------------------------
  
  observe({
    source(file.path("server", "svr_playground.R"), local = TRUE)$value
  })
  
  
} # end of server


