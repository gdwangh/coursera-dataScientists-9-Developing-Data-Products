library(yhatr)

model.transform  <- function(request) {
  me <- request$name
  paste ("Hello", me, "!")
}
model.predict <- function(greeting) {
  data.frame(greeting=greeting)
}

yhat.config  <- c(
  username="gdwangh@189.cn",
  apikey="26e1004eb3c4872b3e9d7a9004e22dcf",
  env="http://cloud.yhathq.com/"
)
yhat.deploy ("HelloWorld") 


################################################################################
## Client side

library(yhatr)
yhat.config <- c(
  username="gdwangh@189.cn",
  apikey="26e1004eb3c4872b3e9d7a9004e22dcf",
  env="http://cloud.yhathq.com/"
)
yhat.predict("HelloWorld", data.frame(name="wangh"))
