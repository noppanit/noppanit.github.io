---
title: The most basic example of Linear Regression
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

[<img src="http://www.noppanit.com/wp-content/uploads/2015/07/Screenshot-2015-07-07-00.54.42.png" alt="Linear Regression" width="421" height="281" class="aligncenter size-full wp-image-1448" />][2]

You can clearly see that there&#8217;s a strong correlation between the amount of tip and meal. 

Now if you can find the slope of the graph and intercept you should be able to use the formula.

<div class="codecolorer-container text blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />
        </div>
      </td>
      
      <td>
        <div class="text codecolorer">
          Y = MX + C<br /> <br /> M = slope of the graph<br /> C = Intercept
        </div>
      </td>
    </tr>
  </table>
</div>

If you&#8217;re lazy to look at my [notebook][3]. 

Then you can run this code.

<div class="codecolorer-container python blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />
        </div>
      </td>
      
      <td>
        <div class="python codecolorer">
          <span class="kw1">import</span> pandas <span class="kw1">as</span> pd<br /> <span class="kw1">import</span> numpy <span class="kw1">as</span> np<br /> <span class="kw1">from</span> scipy <span class="kw1">import</span> stats<br /> <br /> total_bills <span class="sy0">=</span> np.<span class="kw3">random</span>.<span class="me1">randint</span><span class="br0">&#40;</span><span class="nu0">100</span><span class="sy0">,</span> size<span class="sy0">=</span><span class="nu0">1000</span><span class="br0">&#41;</span><br /> tips <span class="sy0">=</span> total_bills * <span class="nu0">0.10</span><br /> <br /> x <span class="sy0">=</span> pd.<span class="me1">Series</span><span class="br0">&#40;</span>tips<span class="sy0">,</span> name<span class="sy0">=</span><span class="st0">'tips'</span><span class="br0">&#41;</span><br /> y <span class="sy0">=</span> pd.<span class="me1">Series</span><span class="br0">&#40;</span>total_bills<span class="sy0">,</span> name<span class="sy0">=</span><span class="st0">'total_bills'</span><span class="br0">&#41;</span><br /> df <span class="sy0">=</span> pd.<span class="me1">concat</span><span class="br0">&#40;</span><span class="br0">&#91;</span>x<span class="sy0">,</span> y<span class="br0">&#93;</span><span class="sy0">,</span> axis<span class="sy0">=</span><span class="nu0">1</span><span class="br0">&#41;</span><br /> <br /> slope<span class="sy0">,</span> intercept<span class="sy0">,</span> r_value<span class="sy0">,</span> p_value<span class="sy0">,</span> std_err <span class="sy0">=</span> stats.<span class="me1">linregress</span><span class="br0">&#40;</span>x<span class="sy0">=</span>total_bills<span class="sy0">,</span> y<span class="sy0">=</span>tips<span class="br0">&#41;</span><br /> predicted_tips <span class="sy0">=</span> <span class="br0">&#40;</span>slope * <span class="nu0">70</span><span class="br0">&#41;</span> + intercept
        </div>
      </td>
    </tr>
  </table>
</div>

The result is $7 which corresponds to the 10% tip.

 [1]: http://onlinestatbook.com/2/regression/intro.html
 [2]: http://www.noppanit.com/wp-content/uploads/2015/07/Screenshot-2015-07-07-00.54.42.png
 [3]: https://github.com/noppanit/linear-regression-basic