library(shiny)
shinyServer(
  function(input, output) {
    TC <- reactive({
      HR <- input$HR
      M <- input$M
      DCC <- input$DCC
      ICC <- input$ICC
      aGCV <- (3600*M + 5400*(1-M))/100
      aCost <- (M*DCC +(1-M)*ICC)/100
      TC <- round(3.0 + (HR/aGCV)*aCost/10, 2)
      print(TC)
    })
    output$HR <- renderPrint({input$HR})
    output$M <- renderPrint({input$M})
    output$DCC <- renderPrint({input$DCC})
    output$ICC <- renderPrint({input$ICC})
    output$TC <- renderPrint({TC()})
  }
)
