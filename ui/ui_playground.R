fluidRow(
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "style.css")
  ),
  column(width = 12,
    column(width = 6,
           wellPanel(class="",style="padding:0px",
                     h1(class="siteTitle","Playground")
           )
    ),
    column(width = 6,
           HTML(
             '<div class="">
                <div class="button"> <i class="fa fa-thumbs-up"></i> Upvote </div>
             </div>'
           )
    )
  ),
  div(class="gap-div"),
  column(width = 12,
  column(width = 6,class="animated bounceInLeft",
         div(class="main-wrap",
                   div(class="gap-div"),
                   plotlyOutput("plot1")
         ),
         div(class="gap-div"),
         div(class="main-wrap",
                   h4("Vælg predefinerede scenarier nedenfor:"),
                   actionButton("scenario1", "Scenarie 1"),
                   actionButton("scenario2", "Scenarie 2"),
                   actionButton("scenario3", "Scenarie 3")
                   
         )
  ),
  
  column(width = 6,class="animated bounceInRight",
         div(class="main-wrap",
                   title = "Ændre på forudsætningerne nedenfor:",
                   sliderInput("slider0", "Øget ugentligt arbejdstid (timer)", min = 0.1, max = +5, value = 2.3, step = 0.1, animate = animationOptions(interval = 600, loop = TRUE)),
                   sliderInput("slider01", "Gennemsnitlig årlig vækst i BNP (%)", min = -10, max = +10, value = 1.7, step = 0.1, animate = animationOptions(interval = 600, loop = TRUE)),
                   sliderInput("slider02", "Eksport priselasticitet (%)", min = -20, max = +20, value = -5, step = 0.1, animate = animationOptions(interval = 600, loop = TRUE)),
                   sliderInput("slider03", "Nettoledighed efter år 2020 (%)", min = -20, max = +20, value = 3.1, step = 0.1, animate = animationOptions(interval = 600, loop = TRUE)),
                   sliderInput("slider04", "Holdbarhedsindikator (% af BNP)", min = -10, max = +10, value = 0.6, step = 0.1, animate = animationOptions(interval = 600, loop = TRUE))
         )
  ),
  column(width = 12, class="animated bounceInUp",
         div(class="gap-div"),
         div(class="gap-div"),
         div(id="disqus_thread", class="main-wrap",
             HTML(
                 "<script>
      (function() {  
          var d = document, s = d.createElement('script');
          
          s.src = 'https://https-johanaskehave-shinyapps-io-platform-beta.disqus.com/embed.js';
          
          s.setAttribute('data-timestamp', +new Date());
          (d.head || d.body).appendChild(s);
      })();
  </script>
  <noscript>Please enable JavaScript to view the <a href='https://disqus.com/?ref_noscript' rel='nofollow'>comments powered by Disqus.</a></noscript>"
               )
           )
  )
  )
)

