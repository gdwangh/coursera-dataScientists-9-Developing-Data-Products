---
title       : CLT - Center Limit Theorem (for means)
subtitle    : 
author      : wangh
job         : study
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Conditions for the CLT

1. Independence: Sampled observations must be independent.
? random sample/assignment
? if sampling without replacement, n < 10% of population
2. Sample size/skew: Either the population distribution is normal, or if the population
distribution is skewed, the sample size is large (rule of thumb: n > 30).

--- .class #id 

## Generate random for the Poisson distribution

generate a sampleSize * n matrix with variables for the Poisson distribution


```r
sdf<-matrix(rpois(input$n * as.integer(input$sampleSize), input$lambda), input$n)
```

```
## Error in rpois(input$n * as.integer(input$sampleSize), input$lambda): 找不到对象'input'
```

--- .class #id

## plot

```r
      avg<-apply(rand_data(), 1, mean)
```

```
## Error in apply(rand_data(), 1, mean): 没有"rand_data"这个函数
```

```r
      miu<-mean(avg)
```

```
## Error in mean(avg): 找不到对象'avg'
```

```r
      SE_mean<-sd(avg)
```

```
## Error in is.data.frame(x): 找不到对象'avg'
```

```r
      wide<-sqrt(input$lambda/10)*3
```

```
## Error in eval(expr, envir, enclos): 找不到对象'input'
```

```r
      g_mean <- ggplot(data.frame(avg), aes(x = avg))
```

```
## Error in eval(expr, envir, enclos): 没有"ggplot"这个函数
```

```r
      g_mean <- g_mean + labs(title = paste('mean = ', round(miu,4),", SE = ", round(SE_mean,4)))
```

```
## Error in eval(expr, envir, enclos): 找不到对象'g_mean'
```

```r
      g_mean <- g_mean + labs(x="sample mean")
```

```
## Error in eval(expr, envir, enclos): 找不到对象'g_mean'
```

```r
      g_mean <- g_mean + xlim(miu-wide, miu+wide)
```

```
## Error in eval(expr, envir, enclos): 找不到对象'g_mean'
```

```r
      g_mean <- g_mean + geom_histogram(fill = "salmon",binwidth =wide/40,aes(y = ..density..), colour = "black")
```

```
## Error in eval(expr, envir, enclos): 找不到对象'g_mean'
```

```r
      g_mean <- g_mean + geom_density(size = 1) + geom_vline(xintercept = miu, color="blue",size =1)
```

```
## Error in eval(expr, envir, enclos): 找不到对象'g_mean'
```

```r
      g_mean
```

```
## Error in eval(expr, envir, enclos): 找不到对象'g_mean'
```

--- .class #id


