library(shiny)
library(shinydashboard)
library(plotly)

model_2025 <- function(frokostpause, vakst, elasticitet, ledighed, holdbarhed){
  round(frokostpause * (vakst * 0.5 + elasticitet * 0.1 + ledighed * 0.25 + holdbarhed * 1.5) * 9876.543,0)
}

model_2060 <- function(frokostpause, vakst, elasticitet, ledighed, holdbarhed){
  round(round(frokostpause * (vakst * 0.5 + elasticitet * 0.1 + ledighed * 0.25 + holdbarhed * 1.5) * 11379.5 - 50, digits = -2),0)
}

#model_2025(frokostpause = 2, vakst = 1.7, elasticitet = -5, ledighed = 3.1, holdbarhed = 0.6)
#model_2060(frokostpause = 2.3, vakst = 1.7, elasticitet = -5, ledighed = 3.1, holdbarhed = 0.6)

server <- function(session, input, output) {
  
  set.seed(122)
  histdata <- rnorm(500)
  
  output$plot1 <- renderPlotly({
    
    frokostpause <- input$slider0
    vakst <- input$slider01
    elasticitet <- input$slider02
    ledighed <- input$slider03
    holdbarhed <- input$slider04
    
    output_2025 <- model_2025(frokostpause, vakst, elasticitet, ledighed, holdbarhed)
    output_2060 <- model_2060(frokostpause, vakst, elasticitet, ledighed, holdbarhed)
    
    y_range <- c(min(output_2025, output_2060, 0), max(output_2060, output_2025, 75000))
    
    x <- c("År 2025", "År 2060")
    y <- c(output_2025, output_2060)
    bar1 <- c(output_2025,0)
    bar2 <- c(0, output_2060)
    data <- data.frame(x, bar1, bar2)
    data$x <- factor(data$x, levels = data[["x"]])
    
    plot_ly(data, 
            x = ~x, 
            y = ~bar1, type = 'bar', 
            text = format(y, nsmall = 0, big.mark = ","), 
            textposition = 'auto', 
            textfont = list(color = 'rgba(245, 246, 249, 1)', size = 14),
            hoverinfo= 'none',
            marker = list(color = 'rgba(55, 128, 191, 0.7)', line = list(color = 'rgba(55, 128, 191, 0.7)', width = 2))) %>%
      
      add_trace(y = ~bar2, 
                text = format(y, nsmall = 0, big.mark = ","), 
                textposition = 'auto', 
                textfont = list(color = 'rgba(245, 246, 249, 1)', size = 14), 
                marker = list(color = 'rgba(50, 171, 96, 0.7)', line = list(color = 'rgba(50, 171, 96, 1.0)', width = 2))
      ) %>%
      layout(title = "",
             xaxis = list(title = ""),
             yaxis = list(title = "Privat beskæftigelse (antal personer)", range = y_range),
             barmode = 'stack',
             paper_bgcolor = 'rgba(245, 246, 249, 1)',
             plot_bgcolor = 'rgba(245, 246, 249, 1)',
             showlegend = FALSE) 
    
  })
  
}


