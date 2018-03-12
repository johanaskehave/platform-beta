output$plot1 <- renderPlotly({


  # Model -------------------------------------------------------------------

  frokostpause <- input$slider0
  vakst <- input$slider01
  elasticitet <- input$slider02
  ledighed <- input$slider03
  holdbarhed <- input$slider04

  output_2025 <- model_2025(frokostpause, vakst, elasticitet, ledighed, holdbarhed)
  output_2060 <- model_2060(frokostpause, vakst, elasticitet, ledighed, holdbarhed)


  # Create plot -------------------------------------------------------------

  y_range <- c(min(output_2025, output_2060, 0), max(output_2060, output_2025, 90000))

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
           paper_bgcolor = 'rgba(255, 255, 255, 0)',
           plot_bgcolor = 'rgba(255, 255, 255, 0)',
           showlegend = FALSE)

})


# Update sliders ----------------------------------------------------------

observeEvent(input$scenario1, {
  updateSliderInput(session, "slider0", value = 1.7)
  updateSliderInput(session, "slider01", value = 1.2)
  updateSliderInput(session, "slider02", value = -7)
  updateSliderInput(session, "slider03", value = 2.0)
  updateSliderInput(session, "slider04", value = 0.4)
})

observeEvent(input$scenario2, {
  updateSliderInput(session, "slider0", value = 2.3)
  updateSliderInput(session, "slider01", value = 1.7)
  updateSliderInput(session, "slider02", value = -5)
  updateSliderInput(session, "slider03", value = 3.1)
  updateSliderInput(session, "slider04", value = 0.6)
})

observeEvent(input$scenario3, {
  updateSliderInput(session, "slider0", value = 2.5)
  updateSliderInput(session, "slider01", value = 2)
  updateSliderInput(session, "slider02", value = -4)
  updateSliderInput(session, "slider03", value = 3.7)
  updateSliderInput(session, "slider04", value = 0.9)
})
