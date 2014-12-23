# The Gordon Growth Model



**To run the application click the Model tab on the navigation bar above.**
  
  This application was created for the Developing Data Products class available
at Coursera.  If you are interested in learning more about this model, keep reading.


## Overview


The Gordon Growth Model is the simplest practical implementation of discounted dividend valuation.

- Used to determine a fair share price for a stock.
- Works best for mature, stable companies with steady dividend and earnings growth.
- Assumes constant earnings growth and dividend payout ratio.
- Very sensitive to discount rate and growth rate assumptions.

## Model Equation


Stock Price = D (1+g) / (r-g)

where,

D = the annual dividend
g = the projected dividend growth rate, and
r = the investor's required rate of return. 


## R implementation



```r
gordonGrowthModel <- function (dividend,growthrate,discountrate)
{
dividend * (1+growthrate)/(discountrate-growthrate)

}
```
## More Information


To view the associated slide deck, please visit:

http://rpubs.com/slingshot/50552

For a more thorough discussion, see website at:

http://www.investinganswers.com/education/stock-valuation/how-use-gordon-growth-model-2456

Source code available at https://github.com/sometxdude/dataproject1