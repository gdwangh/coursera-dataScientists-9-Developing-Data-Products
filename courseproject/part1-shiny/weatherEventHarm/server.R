library(latticeExtra)
library(maps)
library(choroplethrMaps)

source("wheatherAnalyse.R")
Sys.setlocale('LC_ALL', 'English')
loadAndStat_data()
data(state.regions)

shinyServer(
  function(input, output) {
    output$table_topEventType<-renderTable({    
      data<-switch(input$harmType,
                   "population" = topN_harm_health(input$topn),
                   "economic" = topN_cost(input$topn)
                )
      data
    })
    
    output$plot_pie<-renderPlot({
      if (input$harmType=="population") {
        data<-pie_health(input$topn)
        pie(data$sum, labels=data$valid_type,col=rainbow(length(data$valid_type)), main="FATALITIES & INJURIES")
      }  else {
        data<-pie_cost(input$topn)
        pie(data$sum, labels=data$valid_type,col=rainbow(length(data$valid_type)), main="PROPDMG & CROPDMG")
      }
    })
    
    output$plot_state<-renderPlot({
      if (input$harmType=="population") {
        data<-influnce_health(input$topn)
        mapplot(region~harm_popu|valid_type, data = data,xlab="",map = map("state",plot = FALSE, fill = TRUE), colramp = colorRampPalette(c("blue","red")))
      }  else {
        data<-influnce_cost(input$topn)
        mapplot(region~cost_sum|valid_type, data = data,xlab="", map = map("state",plot = FALSE, fill = TRUE), colramp = colorRampPalette(c("blue","red")))
      }
    })
    
  }
)