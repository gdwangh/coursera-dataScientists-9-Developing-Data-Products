library(yhatr)

model.transform  <- function(request) {
  me <- request$name
  paste ("Hello", me, "!")
}
model.predict <- function(greeting) {
  data.frame(greeting=greeting)
}

yhat.config  <- c(
  username="YOUR_USERNAME",
  apikey="YOUR_APIKEY",
  env="http://cloud.yhathq.com/"
)
yhat.deploy ("HelloWorld") ## you can enter any name you wish here; but it affects how call the deployment.