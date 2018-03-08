# Boxes need to be put in a row (or column)
fluidRow(
  
  column(width = 6,
         wellPanel(style = "background-color: #ffffff;",
                   plotlyOutput("plot1")
         ),
         
         wellPanel(style = "background-color: #ffffff;",
                   h4("Vælg predefinerede scenarier nedenfor:"),
                   actionButton("scenario1", "Scenarie 1"),
                   actionButton("scenario2", "Scenarie 2"),
                   actionButton("scenario3", "Scenarie 3")
                   
         )
  ),
  
  column(width = 6,
         wellPanel(style = "background-color: #ffffff;",
                   title = "Ændre på forudsætningerne nedenfor:",
                   sliderInput("slider0", "Øget ugentligt arbejdstid (timer)", min = 0.1, max = +5, value = 2.3, step = 0.1, animate = animationOptions(interval = 300, loop = TRUE)),
                   sliderInput("slider01", "Gennemsnitlig årlig vækst (%)", min = -10, max = +10, value = 1.7, step = 0.1, animate = animationOptions(interval = 300, loop = TRUE)),
                   sliderInput("slider02", "Eskport priselasticitet (%)", min = -20, max = +20, value = -5, step = 0.1, animate = animationOptions(interval = 300, loop = TRUE)),
                   sliderInput("slider03", "Nettoledighed efter år 2020 (%)", min = -20, max = +20, value = 3.1, step = 0.1, animate = animationOptions(interval = 300, loop = TRUE)),
                   sliderInput("slider04", "Holdbarhedsindikator (% af BNP)", min = -10, max = +10, value = 0.6, step = 0.1, animate = animationOptions(interval = 300, loop = TRUE))
         )
  )
)