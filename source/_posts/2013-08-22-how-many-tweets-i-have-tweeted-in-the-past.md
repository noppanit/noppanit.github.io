---
title: How many tweets I have tweeted in the past?
author: Noppanit Charassinvichai
layout: post
permalink: /how-many-tweets-i-have-tweeted-in-the-past/
dsq_thread_id:
  - 1627008562
categories:
  - R
tags:
  - analysis
  - r
  - tweets
  - twitter
---
This blog post is kinda lame, but I got so excited to get something worked in R. I have been wondering what I have been doing for the last years.

I&#8217;m sitting at my desk and thinking how can I know that. Then, yeah I can analyse my own tweets. So, I downloaded all my tweets from Twitter and started crushing some number. 

I&#8217;m guessing you can use this code as the format of the csv file should be the same. 

If you haven&#8217;t done this already.

<div class="codecolorer-container text blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />
        </div>
      </td>
      
      <td>
        <div class="text codecolorer">
          install.packages("plyr")<br /> install.packages("ggplot2")
        </div>
      </td>
    </tr>
  </table>
</div>

<div class="codecolorer-container text blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />15<br />16<br />17<br />18<br />19<br />
        </div>
      </td>
      
      <td>
        <div class="text codecolorer">
          library(plyr)<br /> library(ggplot2)<br /> <br /> #Load all your tweets<br /> tweets<-read.delim("data/tweets.csv", sep=",")<br /> <br /> #Convert timestamp to Date in R<br /> tweets$timestamp<-as.POSIXlt(tweets$timestamp, format="%Y-%m-%d %H:%M:%S +0000")<br /> <br /> #Get month in JAN-DEC format<br /> tweets$month = strftime(tweets$timestamp, "%b")<br /> #Get year in 2011-20xx format<br /> tweets$year = strftime(tweets$timestamp, "%Y")<br /> <br /> #Then start counting for each month compare to each year<br /> timestamps_month = count(tweets, vars = c("month","year"))<br /> <br /> #Then just plot the graph<br /> ggplot(data = timestamps_month) + geom_bar(aes(x = month, y = freq, fill = year), stat="identity", position = "dodge")
        </div>
      </td>
    </tr>
  </table>
</div>

This is what I have been tweets for the past years. Interestingly I tweeted a lot back in 2010, hmm I was wondering what did I tweet. Well I gotta go to bed will find out tomorrow. What&#8217;s yours?

[<img src="http://www.noppanit.com/wp-content/uploads/2013/08/Screen-Shot-2013-08-22-at-00.21.04.png" alt="My tweets" class="aligncenter size-full wp-image-1151 cool_border" />][1]

 [1]: http://www.noppanit.com/wp-content/uploads/2013/08/Screen-Shot-2013-08-22-at-00.21.04.png