---
title: Python to import your dumped tweets to MongoDb
author: Noppanit Charassinvichai
layout: post
permalink: /python-import-dumped-tweets-mongodb/
dsq_thread_id:
  - 1707250802
categories:
  - Python
---
I&#8217;m playing around with my tweets. Just so you&#8217;re aware that you could download your entire tweets and play around with it. The format is JSON so I think it makes perfect sense to dump this to MongoDB. But you can&#8217;t just import that straight away it needs some manipulation. I&#8217;m not good at Python so the code here might be tedious for python dudes. I&#8217;m going to use this data in my analysis, which will be captured in the next blog post.

<div class="codecolorer-container python blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />15<br />16<br />
        </div>
      </td>
      
      <td>
        <div class="python codecolorer">
          <span class="kw1">import</span> pymongo<br /> <span class="kw1">from</span> <span class="kw3">pprint</span> <span class="kw1">import</span> <span class="kw3">pprint</span><br /> <br /> path <span class="sy0">=</span> <span class="st0">'./data'</span><br /> client <span class="sy0">=</span> pymongo.<span class="me1">MongoClient</span><span class="br0">&#40;</span><span class="st0">'localhost'</span><span class="sy0">,</span> <span class="nu0">27017</span><span class="br0">&#41;</span><br /> db <span class="sy0">=</span> client.<span class="me1">tweets</span><br /> <span class="kw1">def</span> main<span class="br0">&#40;</span><span class="br0">&#41;</span>:<br /> &nbsp; &nbsp; &nbsp; &nbsp; <span class="kw1">for</span> infile <span class="kw1">in</span> <span class="kw3">glob</span>.<span class="kw3">glob</span><span class="br0">&#40;</span> <span class="kw3">os</span>.<span class="me1">path</span>.<span class="me1">join</span><span class="br0">&#40;</span>path<span class="sy0">,</span> <span class="st0">"*.js"</span><span class="br0">&#41;</span><span class="br0">&#41;</span>:<br /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; content <span class="sy0">=</span> <span class="kw2">open</span><span class="br0">&#40;</span>infile<span class="br0">&#41;</span>.<span class="me1">read</span><span class="br0">&#40;</span><span class="br0">&#41;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; indexOfFirstEqualSign <span class="sy0">=</span> content.<span class="me1">find</span><span class="br0">&#40;</span><span class="st0">"="</span><span class="br0">&#41;</span> + <span class="nu0">1</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; pureJson <span class="sy0">=</span> content<span class="br0">&#91;</span>indexOfFirstEqualSign:<span class="br0">&#93;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; jsonifedData <span class="sy0">=</span> json.<span class="me1">loads</span><span class="br0">&#40;</span>pureJson<span class="br0">&#41;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; db.<span class="me1">tweets_collection</span>.<span class="me1">insert</span><span class="br0">&#40;</span>jsonifedData<span class="br0">&#41;</span><br /> <br /> <span class="kw1">if</span> __name__ <span class="sy0">==</span> <span class="st0">"__main__"</span>:<br /> &nbsp; &nbsp; &nbsp; &nbsp; main<span class="br0">&#40;</span><span class="br0">&#41;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

The data is kept in **data** folder.