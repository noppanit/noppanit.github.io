---
title: 'Tutorial Javascript : Stealing methods from Other Objects'
author: Noppanit Charassinvichai
layout: post
permalink: /tutorial-javascript-stealing-methods-from-other-objects/
dsq_thread_id:
  - 196075455
categories:
  - Javascript
---
<pre><div class="codecolorer-container javascript blackboard" style="overflow:auto;white-space:nowrap;width:100%;height:400px;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />15<br />16<br />17<br />18<br />19<br />20<br />21<br />
        </div>
      </td>
      
      <td>
        <div class="javascript codecolorer">
          <span class="kw2">function</span> copyFromArray<span class="br0">&#40;</span><span class="br0">&#41;</span><br />
          <span class="br0">&#123;</span><br />
          &nbsp; document.<span class="kw1">write</span><span class="br0">&#40;</span> <span class="st0">"Before Slicing : "</span> <span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; printArray<span class="br0">&#40;</span> arguments <span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; document.<span class="kw1">write</span><span class="br0">&#40;</span><span class="st0">"&lt;br/&gt;"</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; <br />
          &nbsp; <span class="co1">//steal slice from Array.prototype</span><br />
          &nbsp; <span class="kw2">var</span> slice <span class="sy0">=</span> Array.<span class="me1">prototype</span>.<span class="me1">slice</span><span class="sy0">;</span><br />
          &nbsp; <span class="kw2">var</span> slicedArguments <span class="sy0">=</span> slice.<span class="me1">call</span><span class="br0">&#40;</span> arguments<span class="sy0">,</span> <span class="nu0">1</span> <span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; document.<span class="kw1">write</span><span class="br0">&#40;</span> <span class="st0">"After Slicing : "</span> <span class="sy0">+</span> slicedArguments<span class="br0">&#41;</span><span class="sy0">;</span><br />
          <span class="br0">&#125;</span><br />
          <br />
          <span class="kw2">function</span> printArray<span class="br0">&#40;</span> arry <span class="br0">&#41;</span><br />
          <span class="br0">&#123;</span><br />
          &nbsp; <span class="kw1">for</span><span class="br0">&#40;</span> <span class="kw2">var</span> i <span class="sy0">=</span> <span class="nu0"></span><span class="sy0">;</span> i <span class="sy0">&lt;</span> arry.<span class="me1">length</span> <span class="sy0">;</span> i<span class="sy0">++</span> <span class="br0">&#41;</span><br />
          &nbsp; <span class="br0">&#123;</span><br />
          &nbsp; &nbsp; document.<span class="kw1">write</span><span class="br0">&#40;</span> arry<span class="br0">&#91;</span> i <span class="br0">&#93;</span> <span class="sy0">+</span> <span class="st0">","</span> <span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; <span class="br0">&#125;</span><br />
          <span class="br0">&#125;</span><br />
          <br />
          copyFromArray<span class="br0">&#40;</span> <span class="nu0">1</span><span class="sy0">,</span><span class="nu0">3</span><span class="sy0">,</span><span class="nu0">5</span> <span class="br0">&#41;</span> <span class="sy0">;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

</pre>