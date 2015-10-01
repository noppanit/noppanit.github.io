---
title: 'Tutorial : Javascript with &#8220;rel&#8221; attribute'
author: Noppanit Charassinvichai
layout: post
permalink: /tutorial-javascript-with-rel-attribute/
dsq_thread_id:
  - 195612995
categories:
  - Knowledges
tags:
  - javascript rel
---
I have been struggling to figure out how to use &#8220;rel&#8221; attribute in <a> link. With no luck, because the only time I use &#8220;rel&#8221; is with Lightbox. lol</p> 

<p>
  However, this is the code that get all the elements with rel tag and you can use them whatever you want.
</p>

<div class="codecolorer-container javascript blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />
        </div>
      </td>
      
      <td>
        <div class="javascript codecolorer">
          <span class="kw2">var</span> getElemsByRel <span class="sy0">=</span> <span class="kw2">function</span><span class="br0">&#40;</span>rel<span class="br0">&#41;</span><br /> <span class="br0">&#123;</span><br /> &nbsp; &nbsp; aElements <span class="sy0">=</span> document.<span class="me1">getElementsByTagName</span><span class="br0">&#40;</span><span class="st0">"a"</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; relElems <span class="sy0">=</span> <span class="br0">&#91;</span><span class="br0">&#93;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; <span class="kw1">for</span> <span class="br0">&#40;</span>i <span class="sy0">=</span> <span class="nu0"></span><span class="sy0">;</span> i <span class="sy0"><</span> aElements.<span class="me1">length</span><span class="sy0">;</span> i<span class="sy0">++</span><span class="br0">&#41;</span> <span class="br0">&#123;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; <span class="kw1">if</span> <span class="br0">&#40;</span>aElements<span class="br0">&#91;</span>i<span class="br0">&#93;</span>.<span class="me1">hasAttribute</span><span class="br0">&#40;</span><span class="st0">"rel"</span><span class="br0">&#41;</span> <span class="sy0">&&</span> aElements<span class="br0">&#91;</span>i<span class="br0">&#93;</span>.<span class="me1">rel</span> <span class="sy0">==</span> rel<span class="br0">&#41;</span> <span class="br0">&#123;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; relElems.<span class="me1">append</span><span class="br0">&#40;</span>aElements<span class="br0">&#91;</span>i<span class="br0">&#93;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; <span class="br0">&#125;</span><br /> &nbsp; &nbsp; <span class="br0">&#125;</span><br /> &nbsp; <span class="kw1">return</span> relElems<span class="sy0">;</span><br /> <span class="br0">&#125;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

<p>
  Reference:<br /> http://blog.adambard.com/2008/06/01/javascript-tip-use-the-rel-attribute/
</p>