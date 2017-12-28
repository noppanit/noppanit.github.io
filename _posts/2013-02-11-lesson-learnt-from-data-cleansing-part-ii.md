---
title: Lesson learnt from data cleansing. Part II
comments: true
author: Noppanit Charassinvichai
layout: post
permalink: /lesson-learnt-from-data-cleansing-part-ii/
dsq_thread_id:
  - 1076247110
categories:
  - Database
tags:
  - big-data
---
Ok as I have done the [part I][1] I have learnt another thing from data cleansing. I believe the best tool for data analysis is [R][2] but the learning is quite steep but I&#8217;m trying to learn it right now. Hopefully if I can get some results from this with neo4j I could move on to use R to get some more statistical results. 

Now, the second challenge I got was that the CSV file is about 1GB with around 100 columns and I was trying to use Ruby to parse that. Obviously, I got **Killed** results from my Terminal even before I got to the first line. So, Ruby has to load everything into memory and parse that. But as I&#8217;m running everything in my small Mac. It seems to be quite a challenging. So, what I have done is to dump everything to MySQL. This time works really good. MySQL has [LOAD DATA FILE][3] which can load CSV file into a table. It only took me around <string>20 seconds</strong> to load 1GB of CSV into a table. I dumped the table out and it was around 1GB which is not too bad. Now the next challenge was that I also had to filter out the events that were created by real users (I&#8217;m doing this [Kaggle competition][4]). I had around 3 million rows which is now that much. And I used MySQL which comes with XAMPP. My first query took me around 8 hours without spitting any results back. So, I gave up and did a couple research on how to make MySQL faster, but I&#8217;m not a DBA and I didn&#8217;t have time to read the whole book about MySQL performance tuning.

**First attempt**  
Index joined columns and changed the table schema to something small. I used **VARCHAR(50)** instead of **VARCHAR(255)** and of course I used **NUMBER(3)** instead of **VARCHAR(5)**

Still, I couldn&#8217;t get the results back in 1 hour which I think MySQL is better than that. 

**Second attempt**  
So, I moved on to the next one. It looked like everybody on the Internet suggested **key\_buffer\_size** or **key_buffer** to 4G. And changed some of the variables to pimp MySQL up a little bit.  

```
  * query\_cache\_type = 1
  * query\_cache\_size = 128M
  * query\_cache\_limit = 128M>
```

Still, I couldn&#8217;t get the results back. 

And suddenly I caught something in my **my.cnf**

```
# Example MySQL config file for small systems.
# This is for a system with little memory (&lt;= 64M) where MySQL is only used
# from time to time and it's important that the mysqld daemon
# doesn't use much resources.
#

```

What is said was that XAMPP is tuned for a very small computer to be able to run basic PHP and MySQL application which is why my MySQL performed really bad in this case. 

**Final attempt**  
I started my EC2 instance with 7GB of memory and installed MySQL (normal one) also some of the performance tuning variables. Now, I got the results back in just under 20 seconds to join two tables with around 3 millions rows.

> Lesson learnt: Do not use MySQL from XAMPP for data that is big and use query that would get smaller results. For example, in my case instead of filtering out user\_ids that don&#8217;t exist in Users table. I filtered user\_ids that exist instead. 

I also thought about of using BigQuery from Google but I guess my data is rather small and can hardly be called big data. Next time, I might try to use BigQuery just for fun.

 [1]: https://www.noppanit.com/lesson-learnt-from-data-cleansing/ "data cleansing part I"
 [2]: http://www.r-project.org/ "R"
 [3]: http://dev.mysql.com/doc/refman/5.1/en/load-data.html "Load data mysql"
 [4]: http://www.kaggle.com/c/event-recommendation-engine-challenge "kaggle competition"
