---
title: 'Tutorial : How to use javascript to force users only put Number on textfield'
author: Noppanit Charassinvichai
layout: post
permalink: /tutorial-how-to-use-javascript-to-force-users-only-put-number-on-textfield/
jd_tweet_this:
  - yes
wp_jd_bitly:
  - http://bit.ly/4vOgKi
wp_jd_target:
  - http://www.noppanit.com/tutorial-how-to-use-javascript-to-force-users-only-put-number-on-textfield/
dsq_thread_id:
  - 559560033
categories:
  - Javascript
---
<div class="codecolorer-container javascript blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />15<br />16<br />17<br />18<br />19<br />20<br />
        </div>
      </td>
      
      <td>
        <div class="javascript codecolorer">
          <span class="kw2">function</span> numberOnly <span class="br0">&#40;</span> e <span class="br0">&#41;</span><br /> &nbsp; <span class="br0">&#123;</span><br /> &nbsp; &nbsp; <span class="kw2">var</span> keynum<span class="sy0">;</span><br /> &nbsp; &nbsp; <span class="kw2">var</span> keychar<span class="sy0">;</span><br /> &nbsp; &nbsp; <span class="kw2">var</span> numcheck<span class="sy0">;</span><br /> <br /> &nbsp; &nbsp; <span class="kw1">if</span><span class="br0">&#40;</span>window.<span class="me1">event</span><span class="br0">&#41;</span> <span class="co1">// IE</span><br /> &nbsp; &nbsp; <span class="br0">&#123;</span><br /> &nbsp; &nbsp; &nbsp; keynum <span class="sy0">=</span> e.<span class="me1">keyCode</span><span class="sy0">;</span><br /> &nbsp; &nbsp; <span class="br0">&#125;</span><br /> &nbsp; &nbsp; <span class="kw1">else</span> <span class="kw1">if</span><span class="br0">&#40;</span>e.<span class="me1">which</span><span class="br0">&#41;</span> <span class="co1">// Netscape/Firefox/Opera</span><br /> &nbsp; &nbsp; <span class="br0">&#123;</span><br /> &nbsp; &nbsp; &nbsp; keynum <span class="sy0">=</span> e.<span class="me1">which</span><span class="sy0">;</span><br /> &nbsp; &nbsp; <span class="br0">&#125;</span><br /> &nbsp; &nbsp; <br /> &nbsp; &nbsp; keychar <span class="sy0">=</span> String.<span class="me1">fromCharCode</span><span class="br0">&#40;</span>keynum<span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; numcheck <span class="sy0">=</span> <span class="co2">/\d|[\b]/</span><span class="sy0">;</span><br /> &nbsp; &nbsp; <br /> &nbsp; &nbsp; <span class="kw1">return</span> numcheck.<span class="me1">test</span><span class="br0">&#40;</span>keychar<span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; <span class="br0">&#125;</span>
        </div>
      </td>
    </tr>
  </table>
</div>