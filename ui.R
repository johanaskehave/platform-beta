library(shiny)
library(shinydashboard)
library(plotly)

ui <- dashboardPage(
  dashboardHeader(title = "Platform beta"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("About", tabName = "about", icon = icon("dashboard")),
      menuItem("Case description", tabName = "case", icon = icon("dashboard")),
      menuItem("Playground", tabName = "playground", icon = icon("dashboard"))
    )
  ),
  
  dashboardBody(
    tabItems(
      
      
      # About -------------------------------------------------------------------
      
      tabItem(tabName = "about", source(file.path("ui", "ui_about.R"), local = TRUE)$value),
      
      
      # Case --------------------------------------------------------------------
      
      tabItem(tabName = "case", source(file.path("ui", "ui_case.R"), local = TRUE)$value),
      
      
      # Playground --------------------------------------------------------------
      
      tabItem(tabName = "playground", source(file.path("ui", "ui_playground.R"), local = TRUE)$value)
      
    )
  )
)

