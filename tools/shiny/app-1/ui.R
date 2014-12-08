shinyUI(fluidPage(
  titlePanel("My Shiny App"),
  sidebarLayout(
    sidebarPanel(
      h2("Installation"),
      p("Shiny is available on CRAN, so you can install it in the usual way from your R console:"),

      code('install.package("shiny")'),
      br(),
      br(),
      br(),
      br(),
      p(img(src="bigorb.png", height = 40, width = 40), "shiny is a product of ",
        a(href="http://www.rstudio.com/", span("Rstudio",style="color:blue"))
      )
    ),
    mainPanel(
      h1("Introducting shiny"),
      p("Shiny is a new package from Rstudio that makes it", em(" creditly easy"),
        " to build interactive web applications with R."),
      br(),
      p("For an introduction and live examples, visit the",
        a(href="http://shiny.rstudio.com", "Shiny homepage",style="color:blue")),
      br(),
      h1("Features"),
      p("* Build useful web application with only a few lines of code - no javascript required."),
      p("* Shiny applications are automatically \"live\" in the same way that", strong(" spreadsheets "), 
        "are live. Outputs change instantly as users modify inputs, without requiring a reload of the browser.")
    )
  )
))
