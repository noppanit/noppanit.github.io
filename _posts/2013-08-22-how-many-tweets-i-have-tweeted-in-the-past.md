---
title: How many tweets I have tweeted in the past?
comments: true
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

```
install.packages("plyr")
install.packages("ggplot2")
```

```
library(plyr)
library(ggplot2)

#Load all your tweets
tweets<-read.delim("data/tweets.csv", sep=",")

#Convert timestamp to Date in R
tweets$timestamp<-as.POSIXlt(tweets$timestamp, format="%Y-%m-%d %H:%M:%S +0000")

#Get month in JAN-DEC format
tweets$month = strftime(tweets$timestamp, "%b")
#Get year in 2011-20xx format
tweets$year = strftime(tweets$timestamp, "%Y")

#Then start counting for each month compare to each year
timestamps_month = count(tweets, vars = c("month","year"))

#Then just plot the graph
ggplot(data = timestamps_month) + geom_bar(aes(x = month, y = freq, fill = year), stat="identity", position = "dodge")

```

This is what I have been tweets for the past years. Interestingly I tweeted a lot back in 2010, hmm I was wondering what did I tweet. Well I gotta go to bed will find out tomorrow. What&#8217;s yours?

[<img src="https://www.noppanit.com/wp-content/uploads/2013/08/Screen-Shot-2013-08-22-at-00.21.04.png" alt="My tweets" class="aligncenter size-full wp-image-1151 cool_border" />][1]

 [1]: https://www.noppanit.com/wp-content/uploads/2013/08/Screen-Shot-2013-08-22-at-00.21.04.png
