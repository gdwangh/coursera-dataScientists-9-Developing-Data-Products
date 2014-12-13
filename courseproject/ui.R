shinyUI(fluidPage(
  titlePanel("Center of Poisson distribution"),
  
  sidebarPanel(
    p("This simulation will:"),
    p("1. generate data randomly for the Poisson distribution with parameter lambda"),
    sliderInput("lambda", label = strong("the Poisson distribution parameter lambda:"),
                min = 1, max = 10, value = 1),
    sliderInput("n", label = strong("number of random values to generate:"),
                min = 10000, max = 100000, value = 10000, step=1000),
    br(),
    p("2. show where the distribution is centered at"),
    p("3. compare it to the theoretical center of the distribution."),
    p("4. Sample from the random values for many times and show the distribution of sample mean."),
    radioButtons("sampleSize", label=strong("Choose sample size:"), 
                 choices = c(40,400,4000), selected=40, inline=TRUE)
                   
  ),
  
  mainPanel(
     h4("Distribution center"),
     p("The random values is centered at:"),
     verbatimTextOutput("data_center"),
     p("The Poisson distribution is center at ",code("lambda")," in theory: "),
     verbatimTextOutput("theroy"),
  
     h4("The distribution of sample mean"),
     plotOutput("plotSampleMean", width="500px",height="300px")
  )
))