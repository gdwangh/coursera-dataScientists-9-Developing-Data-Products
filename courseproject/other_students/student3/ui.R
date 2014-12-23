# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#
library(shiny)
require(markdown)
shinyUI(navbarPage("Gordon Growth Model",tabPanel("Documentation",
                                                  includeMarkdown("about.md")
),
tabPanel("Model",
         sidebarLayout(
           sidebarPanel(
             sliderInput("discountrate",
                         "Discount rate (%):",
                         min = 1,
                         max = 20,
                         step = .01,
                         value = 7)
             ,sliderInput("growthrate",
                          "Growth rate (%):",
                          min = 1,
                          max = 20,
                          step = .01,
                          value = 4)
             ,numericInput("dividend", "Dividend at t=0 ($):", min = 1, max = 100, value=4)),
           mainPanel(
             textOutput("price")
           )
         )
)
))
