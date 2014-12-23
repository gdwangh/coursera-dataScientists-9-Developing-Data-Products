shinyUI(
  tabsetPanel(
    tabPanel("Application",
             pageWithSidebar(
               headerPanel("Prediction life expactancy!"),
               sidebarPanel(
                 sliderInput("trainsample",label = "Number of observations in train",value = 100, min = 50,max = 150, step =1),
                 actionButton("goButton", "Train model"),
                 p(),
                 numericInput("birthyear",label = "Enter your birth year:", value = 2000, min = 1970, max = 2050, step = 1),
                 p(),
                 tags$b("Life expectancy, years:"),
                 verbatimTextOutput("lifeexp"),
                 tags$b("Out of sample RMSE"),
                 verbatimTextOutput("ousrmse")
               ),
               mainPanel(
                 plotOutput("newPlot")
               )
             )
    ),
    tabPanel("About",fluidPage(
      mainPanel(includeMarkdown("instructions.md"))
    )
    )
  )
)