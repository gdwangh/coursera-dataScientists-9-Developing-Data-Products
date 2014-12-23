library(shiny)
require(caret);
require(randomForest);
load("mushrf.RData")
dfkey <- readRDS("demoframes")
mymushpred <- function(odor,spore_print_color,gill_color){
  # take input data as dataframe
  odorkey <- c("almond"="a","anise"="l","creosote"="c","fishy"="y","foul"="f","musty"="m","none"="n","pungent"="p","spicy"="s")
  sporekey <- c("black"="k","brown"="n","buff"="b","chocolate"="h","green"="r","orange"="o","purple"="u","white"="w","yellow"="y")
  gillkey <- c("black"="k","brown"="n","buff"="b","chocolate"="h","gray"="g","green"="r","orange"="o","pink"="p","purple"="u","red"="e","white"="w","yellow"="y")
  X <- data.frame("odor"=odorkey[odor],"spore_print_color"=sporekey[spore_print_color],"gill_color"=gillkey[gill_color])
  Y <- rbind(dfkey,X)
  pred <- predict(modelFit_final,Y[2,])
  if (as.character(pred) == "e"){return("Likely edible. (But eat at your own risk!)")}
  else {return("Likely POISONOUS! Do not eat!")}
}
shinyServer(
  function(input,output){
    output$prediction <- renderPrint({
      mymushpred(input$odor,input$spore_print_color,input$gill_color)
    })
  }
)