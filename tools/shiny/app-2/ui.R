# ui.R

shinyUI(fluidPage(
  titlePanel("censusVis"),
  
  sidebarPanel(
    p("Create demographic maps with internation from the 2010 US census."),
    selectInput("var", label = strong("Choose a variable to display:"), 
                choices = list("Percent white", "Percent Black","Percent Hispanic", "Percent Asian"), 
                selected = "Percent white"),
    sliderInput("slider1", label = strong("Range of interest:"),
                min = 0, max = 100, value = 100)
  ),
  
  mainPanel(
    # Outputs excluded for brevity 
  )
))
