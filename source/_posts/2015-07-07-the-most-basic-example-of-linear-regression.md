---
title: The most basic example of Linear Regression
comments: true
author: Noppanit Charassinvichai
layout: post
permalink: /the-most-basic-example-of-linear-regression/
dsq_thread_id:
  - 3911356848
categories:
  - Knowledges
tags:
  - linear regression
  - machine learning
  - python
---
Just for fun, I wanted to learn how to do linear regression and here&#8217;s the example I come up with. 

Let&#8217;s say you have a historical data of 1000 people who dined in your restaurant and left a tip. This is going to be perfect data because I generated. In the real world you will not find something like this. 

If you don&#8217;t understand Linear Regression like me before I wrote this post, I recommend you to read this [basic linear regression.][1]. 

The idea is that you have two variables. In this case, it&#8217;s **tips** and **total amount of bill**. You should explore the data by plotting the graph of these two variables. From my generated data you will get something like this.

[<img src="https://www.noppanit.com/wp-content/uploads/2015/07/Screenshot-2015-07-07-00.54.42.png" alt="Linear Regression" width="421" height="281" class="aligncenter size-full wp-image-1448" />][2]

You can clearly see that there&#8217;s a strong correlation between the amount of tip and meal. 

Now if you can find the slope of the graph and intercept you should be able to use the formula.

```
Y = MX + C

M = slope of the graph
C = Intercept
```

If you&#8217;re lazy to look at my [notebook][3]. 

Then you can run this code.

``` python
import pandas as pd
import numpy as np
from scipy import stats

total_bills = np.random.randint(100, size=1000)
tips = total_bills * 0.10

x = pd.Series(tips, name='tips')
y = pd.Series(total_bills, name='total_bills')
df = pd.concat([x, y], axis=1)

slope, intercept, r_value, p_value, std_err = stats.linregress(x=total_bills, y=tips)
predicted_tips = (slope * 70) + intercept
```

The result is $7 which corresponds to the 10% tip.

 [1]: http://onlinestatbook.com/2/regression/intro.html
 [2]: https://www.noppanit.com/wp-content/uploads/2015/07/Screenshot-2015-07-07-00.54.42.png
 [3]: https://github.com/noppanit/linear-regression-basic
