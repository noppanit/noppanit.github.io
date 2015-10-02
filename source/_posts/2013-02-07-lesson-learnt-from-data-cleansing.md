---
title: Lesson learnt from data cleansing. Part I
comments: true
author: Noppanit Charassinvichai
layout: post
permalink: /lesson-learnt-from-data-cleansing/
dsq_thread_id:
  - 1069474804
categories:
  - Ruby
tags:
  - big-data
---
Lately, I have been experimenting on [Kaggle competition][1]. This is the one I chose because I want to use neo4j to give some recommendation or in a sense I want to do unsupervised learning. From day one I faced a lot of problem dealing with a lot of data and they are not clean in a way. For example, in this competition, there is users dataset which contains all the users. And there is a friend dataset which contains all the friends. The data look like this. 

<img src="http://www.noppanit.com/wp-content/uploads/2013/02/Screen-shot-2013-02-01-at-00.08.50.png" alt="users dataset" class="aligncenter size-full wp-image-1028 cool_border" />

<img src="http://www.noppanit.com/wp-content/uploads/2013/02/Screen-shot-2013-02-01-at-00.08.28.png" alt="friends dataset" class="aligncenter size-full wp-image-1029 cool_border" />

The first dataset I could dump everything into neo4j without any problem because it&#8217;s just 30000 records it only took me 5 mins to do it. However, the second dataset was kind of a problem because the column **friends** not all of the ids exist in users database which means the users don&#8217;t exist. So, I had to check if the ids exist in user dataset or not. It turned out that the friends dataset is quite large (about 50 MB) and it could be 3000 ids in one column. So, my first thought would be just to do it one by one. 

**Frist attempt**  
So, what I did first was to dump the whole users dataset to neo4j. And then for loop to check if id exists then insert if not just ignore it. I used cypher to check if the id exists. It turned out that I left my computer for 24 hours and it went just only 10% of the data. It was really slow. One thing from this was that I used neography which means it&#8217;s using REST api which usually it&#8217;s slower than embedded code. And I couldn&#8217;t wait for a whole week just to import the data. So, I moved on. The slow part was the checking every time so I guess it would be nice to clean the data before I dump that to neo4j.

**Second attempt**  
I tried to use Google Refine to cross check two datasets but it couldn&#8217;t even pass the stage **&#8220;split multi-valued cells&#8221;** which to split column values to rows. Google Refine uses too much ram. I even tried to start EC2 instance but it froze along the way as well. I posted the question and got the solution [here][2]

**Third attempt**  
I used MySQL to join the tables and and check if the ids exist. Dumping all the data to MySQL was pretty easy my plain old PHP and MySQL. It turned out the friends dataset got around 38 Million rows. And here&#8217;s the script I used to check if the id doesn&#8217;t exit spit it out and delete it.

```
 SELECT uf.id, uf.friend_id, u.user_id FROM eventify.UserFriends uf LEFT JOIN eventify.Users u on uf.friend_id = u.user_id WHERE u.user_id is NULL LIMIT 1
```

It was also really slow since I just use my Macbook and didn&#8217;t even turn MySQL performance. So I moved on again.

**Final attempt**  
I couldn&#8217;t believe that this will be the simplest and most effective way. What I did was to dump the whole users dataset to **Hash** in Ruby and check the friends dataset which surprisingly it only took Ruby 10 mins to do that. Then it only took Ruby and neo4j around 2 hours to import the cleaned data.

> So lesson learnt for me was if anything can be done in memory do that first.

I&#8217;ll try to dump the rest in and blog about how did I get on with recommendation engine from neo4j.

 [1]: http://www.kaggle.com/c/event-recommendation-engine-challenge
 [2]: http://stackoverflow.com/questions/14636919/google-refine-cross-reference-between-row-and-column
