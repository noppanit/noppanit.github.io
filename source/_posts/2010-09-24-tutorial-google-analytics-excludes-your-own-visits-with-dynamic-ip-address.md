---
title: 'Tutorial : Google Analytics excludes your own visits with dynamic IP address'
author: Noppanit Charassinvichai
layout: post
permalink: /tutorial-google-analytics-excludes-your-own-visits-with-dynamic-ip-address/
dsq_thread_id:
  - 184184148
categories:
  - Techniques
---
Google Analytics is a great tool to gather and analyse your traffic on your website. However, if a vast majority visits of your website is only yourself, this will inflate the data on your report, such as visits and pageview. This is not good. GA provides you with filters, so that you could filter out your own visits from other traffic. But GA provides pre-defined filters if you have a static IP address or domain within your organisation. So, how would you exclude your traffic from your own computer at home, with dynamic IP address. The answer is cookie. The idea is just you set one variable that will be identified as only you and every time you visit your own site GA will filter your own traffic by looking at the variable. If your cookie has that variable, GA will ignore your visits.

So, enough talking! let&#8217;s get started.  
First, copy the text below and create a new html file and paste the code into one html file. Then upload it to your server, so it would be http://www.yourdomain.com/thispage.html

<div class="codecolorer-container html4strict blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />15<br />16<br />17<br />
        </div>
      </td>
      
      <td>
        <div class="html4strict codecolorer">
          <span class="sc2"><<a href="http://december.com/html/4/element/html.html"><span class="kw2">html</span></a>></span><br /> <span class="sc2"><<a href="http://december.com/html/4/element/head.html"><span class="kw2">head</span></a>></span><br /> &nbsp; <span class="sc2"><<a href="http://december.com/html/4/element/script.html"><span class="kw2">script</span></a> <span class="kw3">type</span><span class="sy0">=</span><span class="st0">"text/javascript"</span>></span><br /> &nbsp; &nbsp; var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");<br /> &nbsp; &nbsp; document.write("\<span class="sc2"><<a href="http://december.com/html/4/element/script.html"><span class="kw2">script</span></a> <span class="kw3">src</span><span class="sy0">=</span><span class="st0">'" + gaJsHost + "google-analytics.com/ga.js'</span> <span class="kw3">type</span><span class="sy0">=</span><span class="st0">'text/javascript'</span>></span>\<span class="sc2"><\<span class="sy0">/</span>script></span>" );<br /> &nbsp; <span class="sc2"><<span class="sy0">/</span><a href="http://december.com/html/4/element/script.html"><span class="kw2">script</span></a>></span><br /> &nbsp; <span class="sc2"><<a href="http://december.com/html/4/element/script.html"><span class="kw2">script</span></a> <span class="kw3">type</span><span class="sy0">=</span><span class="st0">"text/javascript"</span>></span><br /> &nbsp; &nbsp; var pageTracker = _gat._getTracker("UA-123456-1");<br /> &nbsp; &nbsp; pageTracker._initData();<br /> &nbsp; &nbsp; pageTracker._trackPageview();<br /> &nbsp; &nbsp; pageTracker._setVar("stop_counting_me");<br /> &nbsp; <span class="sc2"><<span class="sy0">/</span><a href="http://december.com/html/4/element/script.html"><span class="kw2">script</span></a>></span><br /> <span class="sc2"><<span class="sy0">/</span><a href="http://december.com/html/4/element/head.html"><span class="kw2">head</span></a>></span><br /> <span class="sc2"><<a href="http://december.com/html/4/element/body.html"><span class="kw2">body</span></a>></span><br /> <br /> <span class="sc2"><<span class="sy0">/</span><a href="http://december.com/html/4/element/body.html"><span class="kw2">body</span></a>></span><br /> <span class="sc2"><<span class="sy0">/</span><a href="http://december.com/html/4/element/html.html"><span class="kw2">html</span></a>></span>
        </div>
      </td>
    </tr>
  </table>
</div>

Then apply one filter as picture shown below.

[<img src="http://www.noppanit.com/wp-content/uploads/2010/09/Screen-shot-2010-09-24-at-13.24.46-300x168.png" alt="GA to exclude your own visits" title="Apply filter to exclude your own visits" width="300" height="168" class="alignnone size-medium wp-image-589" />][1]

And don&#8217;t forget to have a backup profile that doesn&#8217;t have any filter applied. 

This cookie is a 2-year cookie, so every time you install your new browser or use a new computer, don&#8217;t forget to visit this page http://www.yourdomain.com/thispage.html before going on to your website. 

To prove that you have successfully installed this code on your computer, try viewing your cookie within your browser and looking for _\_utmv, if the content shows something like this 155621156.stop\_counting\_me then you are good to go. This means that you have set a cookie variable named stop\_counting\_me. Then in filter manager you apply a filter to exclude out data by looking at stop\_counting_me variable.

 [1]: http://www.noppanit.com/wp-content/uploads/2010/09/Screen-shot-2010-09-24-at-13.24.46.png