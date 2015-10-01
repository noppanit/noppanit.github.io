---
title: 'Tutorial : Having some trouble with Prototype and jQuery?'
author: Noppanit Charassinvichai
layout: post
permalink: /tutorial-having-some-trouble-with-prototype-and-jquery/
jd_tweet_this:
  - yes
wp_jd_bitly:
  - http://bit.ly/8YiSKc
wp_jd_target:
  - http://bit.ly/8YiSKc
dsq_thread_id:
  - 267464700
categories:
  - Javascript
---
Am I the only one who has a problem when using both jQuery and Prototype. You would think why would I want to use those. Why not just use one framework. The reason is some plug-in is using jQuery, and some is using Prototype.

The problem is when I use both frameworks. They are conflict each other, because jQuery also uses $(&#8221;) and Prototype also uses $(&#8221;). And they cannot be used in the same namespace. So, how are we going to fix it?

Luckily, in jQuery, it has a way to fix it already. We use method jQuery.noConflict(); and whenever you want to use $(&#8221;) you use jQuery(&#8216;element&#8217;) instead. Simple as that.

<div class="codecolorer-container javascript blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />
        </div>
      </td>
      
      <td>
        <div class="javascript codecolorer">
          jQuery.<span class="me1">noConflict</span><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> <span class="co1">// Do something with jQuery</span><br /> jQuery<span class="br0">&#40;</span><span class="st0">"div p"</span><span class="br0">&#41;</span>.<span class="me1">hide</span><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> <span class="co1">// Do something with another library's $()</span><br /> $<span class="br0">&#40;</span><span class="st0">"content"</span><span class="br0">&#41;</span>.<span class="me1">style</span>.<span class="me1">display</span> <span class="sy0">=</span> <span class="st0">'none'</span><span class="sy0">;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

Reference: http://www.davidlano.com/2009/03/31/how-to-make-jquery-prototype-play-nice/