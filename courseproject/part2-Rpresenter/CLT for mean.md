CLT  for mean
========================================================
author: wang hui
date: Sun Dec 14 20:44:01 2014

Conditions for the CLT:
========================================================

1. Independence: Sampled observations must be independent.
‣ random sample/assignment if sampling without replacement, n < 10% of population
2. Sample size/skew: Either the population distribution is normal, or if the population distribution is skewed, the sample size is large (rule of thumb: n > 30).

Slide With Code
========================================================


```r
summary(cars)
```

```
     speed           dist       
 Min.   : 4.0   Min.   :  2.00  
 1st Qu.:12.0   1st Qu.: 26.00  
 Median :15.0   Median : 36.00  
 Mean   :15.4   Mean   : 42.98  
 3rd Qu.:19.0   3rd Qu.: 56.00  
 Max.   :25.0   Max.   :120.00  
```

Slide With Plot
========================================================

![plot of chunk unnamed-chunk-2](CLT for mean-figure/unnamed-chunk-2-1.png) 

