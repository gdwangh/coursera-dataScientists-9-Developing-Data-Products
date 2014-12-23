library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Developing Data Products Project"),
  sidebarPanel(
    selectInput('odor',label='Mushroom odor',choices = list("none","almond","anise","creosote","fishy","foul","musty","pungent","spicy"),selected="none"),
    selectInput('spore_print_color',label='Mushroom spore print color',choices = list("black","brown","buff","chocolate","green","orange","purple","white","yellow"),selected="black"),
    selectInput('gill_color',label='Mushroom gill color',choices = list("black","brown","buff","chocolate","gray","green","orange","pink","purple","red","white","yellow"),selected="black"),
    submitButton("Submit")
  ),
  mainPanel(
    h3("Mushroom toxicity test"),
    h5("The goal here is to predict if a mushroom is toxic based on some of its physical attributes. A random forest tree model was built using the data from the UCI Machine Learning Repository (http://archive.ics.uci.edu/ml/datasets/Mushroom). The top three key attributes are used in this Shiny App. Details of the random forest model can be found in the accompanying Slidify presentation."),
    h5("Based on a random forest model, your mushroom is: "),verbatimTextOutput("prediction")
  )
))
