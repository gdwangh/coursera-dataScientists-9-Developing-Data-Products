library(data.table)
library(reshape2)

loadAndStat_data <- function() {
  # load population harmed by weather cross US, group the data by event type
  popu<<-readRDS("data/popHarm.rds")
  
  popu_sum<-popu[,sum(harm_popu),by=valid_type]
  setnames(popu_sum, "V1", "sum")
  
  # sort the sum population of event type decrease
  sorted_popu_sum<<-popu_sum[order(popu_sum$sum, decreasing=TRUE)]
  
  # load cost data cross US, group the data by event type
  cost<<-readRDS("data/cost.rds")

  cost_sum<-cost[,sum(cost_sum),by=valid_type]
  setnames(cost_sum, "V1", "sum")
  
  # sort the sum of event type decrease
  sorted_cost_sum<<-cost_sum[order(cost_sum$sum, decreasing=TRUE)]  
}


topN_cost<-function(n=3) {
  topN<-sorted_cost_sum[1:n,]
  setnames(topN, "valid_type", "event type")
  setnames(topN, "sum", "total cost")
}

topN_harm_health<-function(n=3) {
  topN<-sorted_popu_sum[1:n,]
  setnames(topN, "valid_type", "event type")
  setnames(topN, "sum", "number of harmed human")  
}

pie_cost<-function(n=3) { 
  topN<-sorted_cost_sum[1:n,]
  other<-data.table(valid_type="** Others", sum=sum(sorted_cost_sum[(n+1):nrow(sorted_cost_sum),]$sum))
  rbind(topN, other)
}

pie_health<-function(n=3) { 
  topN<-sorted_popu_sum[1:n,]
  other<-data.table(valid_type="** Others", sum=sum(sorted_popu_sum[(n+1):nrow(sorted_popu_sum),]$sum))
  rbind(topN, other)
}

influnce_cost<-function(n=3) {
  cmelt<-melt(subset(cost, valid_type %in% sorted_cost_sum[1:n,]$valid_type), id.vars=c("valid_type", "STATE"),measure.vars=c("cost_sum"))
  cost_state_sum<-dcast(cmelt,STATE+valid_type~variable, fun=sum)
  merge(cost_state_sum, subset(state.regions,!abb %in% c("HI","AK"), select=c("region","abb")), by.x="STATE",by.y="abb") 
}

influnce_health<-function(n=3) {
  pmelt<-melt(subset(popu, valid_type %in% sorted_popu_sum[1:n,]$valid_type), id.vars=c("valid_type", "STATE"),measure.vars=c("harm_popu"))
  popu_state_sum<-dcast(pmelt,STATE+valid_type~variable, fun=sum)  
  merge(popu_state_sum, subset(state.regions,!abb %in% c("HI","AK"), select=c("region","abb")), by.x="STATE",by.y="abb")
}


