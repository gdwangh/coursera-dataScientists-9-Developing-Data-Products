shinyUI(fluidPage(
  titlePanel("Most harmful weather events"),
  sidebarPanel(
    p("The basic goal of this anaylse is to explore the NOAA Storm Database and answer which type of severe weather events can cause public health and economic problems for communities and municipalities most."),
    br(),
    radioButtons(inputId="harmType",label=strong("choose the type:"),
                 choices=c("population harmed (FATALITIES+INJURIES)" = "population",
                         "economic cost (PROPDMG+CROPDMG)" = "economic"),
                  selected="population"
                ),
    sliderInput("topn", label = strong("choose the N to display top N harmful event type:"),
                min = 1, max = 10, value = 3, step=1)
  ),
  mainPanel(
    h3("Top N event types"),
    fluidRow(
      column(6,
             plotOutput("plot_pie")
      ),
      column(6, 
             p("Across the United States, top N most harmful event types are: "),
             tableOutput("table_topEventType")
            )
    ),
    
    h3("The Top3 event types influence to different state"),
    p("In different states, TopN harmful event types have different respect"),
    plotOutput("plot_state")
  )
))