---
title: Event delegation in JavaScript is fast but how fast?
author: Noppanit Charassinvichai
layout: post
permalink: /event-delegation-javascript-fast-fast/
dsq_thread_id:
  - 3250313472
categories:
  - Javascript
tags:
  - javascript
  - performance
---
People say always use event delegation for adding event because it&#8217;s faster. But how fast exactly? I really want to create a test case for this, but I couldn&#8217;t figure out how to run B[enchmark.js][1] in browser. So, I thought we could just use Chrome Developer Tool to achieve this. 

## What are we measuring?

As I said in the beginning, we want to know how fast event delegation is compared to direct binding that most people do. For example, I&#8217;ve always seen people do this

<div class="codecolorer-container javascript blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />
        </div>
      </td>
      
      <td>
        <div class="javascript codecolorer">
          $<span class="br0">&#40;</span><span class="st0">'#ul li'</span><span class="br0">&#41;</span>.<span class="me1">on</span><span class="br0">&#40;</span><span class="st0">'click'</span><span class="sy0">,</span> <span class="kw2">function</span><span class="br0">&#40;</span><span class="br0">&#41;</span> <span class="br0">&#123;</span><br /> &nbsp; <span class="co1">// doing something amazing.</span><br /> <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="sy0">;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

What is actually doing is, jQuery will add the event to each of the **li** in the DOM. If you have 3-4 lis, then I don&#8217;t think it&#8217;s going to make a big difference. However, if you have a thousand lis, you will see some difference. I&#8217;ll show you by using Chrome Developer Tool. 

## What do we need?

We need some basic HTML 

It&#8217;s going to be something like this

<div class="codecolorer-container html4strict blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />
        </div>
      </td>
      
      <td>
        <div class="html4strict codecolorer">
          <span class="sc2"><<a href="http://december.com/html/4/element/ul.html"><span class="kw2">ul</span></a> <span class="kw3">id</span><span class="sy0">=</span><span class="st0">"parent"</span>></span><br /> &nbsp; <span class="sc2"><<a href="http://december.com/html/4/element/li.html"><span class="kw2">li</span></a>><<span class="sy0">/</span><a href="http://december.com/html/4/element/li.html"><span class="kw2">li</span></a>></span><br /> &nbsp; // 999 more <span class="sc2"><<a href="http://december.com/html/4/element/li.html"><span class="kw2">li</span></a>></span><br /> <span class="sc2"><<span class="sy0">/</span><a href="http://december.com/html/4/element/ul.html"><span class="kw2">ul</span></a>></span>
        </div>
      </td>
    </tr>
  </table>
</div>

Then we will have JavaScript like this

<div class="codecolorer-container javascript blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />
        </div>
      </td>
      
      <td>
        <div class="javascript codecolorer">
          <span class="sy0"><</span>script src<span class="sy0">=</span><span class="st0">"https://code.jquery.com/jquery-1.11.1.min.js"</span><span class="sy0">></</span>script<span class="sy0">></span><br /> <span class="sy0"><</span>script<span class="sy0">></span><br /> &nbsp; &nbsp; $<span class="br0">&#40;</span><span class="st0">'#parent li'</span><span class="br0">&#41;</span>.<span class="me1">on</span><span class="br0">&#40;</span><span class="st0">'click'</span><span class="sy0">,</span> <span class="kw2">function</span><span class="br0">&#40;</span><span class="br0">&#41;</span> <span class="br0">&#123;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; console.<span class="me1">log</span><span class="br0">&#40;</span><span class="st0">'you clicked me!'</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> <br /> <span class="sy0"></</span>script<span class="sy0">></span>
        </div>
      </td>
    </tr>
  </table>
</div>

If you open your html page on Chrome you should see something like this.  
[<img src="http://www.noppanit.com/wp-content/uploads/2014/11/Screen-Shot-2014-11-21-at-7.06.19-PM.png" alt="Screen Shot 2014-11-21 at 7.06.19 PM" width="2264" height="988" class="aligncenter size-full wp-image-1349" />][2]

If you go down to where JavaScript is executed You will see it takes around **37ms** to execute the snippet.  
[<img src="http://www.noppanit.com/wp-content/uploads/2014/11/Screen-Shot-2014-11-21-at-7.07.18-PM.png" alt="Screen Shot 2014-11-21 at 7.07.18 PM" width="1352" height="985" class="aligncenter size-full wp-image-1350" />][3]

Now change your snippet to be event delegation

<div class="codecolorer-container javascript blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />
        </div>
      </td>
      
      <td>
        <div class="javascript codecolorer">
          <span class="sy0"><</span>script src<span class="sy0">=</span><span class="st0">"https://code.jquery.com/jquery-1.11.1.min.js"</span><span class="sy0">></</span>script<span class="sy0">></span><br /> <span class="sy0"><</span>script<span class="sy0">></span><br /> &nbsp; &nbsp; $<span class="br0">&#40;</span><span class="st0">'#parent'</span><span class="br0">&#41;</span>.<span class="me1">on</span><span class="br0">&#40;</span><span class="st0">'click'</span><span class="sy0">,</span> <span class="st0">'li'</span><span class="sy0">,</span> <span class="kw2">function</span><span class="br0">&#40;</span><span class="br0">&#41;</span> <span class="br0">&#123;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; console.<span class="me1">log</span><span class="br0">&#40;</span><span class="st0">'you clicked me!'</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> <br /> <span class="sy0"></</span>script<span class="sy0">></span>
        </div>
      </td>
    </tr>
  </table>
</div>

And refresh the page you should see something like this.  
[<img src="http://www.noppanit.com/wp-content/uploads/2014/11/Screen-Shot-2014-11-21-at-7.12.02-PM.png" alt="Screen Shot 2014-11-21 at 7.12.02 PM" width="1352" height="986" class="aligncenter size-full wp-image-1353" />][4]

Now it will only take **2ms** to execute the snippet. It&#8217;s because the event is added to one element not 1000 of them. 

This is just an easy example that you can do it yourself to improve your performance.

 [1]: http://benchmarkjs.com/ "benchmark.js"
 [2]: http://www.noppanit.com/wp-content/uploads/2014/11/Screen-Shot-2014-11-21-at-7.06.19-PM.png
 [3]: http://www.noppanit.com/wp-content/uploads/2014/11/Screen-Shot-2014-11-21-at-7.07.18-PM.png
 [4]: http://www.noppanit.com/wp-content/uploads/2014/11/Screen-Shot-2014-11-21-at-7.12.02-PM.png