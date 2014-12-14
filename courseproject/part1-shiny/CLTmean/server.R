library(ggplot2)

shinyServer(
  function(input, output) {
    rand_data <- reactive({
      matrix(rpois(input$n * as.integer(input$sampleSize), input$lambda), input$n)
    })
    
    output$data_center <- renderTable({
      data.frame(estimate=c(mean(rand_data())), theory=c(input$lambda), row.names=c("mean"))
      
    })
        
    output$plotSampling<-renderPlot({ 
      avg<-apply(rand_data(), 1, mean)
      miu<-mean(avg)
      SE_mean<-sd(avg)
      
      wide<-sqrt(input$lambda/10)*3
      g_mean <- ggplot(data.frame(avg), aes(x = avg))
      g_mean <- g_mean + labs(title = paste('mean = ', round(miu,4),", SE = ", round(SE_mean,4)))
      g_mean <- g_mean + labs(x="sample mean")
      g_mean <- g_mean + xlim(miu-wide, miu+wide)
      g_mean <- g_mean + geom_histogram(fill = "salmon",binwidth =wide/40,aes(y = ..density..), colour = "black")
      g_mean <- g_mean + geom_density(size = 1) + geom_vline(xintercept = miu, color="blue",size =1)
      g_mean
    })
    
    output$sampleParam<-renderTable ({
      avg<-apply(rand_data(), 1, mean)
      
      estimate <- c(mean = mean(avg), SE_mean = sd(avg))
      theory<-c(mean = input$lambda, SE_mean = sqrt(input$lambda/as.integer(input$sampleSize)))
      cbind(estimate, theory)
    })
  }
)