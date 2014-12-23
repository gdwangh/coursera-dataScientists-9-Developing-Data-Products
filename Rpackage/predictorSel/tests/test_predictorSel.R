# http://www-rohan.sdsu.edu/doc/R/manual/R-exts.html

# @importFrom caret confusionMatrix
# @importFrom caret varImp
# @importFrom randomForest randomForest


library(caret)
#library(randomForest)

#tmp_ds<-read.csv("tests/pml-training.csv", na.strings=c("NA","","#DIV/0!"))
tmp_ds<-read.csv("pml-training.csv", na.strings=c("NA","","#DIV/0!"))

set.seed(12345)
inTrain = createDataPartition(tmp_ds$classe, p = 0.75)[[1]]
train_ds = tmp_ds[ inTrain, ]
valid_ds = tmp_ds[-inTrain, ]

var_list<-c(8:11,37:45,46:49,60:68,84:86,102,113:121,122:124,140,151:159)
train_classe<-train_ds[,160]
train_ds<-train_ds[,var_list]

valid_classe<-valid_ds[,160]
valid_ds<-valid_ds[,var_list]

# test R package
library(predictorSel)

remain<-modelSel_rf(train_classe~., train_ds, valid_ds, valid_classe, acc_thresh=0.99)
