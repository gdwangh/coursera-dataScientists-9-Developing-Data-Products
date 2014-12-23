library(shiny)
library(ggplot2)
library(caret)
load("mortality.RDA")
load("cached_model.RDA")
plotty <- function(counter, subsizee)
{
  if (counter > 0){
    subsize <- subsizee
    subsample <- sample(c(1:156),size = subsize)
    mort_train <- mort[subsample,]
    mort_test <<- mort[-subsample,]
    fit <<- train(Lifexp~.,method="lm",data = mort_train, trControl = trainControl("cv"))
    res <<- predict(fit, newdata = mort_test)
  }
  qplot(x = res,y = mort_test$Lifexp,xlab = "predicted value",ylab = "real value", main = "predicted vs. real life expectancy") + geom_abline(intercept = 0, slope = 1)
}
shinyServer(
  function(input, output) {
    pred <- reactive({predict(fit,newdata = data.frame(Lifexp = 0,
                                                       Year = input$birthyear, Race = 0, Gender = 0))})
    output$lifeexp <- renderText({
      pred()
    })
    output$ousrmse <- renderText({
      input$goButton
      isolate(
        sum((res - mort_test$Lifexp)^2)/length(res)
      )
    })
    output$newPlot <- renderPlot({
      input$goButton
      isolate(
        plotty(input$goButton,input$trainsample)
      )
    })
  }
)
