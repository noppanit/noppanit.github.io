---
title: MapReduce for dummies.
author: Noppanit Charassinvichai
layout: post
permalink: /mapreduce-dummies/
dsq_thread_id:
  - 2065609458
categories:
  - Knowledges
tags:
  - big-data
  - map reduce
---
If you are a programmer or work in IT organisations. You must have heard the term &#8220;MapReduce&#8221; at some point. Some of you might be like myself, wondering what does it mean. It&#8217;s coined by very smart people from Google ([reference][1]). So, it must be good. Also, you must have heard this little project called &#8220;[Hadoop][2]&#8221; as an opensource for MapReduce. I have known it for a while but never get a full understanding of what it really means. People always mention that &#8220;Oh, you have a lot of data, MapReduce is very fast. Use that&#8221; but ever wonder why? 

So, I would like to explain this to my blog as Einstein once said <a href="http://www.brainyquote.com/quotes/quotes/a/alberteins383803.html#y5CAlRzOrI20wJPS.99"" title="einstein quote">&#8220;If you can&#8217;t explain it simply, you don&#8217;t understand it well enough&#8221;</a>. 

If you like reading then this [article][3] is for you, written by Jeff and Sanjay from Google.

Here&#8217;s my version of what it means. MapReduce consists of two parts. Map and Reduce, Duh? I think the terms is a bit confusing if you don&#8217;t know what it means but I don&#8217;t know what to call it instead of this either. Let&#8217;s have a look at the first part Map. 

Map really is like what we know in every language. **Map<Key, Value>** in Java. It has key and value. For example, if your country wants to run an election, you have four parties to choose from Party A, Party B, Party C and Party D. It&#8217;d be like this.

<div id="attachment_1255" style="width: 816px" class="wp-caption aligncenter">
  <a href="http://www.noppanit.com/wp-content/uploads/2013/12/Screen-Shot-2013-12-21-at-21.34.00.png"><img src="http://www.noppanit.com/wp-content/uploads/2013/12/Screen-Shot-2013-12-21-at-21.34.00.png" alt="City election scores" width="806" height="203" class="size-full wp-image-1255" /></a>
  
  <p class="wp-caption-text">
    City election scores
  </p>
</div>

The key would be your party name. The value would be the votes for each of the key. So, this is how would you process in your computer. Let&#8217;s go back a little bit and have a look at raw data.

<div class="codecolorer-container text blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />15<br />
        </div>
      </td>
      
      <td>
        <div class="text codecolorer">
          PartyA, 10<br /> PartyA, 5<br /> PartyA, 2<br /> PartyB, 5<br /> PartyB, 10<br /> PartyB, 20<br /> PartyB, 30<br /> PartyC, 9<br /> PartyC, 8<br /> PartyC, 7<br /> PartyC, 5<br /> PartyD, 2<br /> PartyD, 1<br /> PartyD, 8<br /> PartyD, 3
        </div>
      </td>
    </tr>
  </table>
</div>

Then you would get something like this in Ruby. (If I show the code how I transformed this many ruby programmers might scream at me so you can do whatever you like to make it like that)

<div class="codecolorer-container ruby blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />
        </div>
      </td>
      
      <td>
        <div class="ruby codecolorer">
          <span class="br0">&#123;</span><span class="st0">"Party A"</span><span class="sy0">=></span><span class="br0">&#91;</span><span class="nu0">10</span>, <span class="nu0">5</span>, <span class="nu0">9</span>, <span class="nu0">2</span><span class="br0">&#93;</span><span class="br0">&#125;</span><br /> <span class="br0">&#123;</span><span class="st0">"Party B"</span><span class="sy0">=></span><span class="br0">&#91;</span><span class="nu0">5</span>, <span class="nu0">10</span>, <span class="nu0">20</span>, <span class="nu0">30</span><span class="br0">&#93;</span><span class="br0">&#125;</span><br /> <span class="br0">&#123;</span><span class="st0">"Party C"</span><span class="sy0">=></span><span class="br0">&#91;</span><span class="nu0">9</span>, <span class="nu0">8</span>, <span class="nu0">7</span>, <span class="nu0">5</span><span class="br0">&#93;</span><span class="br0">&#125;</span><br /> <span class="br0">&#123;</span><span class="st0">"Party D"</span><span class="sy0">=></span><span class="br0">&#91;</span><span class="nu0">2</span>, <span class="nu0">1</span>, <span class="nu0">8</span>, <span class="nu0">3</span><span class="br0">&#93;</span><span class="br0">&#125;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

Now the part &#8220;Map&#8221; is done we can do the next part which is reduce. Reduce is where you process your data at your will on each key to get one or zero result. In this case we want to get the summation of the votes on each party. Luckily ruby comes with this already.

<div class="codecolorer-container ruby blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />
        </div>
      </td>
      
      <td>
        <div class="ruby codecolorer">
          <span class="br0">&#91;</span><span class="nu0">10</span>, <span class="nu0">5</span>, <span class="nu0">9</span>, <span class="nu0">2</span><span class="br0">&#93;</span>.<span class="me1">reduce</span><span class="br0">&#40;</span>:<span class="sy0">+</span><span class="br0">&#41;</span> <span class="co1"># => 26</span><br /> <span class="br0">&#91;</span><span class="nu0">5</span>, <span class="nu0">10</span>, <span class="nu0">20</span>, <span class="nu0">30</span><span class="br0">&#93;</span>.<span class="me1">reduce</span><span class="br0">&#40;</span>:<span class="sy0">+</span><span class="br0">&#41;</span> <span class="co1"># => 65</span><br /> <span class="br0">&#91;</span><span class="nu0">9</span>, <span class="nu0">8</span>, <span class="nu0">7</span>, <span class="nu0">5</span><span class="br0">&#93;</span>.<span class="me1">reduce</span><span class="br0">&#40;</span>:<span class="sy0">+</span><span class="br0">&#41;</span> <span class="co1"># => 29</span><br /> <span class="br0">&#91;</span><span class="nu0">2</span>, <span class="nu0">1</span>, <span class="nu0">8</span>, <span class="nu0">3</span><span class="br0">&#93;</span>.<span class="me1">reduce</span><span class="br0">&#40;</span>:<span class="sy0">+</span><span class="br0">&#41;</span> <span class="co1"># => 14</span>
        </div>
      </td>
    </tr>
  </table>
</div>

That&#8217;s it now we know that PartyB won the election. 

So, here&#8217;s the important question. Why it&#8217;s fast?  
Imagine, if in your country you have 100 cities and each city sends all the cards to the capital city to count, the process would be sequential and might be slow. So, we delegate that to each city then send the final result back to the capital city. That&#8217;s why you will hear a lot of people talking about &#8220;node&#8221;, &#8220;cluster&#8221; or &#8220;distributed&#8221; in MapReduce, because we delegate that to thousands of machines connected together. The classic example on the Internet right now is word counts which imagine how many documents or websites Google has to process each day. 

That&#8217;s it. Any feedback is very welcome.

Reference:  
<http://www-01.ibm.com/software/data/infosphere/hadoop/mapreduce/>  
<https://hadoop.apache.org/docs/r1.1.1/mapred_tutorial.html>  
<http://www.onebigfluke.com/2013/01/why-is-map-reduce-faster-practical.html>  
<http://stevekrenzel.com/finding-friends-with-mapreduce>

 [1]: https://en.wikipedia.org/wiki/Mapreduce "MapReduce"
 [2]: https://hadoop.apache.org/ "Hadoop"
 [3]: https://www.usenix.org/legacy/publications/library/proceedings/osdi04/tech/full_papers/dean/dean_html/ "MapReduce: Simplified Data Processing on Large Clusters"