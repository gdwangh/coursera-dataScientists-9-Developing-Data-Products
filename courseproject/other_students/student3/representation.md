The Gordon Growth Model
========================================================
author:
date:
Overview
========================================================
The Gordon Growth Model is the simplest practical implementation of discounted dividend valuation.
- Used to determine a fair share price for a stock.
- Works best for mature, stable companies with steady dividend and earnings growth.
- Assumes constant earnings growth and dividend payout ratio.
- Very sensitive to discount rate and growth rate assumptions.
Model Equation
========================================================
Stock Price = D (1+g) / (r-g)
where,
D = the annual dividend
g = the projected dividend growth rate, and
r = the investor's required rate of return.
R implementation
========================================================

```r
gordonGrowthModel <- function (dividend,growthrate,discountrate)
{
dividend * (1+growthrate)/(discountrate-growthrate)
}
```
### Example
Assuming dividend of $2.50, a dividend growth rate of 4%, and a discount rate of 7%.

```r
gordonGrowthModel(2.50,.04,.07)
```

```
[1] 86.66667
```
A fair value of stock price would be $86.67.
More Information
========================================================
This slide deck was created for the Developing Data Products class available
at Coursera. To view the associated Shiny demo application, please visit:
http://slingshot.shinyapps.io/dataproducts-project1/
For a more thorough discussion, see website at:
http://www.investinganswers.com/education/stock-valuation/how-use-gordon-growth-model-2456
Source code available at https://github.com/sometxdude/dataproject1
