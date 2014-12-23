# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#
library(shiny)
library(ggplot2)
gordonGrowthModel <- function (dividend,growthrate,discountrate)
{
  dividend * (1+growthrate)/(discountrate-growthrate)
}
shinyServer(function(input, output) {
  output$price<- renderText({
    if(input$growthrate > input$discountrate)
    {
      return("Invalid model input. Growth rate cannot exceed discount rate!")
    }
    price <- gordonGrowthModel(input$dividend,input$growthrate/100,input$discountrate/100)
    priceStr <- sprintf("$ %3.2f", price)
    paste("Share price is ",priceStr)
  })
})
