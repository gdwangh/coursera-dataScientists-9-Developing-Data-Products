## Create dataset of PM and O3 for all US taking year 2013 (annual
## data from EPA)
## This uses data from
## http://aqsdr1.epa.gov/aqsweb/aqstmp/airdata/download_files.html
## Read in the 2013 Annual Data
d <- read.csv("tools/yhats/annual_all_2013.csv", nrow = 68210)
str(d)

sub <- subset(d, Parameter.Name %in% c("PM2.5 - Local Conditions", "Ozone")
              & Pullutant.Standard %in% c("Ozone 8-Hour 2008", "PM25 Annual 2006"),
              c(Longitude, Latitude, Parameter.Name, Arithmetic.Mean))
head(sub)

# select mean(Arithmetic.Mean) by ("Longitude", "Latitude", "Parameter.Name")
pollavg <- aggregate(sub[, "Arithmetic.Mean"],
                     by=sub[, c("Longitude", "Latitude", "Parameter.Name")],
                     mean, na.rm = TRUE)

head(pollavg)

# transform Factor w/ 491 levels -->  Factor w/ 2 levels
pollavg<-transform(pollavg,Parameter.Name=factor(pollavg$Parameter.Name ))
# or:
pollavg$Parameter.Name <- factor(pollavg$Parameter.Name, labels = c("ozone", "pm25"))

names(pollavg)[4] <- "level"
## Remove unneeded objects
rm(d, sub)


## Write function
monitors <- data.matrix(pollavg[, c("Longitude", "Latitude")])
library(fields)
pollutant <- function(df) {
  x <- data.matrix(df[, c("lon", "lat")])
  r <- df$radius
  d <- rdist.earth(monitors, x) # monitors和x中各点之间距离
  
  use <- lapply(seq_len(ncol(d)), function(i) {
    which(d[, i] < r[i])
  })
  levels <- sapply(use, function(idx) {
    with(pollavg[idx, ], tapply(level, Parameter.Name, mean))
  })
  dlevel <- as.data.frame(t(levels))
  data.frame(df, dlevel)
}

## Send to yhat
library(yhatr)
model.require <- function() {
  library(fields)
}
model.transform <- function(df) {
  df
}


model.predict <- function(df) {  # the key one
  pollutant(df)
}



yhat.config <- c(
  username="gdwangh@189.cn",
  apikey="26e1004eb3c4872b3e9d7a9004e22dcf",
  env="http://cloud.yhathq.com/"
)
yhat.deploy("pollutant")
################################################################################
## Client side
library(yhatr)
yhat.config <- c(
username="rdpeng@gmail.com",
apikey="90d2a80bb532cabb2387aa51ac4553cc",
env="http://cloud.yhathq.com/"
)

df <- data.frame(lon = c(-76.6167, -118.25), lat = c(39.2833, 34.05),
radius = 20)
yhat.predict("pollutant", df)