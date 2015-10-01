---
title: 'Example: How did I convert async code to sync code with Promise.'
author: Noppanit Charassinvichai
layout: post
permalink: /example-how-did-i-convert-async-code-to-sync-code-with-promise/
dsq_thread_id:
  - 3789211664
categories:
  - Javascript
tags:
  - javascript
  - node.js
  - promise
---
I&#8217;ve just finished my first refactor to convert my node.js code to be more promisey (I believe that&#8217;s the word they use these days). There&#8217;s lots of documents out there to do this. However, I thought I should contribute more to help me understand more and might get some feedback from people who&#8217;s seen it as well.

I&#8217;m trying to create a bot to report me back the performance of my site in desktop and mobile mode. So, I thought it would be easy since Google has an [API][1] for that already so I went ahead and did this.

<pre><div class="codecolorer-container javascript blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />
        </div>
      </td>
      
      <td>
        <div class="javascript codecolorer">
          <span class="kw2">var</span> request <span class="sy0">=</span> require<span class="br0">&#40;</span><span class="st0">'request'</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          <span class="kw2">var</span> urlToGetTheScore <span class="sy0">=</span> <span class="st0">'https://www.googleapis.com/pagespeedonline/v2/runPagespeed?url=http://www.noppanit.com&amp;strategy=desktop&amp;fields=ruleGroups'</span><br />
          <br />
          request.<span class="me1">get</span><span class="br0">&#40;</span>urlToGetTheScore<span class="sy0">,</span> <span class="kw2">function</span> <span class="br0">&#40;</span>error<span class="sy0">,</span> response<span class="sy0">,</span> body<span class="br0">&#41;</span> <span class="br0">&#123;</span><br />
          &nbsp; <span class="kw1">if</span><span class="br0">&#40;</span>error<span class="br0">&#41;</span> console.<span class="me1">log</span><span class="br0">&#40;</span>error<span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; <br />
          &nbsp; console.<span class="me1">log</span><span class="br0">&#40;</span>JSON.<span class="me1">parse</span><span class="br0">&#40;</span>body<span class="br0">&#41;</span>.<span class="me1">ruleGroups</span>.<span class="me1">SPEED</span>.<span class="me1">score</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="sy0">;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

</pre>

It&#8217;s pretty easy and straight forward right but now that would only return the score of desktop. I need the score of my mobile site as well. So, I added more code to be like this.

<pre><div class="codecolorer-container javascript blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />15<br />16<br />17<br />
        </div>
      </td>
      
      <td>
        <div class="javascript codecolorer">
          <span class="kw2">var</span> request <span class="sy0">=</span> require<span class="br0">&#40;</span><span class="st0">'request'</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          <br />
          <span class="kw2">var</span> urlToGetTheScoreDesktop <span class="sy0">=</span> <span class="st0">'https://www.googleapis.com/pagespeedonline/v2/runPagespeed?url=http://www.noppanit.com&amp;strategy=desktop&amp;fields=ruleGroups'</span><br />
          <br />
          <span class="kw2">var</span> urlToGetTheScoreMobile <span class="sy0">=</span> <span class="st0">'https://www.googleapis.com/pagespeedonline/v2/runPagespeed?url=http://www.noppanit.com&amp;strategy=mobile&amp;fields=ruleGroups'</span><br />
          <br />
          request.<span class="me1">get</span><span class="br0">&#40;</span>urlToGetTheScoreDesktop<span class="sy0">,</span> <span class="kw2">function</span> <span class="br0">&#40;</span>error<span class="sy0">,</span> response<span class="sy0">,</span> body<span class="br0">&#41;</span> <span class="br0">&#123;</span><br />
          &nbsp; <span class="kw1">if</span><span class="br0">&#40;</span>error<span class="br0">&#41;</span> console.<span class="me1">log</span><span class="br0">&#40;</span>error<span class="br0">&#41;</span><span class="sy0">;</span><br />
          <br />
          &nbsp; console.<span class="me1">log</span><span class="br0">&#40;</span>JSON.<span class="me1">parse</span><span class="br0">&#40;</span>body<span class="br0">&#41;</span>.<span class="me1">ruleGroups</span>.<span class="me1">SPEED</span>.<span class="me1">score</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          <br />
          request.<span class="me1">get</span><span class="br0">&#40;</span>urlToGetTheScoreMobile<span class="sy0">,</span> <span class="kw2">function</span> <span class="br0">&#40;</span>error<span class="sy0">,</span> response<span class="sy0">,</span> body<span class="br0">&#41;</span> <span class="br0">&#123;</span><br />
          &nbsp; <span class="kw1">if</span><span class="br0">&#40;</span>error<span class="br0">&#41;</span> console.<span class="me1">log</span><span class="br0">&#40;</span>error<span class="br0">&#41;</span><span class="sy0">;</span><br />
          <br />
          &nbsp; console.<span class="me1">log</span><span class="br0">&#40;</span>JSON.<span class="me1">parse</span><span class="br0">&#40;</span>body<span class="br0">&#41;</span>.<span class="me1">ruleGroups</span>.<span class="me1">SPEED</span>.<span class="me1">score</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="sy0">;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

</pre>

That&#8217;s great but I want to return both scores to a client so I can report the scores rather than printing them to the console. Since, **request** is asynchronous you cannot guarantee which score would come first. So, I thought it&#8217;s easy. I just need to call one request after the other. So, I came up with this.

<pre><div class="codecolorer-container javascript blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />15<br />16<br />17<br />18<br />19<br />
        </div>
      </td>
      
      <td>
        <div class="javascript codecolorer">
          <span class="kw2">var</span> request <span class="sy0">=</span> require<span class="br0">&#40;</span><span class="st0">'request'</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          <br />
          <span class="kw2">var</span> urlToGetTheScoreDesktop <span class="sy0">=</span> <span class="st0">'https://www.googleapis.com/pagespeedonline/v2/runPagespeed?url=http://www.noppanit.com&amp;strategy=desktop&amp;fields=ruleGroups'</span><br />
          <br />
          <span class="kw2">var</span> urlToGetTheScoreMobile <span class="sy0">=</span> <span class="st0">'https://www.googleapis.com/pagespeedonline/v2/runPagespeed?url=http://www.noppanit.com&amp;strategy=mobile&amp;fields=ruleGroups'</span><br />
          <br />
          request.<span class="me1">get</span><span class="br0">&#40;</span>urlToGetTheScoreDesktop<span class="sy0">,</span> <span class="kw2">function</span> <span class="br0">&#40;</span>error<span class="sy0">,</span> response<span class="sy0">,</span> body<span class="br0">&#41;</span> <span class="br0">&#123;</span><br />
          &nbsp; <span class="kw1">if</span><span class="br0">&#40;</span>error<span class="br0">&#41;</span> reject<span class="br0">&#40;</span>error<span class="br0">&#41;</span><span class="sy0">;</span><br />
          <br />
          &nbsp; <span class="kw2">var</span> desktopScore <span class="sy0">=</span> JSON.<span class="me1">parse</span><span class="br0">&#40;</span>body<span class="br0">&#41;</span>.<span class="me1">ruleGroups</span>.<span class="me1">SPEED</span>.<span class="me1">score</span><span class="sy0">;</span><br />
          <br />
          &nbsp; request.<span class="me1">get</span><span class="br0">&#40;</span>urlToGetTheScoreMobile<span class="sy0">,</span> <span class="kw2">function</span> <span class="br0">&#40;</span>error<span class="sy0">,</span> response<span class="sy0">,</span> body<span class="br0">&#41;</span> <span class="br0">&#123;</span><br />
          &nbsp; &nbsp; <span class="kw1">if</span><span class="br0">&#40;</span>error<span class="br0">&#41;</span> reject<span class="br0">&#40;</span>error<span class="br0">&#41;</span><span class="sy0">;</span><br />
          <br />
          &nbsp; &nbsp; <span class="kw2">var</span> mobileScore <span class="sy0">=</span> JSON.<span class="me1">parse</span><span class="br0">&#40;</span>body<span class="br0">&#41;</span>.<span class="me1">ruleGroups</span>.<span class="me1">SPEED</span>.<span class="me1">score</span><span class="sy0">;</span><br />
          <br />
          &nbsp; &nbsp; console.<span class="me1">log</span><span class="br0">&#40;</span><span class="st0">'desktop score is '</span> <span class="sy0">+</span> desktopScore <span class="sy0">+</span> <span class="st0">' and mobile score is '</span> <span class="sy0">+</span> mobileScore<span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="sy0">;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

</pre>

&nbsp;

Look at how ugly it is. Now I want to make it prettier. So, I will use Promise to make it look nicer. As a good engineer I need to create a test first.

<pre><div class="codecolorer-container javascript blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />15<br />16<br />17<br />18<br />19<br />
        </div>
      </td>
      
      <td>
        <div class="javascript codecolorer">
          <span class="kw2">var</span> perfModule <span class="sy0">=</span> require<span class="br0">&#40;</span><span class="st0">'./pagespeed'</span><span class="br0">&#41;</span><span class="sy0">,</span><br />
          sinon <span class="sy0">=</span> require<span class="br0">&#40;</span><span class="st0">'sinon'</span><span class="br0">&#41;</span><span class="sy0">,</span><br />
          request <span class="sy0">=</span> require<span class="br0">&#40;</span><span class="st0">'request'</span><span class="br0">&#41;</span><span class="sy0">,</span><br />
          expect <span class="sy0">=</span> require<span class="br0">&#40;</span><span class="st0">'expect.js'</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          <br />
          describe<span class="br0">&#40;</span><span class="st0">'Performance'</span><span class="sy0">,</span> <span class="kw2">function</span><span class="br0">&#40;</span><span class="br0">&#41;</span> <span class="br0">&#123;</span><br />
          <span class="kw2">var</span> server<span class="sy0">;</span><br />
          &nbsp; beforeEach<span class="br0">&#40;</span><span class="kw2">function</span><span class="br0">&#40;</span>done<span class="br0">&#41;</span> <span class="br0">&#123;</span><br />
          &nbsp; &nbsp; sinon.<span class="me1">stub</span><span class="br0">&#40;</span>request<span class="sy0">,</span> <span class="st0">'get'</span><span class="br0">&#41;</span>.<span class="me1">yields</span><span class="br0">&#40;</span><span class="kw2">null</span><span class="sy0">,</span> <span class="kw2">null</span><span class="sy0">,</span> JSON.<span class="me1">stringify</span><span class="br0">&#40;</span><span class="br0">&#123;</span>ruleGroups <span class="sy0">:</span> <span class="br0">&#123;</span> SPEED<span class="sy0">:</span> <span class="br0">&#123;</span>score<span class="sy0">:</span><span class="nu0">10</span><span class="br0">&#125;</span><span class="br0">&#125;</span> <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; done<span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; <br />
          &nbsp; it<span class="br0">&#40;</span><span class="st0">'should send performance stats to chat room'</span><span class="sy0">,</span> <span class="kw2">function</span><span class="br0">&#40;</span>done<span class="br0">&#41;</span> <span class="br0">&#123;</span><br />
          &nbsp; &nbsp; perfModule.<span class="me1">pagespeed</span><span class="br0">&#40;</span><span class="kw2">function</span><span class="br0">&#40;</span>donotknow<span class="sy0">,</span> msg<span class="br0">&#41;</span> <span class="br0">&#123;</span><br />
          &nbsp; &nbsp; &nbsp; done<span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; &nbsp; expect<span class="br0">&#40;</span>msg<span class="br0">&#41;</span>.<span class="me1">to</span>.<span class="me1">eql</span><span class="br0">&#40;</span><span class="st0">'desktop speed is 10 and mobile speed is 10'</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="sy0">;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

</pre>

I&#8217;m using [Sinon.js][2] as the mocking framework and [Mocha][3] as the testing framework which are pretty standard.

Now I can start refactor my code. At first, I wrote some code like this, just to make it work.

<pre><div class="codecolorer-container javascript blackboard" style="overflow:auto;white-space:nowrap;width:100%;height:400px;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />15<br />16<br />17<br />18<br />19<br />20<br />21<br />22<br />23<br />24<br />
        </div>
      </td>
      
      <td>
        <div class="javascript codecolorer">
          <span class="kw2">var</span> request <span class="sy0">=</span> require<span class="br0">&#40;</span><span class="st0">'request'</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          <br />
          <span class="kw2">var</span> getSpeed <span class="sy0">=</span> <span class="kw2">function</span><span class="br0">&#40;</span>strategy<span class="br0">&#41;</span> <span class="br0">&#123;</span><br />
          &nbsp; <span class="kw2">var</span> url <span class="sy0">=</span> <span class="st0">'https://www.googleapis.com/pagespeedonline/v2/runPagespeed?url=http://www.noppanit.com&amp;strategy='</span><span class="sy0">+</span> strategy <span class="sy0">+</span> <span class="st0">'&amp;fields=ruleGroups'</span><br />
          &nbsp; <span class="kw1">return</span> <span class="kw2">new</span> Promise<span class="br0">&#40;</span><span class="kw2">function</span><span class="br0">&#40;</span>resolve<span class="sy0">,</span> reject<span class="br0">&#41;</span> <span class="br0">&#123;</span><br />
          &nbsp; &nbsp; request.<span class="me1">get</span><span class="br0">&#40;</span>url<span class="sy0">,</span> <span class="kw2">function</span> <span class="br0">&#40;</span>error<span class="sy0">,</span> response<span class="sy0">,</span> body<span class="br0">&#41;</span> <span class="br0">&#123;</span><br />
          &nbsp; &nbsp; &nbsp; <span class="kw1">if</span><span class="br0">&#40;</span>error<span class="br0">&#41;</span> reject<span class="br0">&#40;</span>error<span class="br0">&#41;</span><span class="sy0">;</span><br />
          <br />
          &nbsp; &nbsp; &nbsp; console.<span class="me1">log</span><span class="br0">&#40;</span>body<span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; &nbsp; resolve<span class="br0">&#40;</span>JSON.<span class="me1">parse</span><span class="br0">&#40;</span>body<span class="br0">&#41;</span>.<span class="me1">ruleGroups</span>.<span class="me1">SPEED</span>.<span class="me1">score</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          <span class="br0">&#125;</span><span class="sy0">;</span><br />
          <br />
          <span class="kw2">var</span> pagespeed <span class="sy0">=</span> <span class="kw2">function</span><span class="br0">&#40;</span>cb<span class="br0">&#41;</span> <span class="br0">&#123;</span><br />
          &nbsp; getSpeed<span class="br0">&#40;</span><span class="st0">'desktop'</span><span class="br0">&#41;</span>.<span class="me1">then</span><span class="br0">&#40;</span><span class="kw2">function</span><span class="br0">&#40;</span>desktopSpeed<span class="br0">&#41;</span> <span class="br0">&#123;</span><br />
          &nbsp; &nbsp; getSpeed<span class="br0">&#40;</span><span class="st0">'mobile'</span><span class="br0">&#41;</span>.<span class="me1">then</span><span class="br0">&#40;</span><span class="kw2">function</span><span class="br0">&#40;</span>mobileSpeed<span class="br0">&#41;</span> <span class="br0">&#123;</span><br />
          &nbsp; &nbsp; &nbsp; console.<span class="me1">log</span><span class="br0">&#40;</span><span class="st0">'desktop speed is '</span> <span class="sy0">+</span> desktopSpeed <span class="sy0">+</span> <span class="st0">' and mobile speed is '</span> <span class="sy0">+</span> mobileSpeed<span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          <br />
          &nbsp; <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          <span class="br0">&#125;</span><span class="sy0">;</span><br />
          <br />
          exports.<span class="me1">pagespeed</span> <span class="sy0">=</span> pagespeed<span class="sy0">;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

</pre>

Any good JavaScript developer would be like, WTH!. You still have callbacks. I thought Promise would solve that issue already! Now, I could use the power of **Promise.all** which takes array of promises and return array of results. My final code would look something like this.

<pre><div class="codecolorer-container javascript blackboard" style="overflow:auto;white-space:nowrap;width:100%;height:400px;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />15<br />16<br />17<br />18<br />19<br />20<br />21<br />22<br />23<br />24<br />25<br />26<br />27<br />
        </div>
      </td>
      
      <td>
        <div class="javascript codecolorer">
          <span class="kw2">var</span> request <span class="sy0">=</span> require<span class="br0">&#40;</span><span class="st0">'request'</span><span class="br0">&#41;</span><span class="sy0">,</span><br />
          Promise <span class="sy0">=</span> require<span class="br0">&#40;</span><span class="st0">'promise'</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          <br />
          <span class="kw2">var</span> getSpeed <span class="sy0">=</span> <span class="kw2">function</span><span class="br0">&#40;</span>strategy<span class="br0">&#41;</span> <span class="br0">&#123;</span><br />
          &nbsp; <span class="kw2">var</span> url <span class="sy0">=</span> <span class="st0">'https://www.googleapis.com/pagespeedonline/v2/runPagespeed?url=http%3A%2F%2Ffusion.net&amp;strategy='</span><span class="sy0">+</span> strategy <span class="sy0">+</span> <span class="st0">'&amp;fields=ruleGroups'</span><br />
          &nbsp; <span class="kw1">return</span> <span class="kw2">new</span> Promise<span class="br0">&#40;</span><span class="kw2">function</span><span class="br0">&#40;</span>resolve<span class="sy0">,</span> reject<span class="br0">&#41;</span> <span class="br0">&#123;</span><br />
          &nbsp; &nbsp; request.<span class="me1">get</span><span class="br0">&#40;</span>url<span class="sy0">,</span> <span class="kw2">function</span> <span class="br0">&#40;</span>error<span class="sy0">,</span> response<span class="sy0">,</span> body<span class="br0">&#41;</span> <span class="br0">&#123;</span><br />
          &nbsp; &nbsp; &nbsp; <span class="kw1">if</span><span class="br0">&#40;</span>error<span class="br0">&#41;</span> reject<span class="br0">&#40;</span>error<span class="br0">&#41;</span><span class="sy0">;</span><br />
          <br />
          &nbsp; &nbsp; &nbsp; console.<span class="me1">log</span><span class="br0">&#40;</span>body<span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; &nbsp; resolve<span class="br0">&#40;</span>JSON.<span class="me1">parse</span><span class="br0">&#40;</span>body<span class="br0">&#41;</span>.<span class="me1">ruleGroups</span>.<span class="me1">SPEED</span>.<span class="me1">score</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          <span class="br0">&#125;</span><span class="sy0">;</span><br />
          <br />
          <span class="kw2">var</span> pagespeed <span class="sy0">=</span> <span class="kw2">function</span><span class="br0">&#40;</span>cb<span class="br0">&#41;</span> <span class="br0">&#123;</span><br />
          &nbsp; Promise.<span class="me1">all</span><span class="br0">&#40;</span><span class="br0">&#91;</span>getSpeed<span class="br0">&#40;</span><span class="st0">'desktop'</span><span class="br0">&#41;</span><span class="sy0">,</span> getSpeed<span class="br0">&#40;</span><span class="st0">'mobile'</span><span class="br0">&#41;</span><span class="br0">&#93;</span><span class="br0">&#41;</span>.<span class="me1">then</span><span class="br0">&#40;</span><span class="kw2">function</span><span class="br0">&#40;</span>speed<span class="br0">&#41;</span> <span class="br0">&#123;</span><br />
          &nbsp; &nbsp; <span class="kw2">var</span> desktop <span class="sy0">=</span> speed<span class="br0">&#91;</span><span class="nu0"></span><span class="br0">&#93;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; <span class="kw2">var</span> mobile <span class="sy0">=</span> speed<span class="br0">&#91;</span><span class="nu0">1</span><span class="br0">&#93;</span><span class="sy0">;</span><br />
          <br />
          &nbsp; &nbsp; console.<span class="me1">log</span><span class="br0">&#40;</span><span class="kw2">null</span><span class="sy0">,</span> <span class="st0">'desktop speed is '</span> <span class="sy0">+</span> desktop <span class="sy0">+</span> <span class="st0">' and mobile speed is '</span> <span class="sy0">+</span> mobile<span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; <span class="br0">&#125;</span><span class="br0">&#41;</span>.<span class="kw1">catch</span><span class="br0">&#40;</span><span class="kw2">function</span><span class="br0">&#40;</span>error<span class="br0">&#41;</span> <span class="br0">&#123;</span><br />
          &nbsp; &nbsp; console.<span class="me1">log</span><span class="br0">&#40;</span>error<span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          <span class="br0">&#125;</span><span class="sy0">;</span><br />
          <br />
          exports.<span class="me1">pagespeed</span> <span class="sy0">=</span> pagespeed<span class="sy0">;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

</pre>

I&#8217;m not an expert in Promise and I welcome any feedback that would help improve my code.

Reference  
[ES6 Promises][4]  
[We have a problem with promises][5]

 [1]: https://developers.google.com/speed/docs/insights/v2/getting-started
 [2]: http://sinonjs.org/
 [3]: http://mochajs.org/
 [4]: http://www.html5rocks.com/en/tutorials/es6/promises/
 [5]: http://pouchdb.com/2015/05/18/we-have-a-problem-with-promises.html