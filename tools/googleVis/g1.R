# install
install.packages('googleVis')
install.packages(c("devtools","RJSONIO", "knitr", "shiny", "httpuv"))
library(devtools)
install_github("mages/googleVis")

library(googleVis)
?googleVis
demo(googleVis)
vignette("googleVis")



suppressPackageStartupMessages(library(googleVis))


M <- gvisMotionChart(Fruits, "Fruit", "Year", options = list(width = 600, height = 400))
print(M, "chart")
plot(M)
cat(m$html$chart,file="m.html")


> ## ---- IntensityMap ----
Intensity <- gvisIntensityMap(df)
cat(Intensity$html$chart,file="tools/googleVis/fig/Intensity.html")

