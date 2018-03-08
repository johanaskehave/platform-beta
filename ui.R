library(shiny)
library(shinydashboard)
library(plotly)

ui <- dashboardPage(
  dashboardHeader(),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Case beskrivelse", tabName = "case", icon = icon("dashboard")),
      menuItem("Playground", tabName = "playground", icon = icon("dashboard"))
    )
  ),
  
  dashboardBody(
    tabItems(
      
      
      # Case --------------------------------------------------------------------
      
      tabItem(tabName = "case", source(file.path("ui", "ui_case.R"), local = TRUE)$value),
      
      
      # Playground --------------------------------------------------------------
      
      tabItem(tabName = "playground", source(file.path("ui", "ui_playground.R"), local = TRUE)$value)
      
    )
  )
)

