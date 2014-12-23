---
title       : Electricity_Total Cost
subtitle    : Slidify my Shiny App
author      : srngit
job         : 
  framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---
  
## Brief about the Shiny App
  
1. This application is made to demonstrate Shiny application 

2. This Application is for "Electricity' generators using Coal as fuel. 

3. Given a set of parameters, the application calculated the total cost of Elecetricity in Cents/Units.

--- .class #id 

## Electricity Cost 

1. Fuel Cost of Electricity Generations is a function of Heat Rate and the Quality of the fuel. 

2. Heat Rate :  Generation station's efficiency is determined by Heat Rate ( Kacal/Unit) defined as the heat requirement of the Generation system in producing a unit of electricity (kwh).

3. Quality or the heat value of coal is given in terms of Gross Calorific Value (GCV) - Kcal/kg

4. Coal Required = Heat Rate/GCV

--- .class #id 

## Application of Shiny App 

1. Electricity Generators face a dynamic issue of producing at lowest cost given a portfolio of assets/plants having different efficieninces(Heat Rate) Heat the choice  how much the in Develoing EcFuel Cost of Electricity.

2. Electricity prices are also dynamic in nature, with rates changing even during the day. 

3. Given a set of parameters, such as the Heat Rate of the plant and the Cost of Domestic and Imported fuels, 

--- .class #id 

## Input Parameters

1. Following are the input parameters :

- Heat Rate
- Fuel Mix
- Cost of Domestic Fuel
- Cost of Imported Fuel

2. Heat Rates typically range from 2,200 and 2,800 Kcal/Unit which is the range within which user can slide.   

3. GCV of Imported coal is set at 5,400 and while GCV of Domestic coal is set at 3,600 in the application.

4. Cost of Domestic Coal Ranges from $40-60 per ton while Import coal cost anywhere in the range $70-100 per ton. Users can change the values within the above ranges.  

--- .class #id 

## How to Use

1. Application is simple and easy to use.

2. For any modification, users nned o have RStudio installed.

3. Please download the application files from the following link. There will be two files - ui.R and server.R ; Please keep both files in single folder.

4. Once you downloaded files, please set the working directory to the folder using:


```r
setwd("your folder path")
```

5. In RStudio's console, simply run the command at the > prompt.


```r
runApp()
```
