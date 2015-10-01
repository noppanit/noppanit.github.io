---
title: 'Tutorial : Namespaces for javascript'
author: Noppanit Charassinvichai
layout: post
permalink: /tutorial-namespaces-for-javascript/
jd_tweet_this:
  - yes
wp_jd_bitly:
  - http://bit.ly/4A3AQW
wp_jd_target:
  - http://www.noppanit.com/tutorial-namespaces-for-javascript/
dsq_thread_id:
  - 289589990
categories:
  - Javascript
---
Have you ever had a problem using somebody method with the same name. Well, Have you ever thought why javascript don&#8217;t have package or namespaces like other languages. Well, change your mind. This is how you will be implementing namespaces for javascript.

<div class="codecolorer-container javascript blackboard" style="overflow:auto;white-space:nowrap;width:100%;height:400px;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />15<br />16<br />17<br />18<br />19<br />20<br />21<br />22<br />23<br />24<br />25<br />26<br />27<br />
        </div>
      </td>
      
      <td>
        <div class="javascript codecolorer">
          <span class="sy0"><</span>script type<span class="sy0">=</span><span class="st0">"text/javascript"</span><span class="sy0">></span><br /> <span class="kw1">if</span> <span class="br0">&#40;</span> com <span class="sy0">==</span> <span class="kw2">null</span> <span class="sy0">||</span> <span class="kw1">typeof</span><span class="br0">&#40;</span> com <span class="br0">&#41;</span> <span class="sy0">!=</span> <span class="st0">"object"</span> <span class="br0">&#41;</span> <br /> <span class="br0">&#123;</span><br /> &nbsp; <span class="kw2">var</span> com <span class="sy0">=</span> <span class="kw2">new</span> Object<span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> <span class="br0">&#125;</span><br /> <br /> <span class="kw1">if</span> <span class="br0">&#40;</span> com.<span class="me1">noppanit</span> <span class="sy0">==</span> <span class="kw2">null</span> <span class="sy0">||</span> <span class="kw1">typeof</span><span class="br0">&#40;</span> com.<span class="me1">noppanit</span> <span class="br0">&#41;</span> <span class="sy0">!=</span> <span class="st0">"object"</span> <span class="br0">&#41;</span> <br /> <span class="br0">&#123;</span><br /> &nbsp; com.<span class="me1">noppanit</span> <span class="sy0">=</span> <span class="kw2">new</span> Object<span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span> <br /> <span class="br0">&#125;</span><br /> <br /> com.<span class="me1">noppanit</span> <span class="sy0">=</span> <br /> <span class="br0">&#123;</span> <br /> &nbsp; message <span class="sy0">:</span> <span class="kw2">function</span><span class="br0">&#40;</span><span class="br0">&#41;</span> <br /> &nbsp; <span class="br0">&#123;</span> <br /> &nbsp; &nbsp; <span class="kw3">alert</span><span class="br0">&#40;</span><span class="st0">'test'</span><span class="br0">&#41;</span><span class="sy0">;</span> <br /> &nbsp; <span class="br0">&#125;</span><span class="sy0">,</span> <br /> &nbsp; message1 <span class="sy0">:</span> <span class="kw2">function</span><span class="br0">&#40;</span><span class="br0">&#41;</span> <br /> &nbsp; <span class="br0">&#123;</span> <br /> &nbsp; &nbsp; <span class="kw3">alert</span><span class="br0">&#40;</span><span class="st0">'test1'</span><span class="br0">&#41;</span><span class="sy0">;</span> <br /> &nbsp; <span class="br0">&#125;</span> <br /> <span class="sy0">;</span> <br /> <br /> com.<span class="me1">noppanit</span>.<span class="me1">message</span><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span> <br /> com.<span class="me1">noppanit</span>.<span class="me1">message1</span><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span> <br /> <br /> <span class="sy0"></</span>script<span class="sy0">></span>
        </div>
      </td>
    </tr>
  </table>
</div>