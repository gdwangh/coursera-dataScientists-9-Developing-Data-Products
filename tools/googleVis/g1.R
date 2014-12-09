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


GeoMarker <- gvisGeoChart(Andrew, "LatLong", 
                          sizevar='Speed_kt',
                          colorvar="Pressure_mb", 
                          options=list(region="US"))

cat(GeoMarker$html$chart,file="tools/googleVis/fig/GeoMarker.html")


> ## ---- Table ----
Table <- gvisTable(Stock, formats=list(Value="#,###"))
cat(Table$html$chart,file="tools/googleVis/fig/Table.html")


PopTable <- gvisTable(Population,
                      formats=list(Population="#,###",
                      '% of World Population'='#.#%'),
                      options=list(page='enable'))
cat(PopTable$html$chart,file="tools/googleVis/fig/PopTable.html")


Org <- gvisOrgChart(Regions,
                    options=list(width=600, height=250,
                                 size='large', allowCollapse=TRUE))
cat(Org$html$chart,file="tools/googleVis/fig/Org.html")


Tree <- gvisTreeMap(Regions, "Region", "Parent", "Val", "Fac",options=list(fontSize=16))
cat(Tree$html$chart,file="tools/googleVis/fig/Tree.html")




Anno <- gvisAnnotationChart(Stock,datevar="Date",
                            numvar="Value",
                            idvar="Device",
                            titlevar="Title",
                            annotationvar="Annotation",
                            options=list(
                              width=600, height=350,
                              fill=10, displayExactValues=TRUE,
                              colors="['#0000ff','#00ff00']")
                             )
cat(Anno$html$chart,file="tools/googleVis/fig/Anno.html")
                            
datSK <- data.frame(From=c(rep("A",3), rep("B", 3)),
                    To=c(rep(c("X", "Y", "Z"),2)),Weight=c(5,7,6,2,9,4))

Sankey <- gvisSankey(datSK, from="From", to="To", weight="Weight",
                     options=list( sankey="{link: {color: { fill: '#d799ae' } },
                             node: { color: { fill: '#a61d4c' },
                             label: { color: '#871b47' } }}"))
cat(Sankey$html$chart,file="tools/googleVis/fig/Sankey.html")



Cal <- gvisCalendar(Cairo,datevar="Date",
                     numvar="Temp",
                       options=list(
                         title="Daily temperature in Cairo",
                         height=320,
                         calendar="{yearLabel: { fontName: 'Times-Roman',
                             fontSize: 32, color: '#1A8763', bold: true},
                              cellSize: 10,
                             cellColor: { stroke: 'red', strokeOpacity: 0.2 },
                            focusedCellColor: {stroke:'red'}}")
                     )

cat(Cal$html$chart,file="tools/googleVis/fig/Cal.html")


datTL <- data.frame(Position=c(rep("President", 3), rep("Vice", 3)),
                        Name=c("Washington", "Adams", "Jefferson",
                                "Adams", "Jefferson", "Burr"),
                    start=as.Date(x=rep(c("1789-03-29", "1797-02-03", "1801-02-03"),2)),
                     end=as.Date(x=rep(c("1797-02-03", "1801-02-03",  "1809-02-03"),2)))

Timeline <- gvisTimeline(data=datTL,rowlabel="Name",barlabel="Position",
                            start="start",
                           end="end",
                          options=list(timeline="{groupByRowLabel:false}",
                          backgroundColor='#ffd',
                           height=350,
                           colors="['#cbb69d', '#603913', '#c69c6e']"))
cat(Timeline$html$chart,file="tools/googleVis/fig/Timeline.html")



set.seed(123)

datHist=data.frame(A=rpois(100, 20),B=rpois(100, 5), C=rpois(100, 50))

Hist <- gvisHistogram(datHist, options=list(legend="{ position: 'top', maxLines: 2 }",
 colors="['#5C3292', '#1A8763', '#871B47']",
  width=400, height=360))

cat(Hist$html$chart,file="tools/googleVis/fig/Hist.html")


G <- gvisGeoChart(Exports, "Country", "Profit",options=list(width=300, height=300))

T <- gvisTable(Exports,options=list(width=220, height=300))

GT <- gvisMerge(G,T, horizontal=TRUE)
cat(GT$html$chart,file="tools/googleVis/fig/GT.html")


Geo=gvisGeoMap(Exports, locationvar="Country", numvar="Profit",
               options=list(height=350, dataMode='regions'))

cat(Geo$html$chart,file="tools/googleVis/fig/Geo.html")


AndrewGeo <- gvisGeoMap(Andrew,
                        locationvar="LatLong",
                        numvar="Speed_kt",
                        hovervar="Category",
                        options=list(height=350,
                        region="US",
                        dataMode="markers"))
cat(AndrewGeo$html$chart,file="tools/googleVis/fig/AndrewGeo.html")



AnnoTimeLine  <- gvisAnnotatedTimeLine(Stock,
                                       datevar="Date",
                                       numvar="Value",
                                       idvar="Device",
                                       titlevar="Title",
                                       annotationvar="Annotation",
                                       options=list(displayAnnotations=TRUE,
                                       width="600px", height="350px"))
cat(AnnoTimeLine$html$chart,file="tools/googleVis/fig/AnnoTimeLine.html")


Motion=gvisMotionChart(Fruits,idvar="Fruit",timevar="Year")
cat(Motion$html$chart,file="tools/googleVis/fig/Motion.html")

