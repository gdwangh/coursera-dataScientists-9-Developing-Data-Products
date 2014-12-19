library(randomForest)

#' @param f fomula 
#' 
modelSel_rf<-function(f, train_data, valid_x, valid_y, acc_thresh=0.99)  {
  acc_list<-{}
  remove_flist<-{}
  importance_list<-{}
  
  ModFit<-randomForest(f, train_data)
  pred<-predict(ModFit, valid_x)
  
  while ((confusionMatrix(valid_y, pred)$overall)[1]>acc_thresh) {
    vImp<-varImp(ModFit)
    # store the infomation of current model
    acc_list<-c(acc_list, (confusionMatrix(valid_y, pred)$overall)[1])
    importance_list<-c(importance_list, min(vImp))
    min_acc_predictor<-which(vImp$Overall==min(vImp))
    remove_flist<- c(remove_flist, rownames(vImp)[min_acc_predictor])
    
    # get the feature except the one with min imporatance
    remain_predictor<-rownames(vImp)[-min_acc_predictor]
    
    ModFit<-randomForest(f, train_data[,remain_predictor])
    pred<-predict(ModFit, valid_x) 
  } # while
  
  # data.frame(importance=round(importance_list,4), var=remove_flist, accuracy=round(acc_list,4), row.names=c(ncol(train_data):(ncol(train_data) - length(remove_flist)+1)))
  rownames(vImp)
}
