install.packages("devtools")
library("devtools")
install_github("ropensci/plotly")

library(plotly)
set_credentials_file("gdwangh", "hoeo43kai9")

py <- plotly()
trace0 <- list(
  x = c(1, 2, 3, 4),
  y = c(10, 15, 13, 17)
)
trace1 <- list(
  x = c(1, 2, 3, 4),
  y = c(16, 5, 11, 9)
)
response <- py$plotly(trace0, trace1, kwargs=list(filename="basic-line", fileopt="overwrite"))
response$url

# Make a plot with ggplot2, as usual: 
ggiris <- qplot(Petal.Width, Sepal.Length, data = iris, color = Species)
ggiris

# Now make this plot interactive and online. 
# To do this, first instantiate a Plotly object: 
py <- plotly()

# And call the ggplotly() method to convert your ggplot2 plot into a Plotly plot: 
r <- py$ggplotly(ggiris)

# Your online, interactive, collaborative plot lives at this URL: 
r$response$url

# I. World Bank plotting with ggplot2

library(plotly)  # Load libraries we’ll be using
library(reshape)

py <- plotly("ggplot2examples", "3gazttckd7")  # Open Plotly connection, use plotly sandbox 

library(WDI)  # Now we’ll make the plot from the blog post

dat = WDI(indicator='NY.GNP.PCAP.CD', country=c('CL','HU','UY'), start=1960, end=2012)
# Grab GNI per capita data for Chile, Hungary and Uruguay

wb <- ggplot(dat, aes(year, NY.GNP.PCAP.CD, color=country)) + geom_line() 
wb <- wb+xlab('Year') + ylab('GDI per capita (Atlas Method USD)') 
wb <- wb+labs(title <- "GNI Per Capita ($USD Atlas Method)")

r<-py$ggplotly(wb)  # Call the ggplotly conversion function
r$response$url
# 
library(IRdisplay)
plotly_iframe <- function(url) {
  # Set width and height from options or default square
  w <- "750"
  h <- "600"
  html <- paste("<center><iframe height=\"", h, "\" id=\"igraph\" scrolling=\"no\" seamless=\"seamless\"\n\t\t\t\tsrc=\"", 
                url, "\" width=\"", w, "\" frameBorder=\"0\"></iframe></center>", sep="")
  return(html)
}

display_html(plotly_iframe(r$response$url))



#  wealth distribution chart . 
require(reshape2)
require(plyr)
require(spdep)
require(igraph)
require(ggplot2)
require(RColorBrewer)

wealth.dist <- structure(
  list(
    CA = c(0.054, 0.442, 0.349, 0.155),  # 2005, family
    FR = c(0.040, 0.440, 0.278, 0.242),  # 2010, adult
    IE = c(0.050, 0.390, 0.330, 0.230),  # 2001, household
    IT = c(0.115, 0.462, 0.301, 0.122),  # 2008, household
    GB = c(0.092, 0.465, 0.318, 0.125),  # 2008, household
    US = c(0.025, 0.265, 0.372, 0.338),  # 2007, family
    BE = c(0.135, 0.373, 0.300, 0.197)), # 1994, family   
  .Names = c("CA", "FR", "IE", "IT", "GB", "US", "BE"), 
  row.names = c("Bottom 50%", "Mid 40%", "Top 9%", "Elite 1%"), 
  class = "data.frame")

wealth.dist <- wealth.dist[,order(wealth.dist[4,])] # order by share 1%

t(wealth.dist*100) # print table

wealth.dist$EQ <- c(0.5, 0.4, 0.09, 0.01)  # add perfectly equal country

# restack data (one rown per combination)
d <- melt(t(wealth.dist))
names(d) <- c("country", "group", "value")
d$group <- factor(d$group, levels = row.names(wealth.dist))
d$country <- factor(d$country, levels = names(wealth.dist))

# plot distributions in stacked barchart
q <- ggplot(d, aes(country, value * 100, fill = group)) + geom_bar(stat = "identity")
q <- q + scale_fill_brewer(palette = "RdYlBu",guide = guide_legend(reverse = TRUE, title = "Groups"))
q <- q + opts(title = "National wealth ownership")
q + scale_x_discrete(name = "Country") + 
  scale_y_continuous(name = "Percentage of wealth owned")
r<-py$ggplotly()



# Scatter plots
dsamp <- diamonds[sample(nrow(diamonds), 1000), ]
d <- qplot(carat, price, data=dsamp, colour=clarity)
py$ggplotly()

