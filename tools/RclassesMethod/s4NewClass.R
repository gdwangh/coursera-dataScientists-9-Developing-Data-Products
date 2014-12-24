library(methods)

getClass("data.frame")

methods("mean")  # S3， but Never call methods directly

showMethods("plot")  # S4

a<-data.frame(col_a=c(1:30), col_b=rep("a",30))
show(a) # 相当与 显示a的内容

# print the code for a method
getS3method("mean", "default")  # 对应 methods("mean")结果中的 mean.default
getS3method("mean", "Date")     # 对应 methods("mean")结果中的 mean.Date

getMethod("plot", "ANY")

# create new S4 class
library(methods)
setClass("polygon",
         representation(x = "numeric",
                        y = "numeric"))
setMethod("plot", "polygon",
          function(x, y, ...) {   # 为了匹配 plot的输入参数，实际上只有x是有效的
            plot(x@x, x@y, type = "n", ...)
            xp <- c(x@x, x@x[1])  # 补上最后一个点和第一个点之间的连线
            yp <- c(x@y, x@y[1])  # 补上最后一个点和第一个点之间的连线
            lines(xp, yp)
          })   # set a plot method, 将新类polygon的一个method关联到plot()
showMethods("plot")  # S4

p <- new("polygon", x = c(1, 2, 3, 4), y = c(1, 2, 3, 1))
plot(p, col="red")

# create new S4 class
library(methods)
setClass("circle",
         representation(center_x = "numeric",
                        center_y = "numeric",
                        r = "numeric")
        )
setMethod("plot", "circle",
          function(x, ...) {
            k <- c(1:360,1)/180
            pi <- 3.14159
            c_x=x@center_x + x@r*sin(k*pi)  
            c_y=x@center_y + x@r*cos(k*pi) 

            plot(c_x,c_y,type='l', xlab="",ylab="",
                 xlim=c(x@center_x-x@r,x@center_x+x@r),
                 ylim=c(x@center_y-x@r,x@center_y+x@r), ...)
          }
  )

# removeMethod("plot", "circle")
          
showMethods("plot")  # S4

getMethod("plot", "circle")

cir <- new("circle", center_x=0, center_y=0, r=1)
plot(cir, col="red")

