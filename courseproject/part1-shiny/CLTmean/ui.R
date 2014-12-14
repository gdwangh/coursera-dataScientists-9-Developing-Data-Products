shinyUI(fluidPage(
  titlePanel("CLT for Poisson distribution"),
  
  sidebarPanel(
    p("This simulation will:"),
    p("1. generate data randomly for the Poisson distribution with parameter lambda"),
    sliderInput("lambda", label = strong("the Poisson distribution parameter lambda:"),
                min = 1, max = 10, value = 1),
    sliderInput("n", label = strong("number of random values to generate:"),
                min = 1000, max = 10000, value = 1000, step=100),
    br(),
    p("2. show where the distribution is centered at and compare it to the theoretical center of the distribution. They should be near."),
    p("3. Sample from the random values for many times and show the distribution of sample mean."),
    radioButtons("sampleSize", strong("choose the size for sampling from random value:"),
                 choices = c(50,100,500,1000), selected=50, inline=TRUE)       
  ),
  
  mainPanel(
     h4("Poisson Distribution center"),
     p("The random values' center and theoretical centered:"),
     tableOutput("data_center"),
  
     h4("The sampling distribution"),
     p("Estimate mean of sample variable and theory value: "),
     tableOutput("sampleParam"),
     plotOutput("plotSampling",height="300px")
  )
))