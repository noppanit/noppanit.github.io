---
title: Google Refine the best way to scrape data from websites that I like.
author: Noppanit Charassinvichai
layout: post
permalink: /google-refine-the-best-way-to-scrape-data-from-websites-that-i-like/
dsq_thread_id:
  - 934083162
categories:
  - Knowledges
---
There are a lot of ways to scrape data out of a website, you could use any of your favourite computer language to GET a webpage and use HTML parser to get the data you need. But Google Refine comes with a lots of techniques to manipulate the data you scrapped and then export in any format you like with little or less coding. If you don&#8217;t know what Google Refine is I recommend watching some of the videos on their website [here][1]. 

I think I cannot demonstrate how to scrape a website from any website, so I&#8217;m going to use my site for an example. 

1. I would start with Excel and put the URL I want to scrape in the second row. I could have put in the first row but I would have to change the configuration in Google Refine. 

[<img src="http://www.noppanit.com/wp-content/uploads/2012/11/Screen-shot-2012-11-19-at-00.31.01-300x87.png" alt="" title="Excel" width="300" height="87" class="alignnone size-medium wp-image-894" />][2]

2. Create a project in Google Refine.

[<img src="http://www.noppanit.com/wp-content/uploads/2012/11/Screen-shot-2012-11-19-at-00.34.04-300x116.png" alt="" title="Create project Google Refine" width="300" height="116" class="alignnone size-medium wp-image-896" />][3]

3. If successful you would see this.

[<img src="http://www.noppanit.com/wp-content/uploads/2012/11/Screen-shot-2012-11-19-at-00.34.35-300x121.png" alt="" title="Google Refine" width="300" height="121" class="alignnone size-medium wp-image-897" />][4]

4. Then we will fetch the url.

[<img src="http://www.noppanit.com/wp-content/uploads/2012/11/Screen-shot-2012-11-19-at-00.36.31-300x276.png" alt="" title="Fetching url" width="300" height="276" class="alignnone size-medium wp-image-898" />][5]

5. You can set the delay and give the column a name then click Ok. You can also use some formular or expression

[<img src="http://www.noppanit.com/wp-content/uploads/2012/11/Screen-shot-2012-11-19-at-00.37.31-300x228.png" alt="" title="Google Refine" width="300" height="228" class="alignnone size-medium wp-image-899" />][6]

6. Then you would see that the content has been fetch and put into the column we named. 

[<img src="http://www.noppanit.com/wp-content/uploads/2012/11/Screen-shot-2012-11-19-at-00.39.01-300x170.png" alt="" title="Page Content" width="300" height="170" class="alignnone size-medium wp-image-900" />][7]

7. Then we will only extract the title of the page. Now this one is tricky because every website has its own HTML and we need to adapt the expression. 

[<img src="http://www.noppanit.com/wp-content/uploads/2012/11/Screen-shot-2012-11-19-at-00.42.59-300x224.png" alt="" title="Google Refine Edit Column" width="300" height="224" class="alignnone size-medium wp-image-901" />][8]

[<img src="http://www.noppanit.com/wp-content/uploads/2012/11/Screen-shot-2012-11-19-at-00.46.37-300x214.png" alt="" title="GREL" width="300" height="214" class="alignnone size-medium wp-image-903" />][9]

For this example I use this expression. So that means get me &#8220;#main-content article header h2 a&#8221; and &#8220;join&#8221; with &#8220;,&#8221;

``` bash
forEach(value.parseHtml().select("#main-content article header h2 a"), e, e.innerHtml()).join(",")
```

8. Then we will change the shape of this data to be each title per row by using &#8220;Split multi-values cells&#8221;

[<img src="http://www.noppanit.com/wp-content/uploads/2012/11/Screen-shot-2012-11-19-at-00.48.17-300x116.png" alt="" title="Split multi-valued cells" width="300" height="116" class="alignnone size-medium wp-image-904" />][10]

That&#8217;s it. But there are a lot of ways you could use Google Refine to manipulate your data. One thing that you need to be careful if you&#8217;re fetching a large data, if Google Refine could not finish the process in one go. You might have to start it over. So, if your connection is not reliable I would suggest using Amazon EC2. You could easily deploy Google Refine on the cloud. Also, do give a lot of memore to start Google Refine, otherwise you might get OutOfMemory in the middle of the process. 

One thing that I found out and I haven&#8217;t researched it throughly but I think Google Refine lacks is the ability to extract text by regular expression. You could match a text with regular expression but you cannot extract the text you want. But overall, it&#8217;s still the best tool for the job.

 [1]: http://code.google.com/p/google-refine/
 [2]: http://www.noppanit.com/wp-content/uploads/2012/11/Screen-shot-2012-11-19-at-00.31.01.png
 [3]: http://www.noppanit.com/wp-content/uploads/2012/11/Screen-shot-2012-11-19-at-00.34.04.png
 [4]: http://www.noppanit.com/wp-content/uploads/2012/11/Screen-shot-2012-11-19-at-00.34.35.png
 [5]: http://www.noppanit.com/wp-content/uploads/2012/11/Screen-shot-2012-11-19-at-00.36.31.png
 [6]: http://www.noppanit.com/wp-content/uploads/2012/11/Screen-shot-2012-11-19-at-00.37.31.png
 [7]: http://www.noppanit.com/wp-content/uploads/2012/11/Screen-shot-2012-11-19-at-00.39.01.png
 [8]: http://www.noppanit.com/wp-content/uploads/2012/11/Screen-shot-2012-11-19-at-00.42.59.png
 [9]: http://www.noppanit.com/wp-content/uploads/2012/11/Screen-shot-2012-11-19-at-00.46.37.png
 [10]: http://www.noppanit.com/wp-content/uploads/2012/11/Screen-shot-2012-11-19-at-00.48.17.png
