---
title: Contextual Preloading for Ajax request.
author: Noppanit Charassinvichai
layout: post
permalink: /contextual-preloading-ajax-request/
dsq_thread_id:
  - 2675297282
categories:
  - Javascript
tags:
  - ajax
  - javascript
  - zepto
---
I have just heard this from my friend [@rajveerr][1] about pre-loading at the global level, this concept is not new but I have just learned it.. Usually and I think everyone has done it before. People would do something like this.

<div class="codecolorer-container javascript blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />
        </div>
      </td>
      
      <td>
        <div class="javascript codecolorer">
          $<span class="br0">&#40;</span><span class="st0">'#link1'</span><span class="br0">&#41;</span>.<span class="me1">on</span><span class="br0">&#40;</span><span class="st0">'click'</span><span class="sy0">,</span> <span class="kw2">function</span> <span class="br0">&#40;</span>e<span class="br0">&#41;</span> <span class="br0">&#123;</span><br /> &nbsp; &nbsp; <span class="co1">// Do some funky spinning wheel</span><br /> &nbsp; &nbsp; $.<span class="me1">ajax</span><span class="br0">&#40;</span><span class="br0">&#123;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; url<span class="sy0">:</span> <span class="st0">'/echo/json'</span><span class="sy0">,</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; success <span class="sy0">:</span> <span class="kw2">function</span> <span class="br0">&#40;</span>data<span class="br0">&#41;</span> <span class="br0">&#123;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span class="co1">// Cancel that funky spinning wheel</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; <span class="br0">&#125;</span><br /> &nbsp; &nbsp; <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="sy0">;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

And you have to do this for every single ajax request. So, here&#8217;s how you would do that in a contextual level. 



The trick is that in each ajax request you need to add context option. I used zepto as an example but jquery should work the same. The reason is that is **e.target** behaves differently each browser. Also, usually Ajax request would be fired from **#document** level that means your **e.target** would be your </p> 

<div class="codecolorer-container javascript blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />
        </div>
      </td>
      
      <td>
        <div class="javascript codecolorer">
          $<span class="br0">&#40;</span><span class="st0">'#link1'</span><span class="br0">&#41;</span>.<span class="me1">on</span><span class="br0">&#40;</span><span class="st0">'click'</span><span class="sy0">,</span> <span class="kw2">function</span> <span class="br0">&#40;</span>e<span class="br0">&#41;</span> <span class="br0">&#123;</span><br /> &nbsp; &nbsp; $.<span class="me1">ajax</span><span class="br0">&#40;</span><span class="br0">&#123;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; url<span class="sy0">:</span> <span class="st0">'/echo/json'</span><span class="sy0">,</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; <span class="sy0"><</span>strong<span class="sy0">></span>context<span class="sy0">:</span> e.<span class="me1">target</span><span class="sy0"></</span>strong<span class="sy0">>,</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; success <span class="sy0">:</span> <span class="kw2">function</span> <span class="br0">&#40;</span>data<span class="br0">&#41;</span> <span class="br0">&#123;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; console.<span class="me1">log</span><span class="br0">&#40;</span>data<span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; <span class="br0">&#125;</span><br /> &nbsp; &nbsp; <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="sy0">;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

By doing this if you want your pre-loader you just need to add **.ajaxContainer** class to your container.

 [1]: https://twitter.com/rajveerr "rajveerr twitter"