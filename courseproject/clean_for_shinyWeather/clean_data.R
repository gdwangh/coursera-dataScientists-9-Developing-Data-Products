library(data.table)

Sys.setlocale('LC_ALL', 'English')

rawURL<-"D:/doc/study/dataScientists/5-Reproducible Research/StormData.csv.bz2"
#rawURL<-"courseproject/clean_for_shinyWeather/StormData.csv.bz2"

# To minimize the data in memroy, only load the columns to be used
to_read = c("NULL", NA,rep("NULL",4),NA,NA,rep("NULL",14),rep(NA,6),rep("NULL",8),NA)
sdata<-data.table(read.csv(rawURL,colClasses=to_read,stringsAsFactors=FALSE))
sdata[, year:=year(as.Date(strptime(BGN_DATE, "%m/%d/%Y %H:%M:%S")))]
sdata$STATE = as.factor(sdata$STATE)

# clean Event type
# get rid of records with human+economic costs are zero, which no affect to the goal
cost_data<-subset(sdata,FATALITIES+INJURIES+PROPDMG+CROPDMG>0)

# In Storm Data Documentation, there are such valid event types as "Cold/Wind Chill" 
# and "Extreme Cold/Wind Chill". So, greping and gsub should be done from longer to 
# shorter.Sort the valid event type name descreasing.
event_type<-data.table(typename=c("Avalanche",
                                  "Blizzard",
                                  "Coastal Flood",
                                  "Cold/Wind Chill",
                                  "Debris Flow",
                                  "Dense Fog",
                                  "Dense Smoke",
                                  "Drought",
                                  "Dust Devil",
                                  "Dust Storm",
                                  "Excessive Heat",
                                  "Extreme Cold/Wind Chill",
                                  "Flash Flood",
                                  "Flood",
                                  "Frost/Freeze",
                                  "Funnel Cloud",
                                  "Freezing Fog",
                                  "Hail",
                                  "Heat",
                                  "Heavy Rain",
                                  "Heavy Snow",
                                  "High Surf",
                                  "High Wind",
                                  "Hurricane",
                                  "Ice Storm",
                                  "Lake-Effect Snow",
                                  "Lakeshore Flood",
                                  "Lightning",
                                  "Marine Hail",
                                  "Marine High Wind",
                                  "Marine Strong Wind",
                                  "Marine Thunderstorm Wind",
                                  "Rip Current",
                                  "Seiche",
                                  "Sleet",
                                  "Storm Surge/Tide",
                                  "Strong Wind",
                                  "Thunderstorm Wind",
                                  "Tornado",
                                  "Tropical Depression",
                                  "Tropical Storm",
                                  "Tsunami",
                                  "Volcanic Ash",
                                  "Waterspout",
                                  "Wildfire",
                                  "Winter Storm",
                                  "Winter Weather"))

# sort from long to short
event_type[,len:=nchar(typename)]
sort_evtype<-event_type[order(event_type$len, decreasing=TRUE)]

# According document, there are some strings able to trans & map to the valid 
# event type. So, replace and regular them before find out the event type.
trans_src_desc<-matrix(c("TSTM", "Thunderstorm",
                         "Landslide", "Debris Flow",
                         "STORM SURGE", "STORM SURGE/Tide",
                         "ASTRONOMICAL HIGH TIDE", "High Surf",
                         "Extreme Cold", "Frost/Freeze",
                         "WILD/FOREST FIRE", "Wildfire",
                         "URBAN/SML STREAM FLD", "Heavy Rain",
                         "LIGHT SNOW", "Winter Storm",
                         "DRY MICROBURST", "Thunderstorm Wind",
                         "FREEZING RAIN", "Winter Weather",
                         "GUSTY WINDS","Strong Wind",
                         "SNOW SQUALL","Winter Weather",
                         "EXTREME WINDCHILL","Extreme Cold/Wind Chill",
                         "GUSTY WIND", "Strong Wind"), 
                       ncol = 2, byrow=TRUE
)

# replace the string EVTYPE
for (i in 1:nrow(trans_src_desc))
  cost_data[,EVTYPE:=gsub(trans_src_desc[i,1],trans_src_desc[i,2],EVTYPE,ignore.case=TRUE)]

# find out the valid event type as much as possible
cost_data[,valid_type:=""]
for (et in sort_evtype$typename) {
  cost_data[(valid_type=="") & grepl(et, cost_data$EVTYPE, ignore.case=TRUE), valid_type:=et]
}

# check whether there are the large number of records with invalid EVTYPE 
# recheck the left event type
ldata<-cost_data[valid_type=="", .N, by=EVTYPE]
ldata[order(ldata$N, decreasing=TRUE)]

# Check the event type appear in each year 
# us<-unique(subset(cost_data,valid_type!="",select=c("year","valid_type")))
# us[,.N,by=year]
# It seems before 1993, the number of event type in data is very small and 
# there should be something wrong. So get the records after 1992 only
cldata<-subset(cost_data, valid_type!="" & year>"1992")
cldata$valid_type<-as.factor(cldata$valid_type)

# sum(FATALITIES+INJURIES) for each event type across US
cldata_popu<<-subset(cldata, FATALITIES+INJURIES>0)
cldata_popu[,harm_popu:=FATALITIES+INJURIES]

# save file
saveRDS(cldata_popu, "courseproject/part1-shiny/weatherEventHarm/data/popHarm.rds")

# sum(PROPDMG+CROPDMGEXP) for each event type across US
cldata_cost<-subset(cldata, PROPDMG+CROPDMG>0)
cldata_cost[,sum(PROPDMG),by=PROPDMGEXP]
cldata_cost[,sum(CROPDMG),by=CROPDMGEXP]

# filter out the record with invalid units, and then translate units, 
# ready to add cost together, and then sum the cost for each event type
cldata2<<-subset(cldata_cost, PROPDMGEXP %in% c("K","k","M","m","B","b","")& CROPDMGEXP  %in% c("K","k","M","m","B","b",""))
cldata2[PROPDMGEXP %in% c(""),pro_cost:=PROPDMG]
cldata2[PROPDMGEXP %in% c("K","k"),pro_cost:=PROPDMG*10^3]
cldata2[PROPDMGEXP %in% c("M","m"),pro_cost:=PROPDMG*10^6]
cldata2[PROPDMGEXP %in% c("B","b"),pro_cost:=PROPDMG*10^9]

cldata2[CROPDMGEXP %in% c(""),crop_cost:=CROPDMG]
cldata2[CROPDMGEXP %in% c("K","k"),crop_cost:=CROPDMG*10^3]
cldata2[CROPDMGEXP %in% c("M","m"),crop_cost:=CROPDMG*10^6]
cldata2[CROPDMGEXP %in% c("B","b"),crop_cost:=CROPDMG*10^9]

cldata2[, cost_sum:=pro_cost+crop_cost]

# save file
saveRDS(cldata2, "courseproject/part1-shiny/weatherEventHarm/data/cost.rds")
