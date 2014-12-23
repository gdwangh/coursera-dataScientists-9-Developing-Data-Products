library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Thermal Power - Cost"),
  sidebarPanel(
    sliderInput('HR', 'Heat Rate (Kcal/Unit)', 2600, min=2200, max=2600, step=50),
    sliderInput('M', 'Fuel Mix (Domestic Vs. Imported )', 50, min=0, max=100, step=1),
    p(" "),
    numericInput('DCC', 'Domestic Coal Cost - ($/Ton)', 40, min=40, max=60, step=1),
    p("Input Range: 40-60"),
    p(" "),
    numericInput('ICC', 'Imported Coal Coal - ($/Ton)', 70, min=70, max=100,step=1),
    p("Input Range:70-100"),
    submitButton('Submit')
  ),
  mainPanel(
    h5('Cost Computation'),
    h6('Heat Rate'),
    verbatimTextOutput("HR"),
    h6('Fuel Mix %'),
    verbatimTextOutput("M"),
    h6('Domestic Coal Cost - $/Ton'),
    verbatimTextOutput("DCC"),
    h6('Imported Coal Cost - $/Ton'),
    verbatimTextOutput("ICC"),
    p("You may change any of the above parameters and find the Total Cost here"),
    h5('Total Cost - Cents/Unit'),
    verbatimTextOutput("TC")
  )
))