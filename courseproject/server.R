shinyServer(
  function(input, output) {
    rand_data <- reactive({
      rpois(input$n, input$lambda)
    })
    
    output$data_center <- renderPrint({
      mean(rand_data())
    })
    
    output$theroy<- renderPrint({
      input$lambda
    })
    
    output$plotSampleMean<-renderPlot({ 
      avg<-rep(NA,5000)
      for (i in 1:5000) {
        sdata<-sample(x=rand_data(),size=input$sampleSize)
        avg[i]<-mean(sdata)
      }
      
      miu<-mean(avg)
      S<-sd(avg)
      g <- ggplot(data.frame(avg), aes(x = avg))
      g <- g + labs(title = paste('mean = ', miu,", sample Size=",input$sampleSize))
      g <- g + labs(x="sample mean")
      g <- g + geom_histogram(fill = "salmon",binwidth =0.2*S,aes(y = ..density..), colour = "black")
      g <- g + geom_density(size = 1) + geom_vline(xintercept = miu, color="blue",size =1)
      g
    })
  }
)