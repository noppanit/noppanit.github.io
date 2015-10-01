---
title: Flask and RQ example for Heroku
author: Noppanit Charassinvichai
layout: post
permalink: /flask-and-rq-example-for-heroku/
dsq_thread_id:
  - 1126068755
categories:
  - Python
tags:
  - heroku
  - long-polling
  - python
  - rq
---
I have been struggling to find any example on the Internet on how to do long polling on Heroku with Flask and RQ. I know it&#8217;s relatively easy, but I just want to make it clear for my future self. 

It&#8217;s really simple.

<pre><div class="codecolorer-container python blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />15<br />
        </div>
      </td>
      
      <td>
        <div class="python codecolorer">
          <span class="sy0">@</span>app.<span class="me1">route</span><span class="br0">&#40;</span><span class="st0">'/get_word_count'</span><span class="sy0">,</span> methods<span class="sy0">=</span><span class="br0">&#91;</span><span class="st0">'POST'</span><span class="br0">&#93;</span><span class="br0">&#41;</span><br />
          <span class="kw1">def</span> get_word_count<span class="br0">&#40;</span><span class="br0">&#41;</span>:<br />
          &nbsp; &nbsp; data_json <span class="sy0">=</span> json.<span class="me1">loads</span><span class="br0">&#40;</span>request.<span class="me1">data</span><span class="br0">&#41;</span><br />
          &nbsp; &nbsp; job <span class="sy0">=</span> q.<span class="me1">enqueue</span><span class="br0">&#40;</span>word_counter.<span class="me1">count_words</span><span class="sy0">,</span> data_json<span class="br0">&#91;</span><span class="st0">"sentence"</span><span class="br0">&#93;</span><span class="br0">&#41;</span><br />
          &nbsp; &nbsp; <span class="kw1">return</span> job.<span class="me1">key</span><br />
          <br />
          <span class="sy0">@</span>app.<span class="me1">route</span><span class="br0">&#40;</span><span class="st0">"/get_word_count_result/&lt;job_key&gt;"</span><span class="sy0">,</span> methods<span class="sy0">=</span><span class="br0">&#91;</span><span class="st0">'GET'</span><span class="br0">&#93;</span><span class="br0">&#41;</span><br />
          <span class="kw1">def</span> get_word_count_result<span class="br0">&#40;</span>job_key<span class="br0">&#41;</span>:<br />
          &nbsp; &nbsp; job_key <span class="sy0">=</span> job_key.<span class="me1">replace</span><span class="br0">&#40;</span><span class="st0">"rq:job:"</span><span class="sy0">,</span> <span class="st0">""</span><span class="br0">&#41;</span><br />
          &nbsp; &nbsp; job <span class="sy0">=</span> Job.<span class="me1">fetch</span><span class="br0">&#40;</span>job_key<span class="sy0">,</span> connection<span class="sy0">=</span>conn<span class="br0">&#41;</span><br />
          <br />
          &nbsp; &nbsp; <span class="kw1">if</span><span class="br0">&#40;</span><span class="kw1">not</span> job.<span class="me1">is_finished</span><span class="br0">&#41;</span>:<br />
          &nbsp; &nbsp; &nbsp; &nbsp; <span class="kw1">return</span> <span class="st0">"Not yet"</span><span class="sy0">,</span> <span class="nu0">202</span><br />
          &nbsp; &nbsp; <span class="kw1">else</span>:<br />
          &nbsp; &nbsp; &nbsp; &nbsp; <span class="kw1">return</span> <span class="kw2">str</span><span class="br0">&#40;</span>job.<span class="me1">result</span><span class="br0">&#41;</span><span class="sy0">,</span> <span class="nu0">200</span>
        </div>
      </td>
    </tr>
  </table>
</div>

</pre>

The key is here

<div class="codecolorer-container python blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />
        </div>
      </td>
      
      <td>
        <div class="python codecolorer">
          job <span class="sy0">=</span> Job.<span class="me1">fetch</span><span class="br0">&#40;</span>job_key<span class="sy0">,</span> connection<span class="sy0">=</span>conn<span class="br0">&#41;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

The fetch command is used to get the job by job_id, you can also use

<div class="codecolorer-container text blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />
        </div>
      </td>
      
      <td>
        <div class="text codecolorer">
          get_current_job()
        </div>
      </td>
    </tr>
  </table>
</div>

as well, but I just want to make it clear that if there are more concurrent requests coming in, I&#8217;ll get the right result back. 

I posted an example here. [https://github.com/noppanit/heroku-flask-rq-worker][1]

 [1]: https://github.com/noppanit/heroku-flask-rq-worker "Python with RQ on Heroku"