---
title: How to deal with java.util.ConcurrentModificationException with ArrayList
author: Noppanit Charassinvichai
layout: post
permalink: /how-to-deal-with-java-util-concurrentmodificationexception-with-arraylist/
dsq_thread_id:
  - 183380124
categories:
  - Java
---
It is literally occurred when you needed to modify the list while you are iterating it in the same time.  
I have two options for you to consider and use at your own risk.

This is the example that cause an error

<pre><div class="codecolorer-container java blackboard" style="overflow:auto;white-space:nowrap;width:100%;height:400px;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />15<br />16<br />17<br />18<br />19<br />20<br />21<br />
        </div>
      </td>
      
      <td>
        <div class="java codecolorer">
          <span class="kw1">import</span> <span class="co2">java.util.ArrayList</span><span class="sy0">;</span><br />
          <span class="kw1">import</span> <span class="co2">java.util.List</span><span class="sy0">;</span><br />
          <br />
          <span class="kw1">public</span> <span class="kw1">class</span> TestAddRemoveList<br />
          <span class="br0">&#123;</span><br />
          <br />
          &nbsp; <span class="kw1">public</span> <span class="kw1">static</span> <span class="kw4">void</span> main<span class="br0">&#40;</span> <a href="http://www.google.com/search?hl=en&q=allinurl%3Astring+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">String</span></a> args<span class="br0">&#91;</span><span class="br0">&#93;</span> <span class="br0">&#41;</span><br />
          &nbsp; <span class="br0">&#123;</span><br />
          &nbsp; &nbsp; List<span class="sy0">&lt;</span> <a href="http://www.google.com/search?hl=en&q=allinurl%3Astring+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">String</span></a> <span class="sy0">&gt;</span> list <span class="sy0">=</span> <span class="kw1">new</span> ArrayList<span class="sy0">&lt;</span> <a href="http://www.google.com/search?hl=en&q=allinurl%3Astring+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">String</span></a> <span class="sy0">&gt;</span><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; list.<span class="me1">add</span><span class="br0">&#40;</span><span class="st0">"A"</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; list.<span class="me1">add</span><span class="br0">&#40;</span><span class="st0">"B"</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; <br />
          &nbsp; &nbsp; <span class="kw1">for</span><span class="br0">&#40;</span> <a href="http://www.google.com/search?hl=en&q=allinurl%3Astring+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">String</span></a> str <span class="sy0">:</span> list <span class="br0">&#41;</span><br />
          &nbsp; &nbsp; <span class="br0">&#123;</span><br />
          &nbsp; &nbsp; &nbsp; <span class="kw1">if</span><span class="br0">&#40;</span> str.<span class="me1">equals</span><span class="br0">&#40;</span> <span class="st0">"B"</span> <span class="br0">&#41;</span> <span class="br0">&#41;</span><br />
          &nbsp; &nbsp; &nbsp; <span class="br0">&#123;</span><br />
          &nbsp; &nbsp; &nbsp; &nbsp; list.<span class="me1">remove</span><span class="br0">&#40;</span> <span class="kw1">new</span> <a href="http://www.google.com/search?hl=en&q=allinurl%3Astring+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">String</span></a><span class="br0">&#40;</span><span class="st0">"B"</span> <span class="br0">&#41;</span> <span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; &nbsp; <span class="br0">&#125;</span><br />
          &nbsp; &nbsp; <span class="br0">&#125;</span><br />
          &nbsp; <span class="br0">&#125;</span><br />
          <span class="br0">&#125;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

</pre>

This is the first option you could use [CopyOnWriteArrayList][1] but there are some drawbacks too. This is the modified result and it worked for me. 

<pre><div class="codecolorer-container java blackboard" style="overflow:auto;white-space:nowrap;width:100%;height:400px;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />15<br />16<br />17<br />18<br />19<br />20<br />21<br />
        </div>
      </td>
      
      <td>
        <div class="java codecolorer">
          <span class="kw1">import</span> <span class="co2">java.util.List</span><span class="sy0">;</span><br />
          <span class="kw1">import</span> <span class="co2">java.util.concurrent.CopyOnWriteArrayList</span><span class="sy0">;</span><br />
          <br />
          <span class="kw1">public</span> <span class="kw1">class</span> TestAddRemoveList<br />
          <span class="br0">&#123;</span><br />
          <br />
          &nbsp; <span class="kw1">public</span> <span class="kw1">static</span> <span class="kw4">void</span> main<span class="br0">&#40;</span> <a href="http://www.google.com/search?hl=en&q=allinurl%3Astring+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">String</span></a> args<span class="br0">&#91;</span><span class="br0">&#93;</span> <span class="br0">&#41;</span><br />
          &nbsp; <span class="br0">&#123;</span><br />
          &nbsp; &nbsp; List<span class="sy0">&lt;</span> <a href="http://www.google.com/search?hl=en&q=allinurl%3Astring+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">String</span></a> <span class="sy0">&gt;</span> list <span class="sy0">=</span> <span class="kw1">new</span> CopyOnWriteArrayList<span class="sy0">&lt;</span> <a href="http://www.google.com/search?hl=en&q=allinurl%3Astring+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">String</span></a> <span class="sy0">&gt;</span><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; list.<span class="me1">add</span><span class="br0">&#40;</span><span class="st0">"A"</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; list.<span class="me1">add</span><span class="br0">&#40;</span><span class="st0">"B"</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; <br />
          &nbsp; &nbsp; <span class="kw1">for</span><span class="br0">&#40;</span> <a href="http://www.google.com/search?hl=en&q=allinurl%3Astring+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">String</span></a> str <span class="sy0">:</span> list <span class="br0">&#41;</span><br />
          &nbsp; &nbsp; <span class="br0">&#123;</span><br />
          &nbsp; &nbsp; &nbsp; <span class="kw1">if</span><span class="br0">&#40;</span> str.<span class="me1">equals</span><span class="br0">&#40;</span> <span class="st0">"B"</span> <span class="br0">&#41;</span> <span class="br0">&#41;</span><br />
          &nbsp; &nbsp; &nbsp; <span class="br0">&#123;</span><br />
          &nbsp; &nbsp; &nbsp; &nbsp; list.<span class="me1">remove</span><span class="br0">&#40;</span> <span class="kw1">new</span> <a href="http://www.google.com/search?hl=en&q=allinurl%3Astring+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">String</span></a><span class="br0">&#40;</span><span class="st0">"B"</span> <span class="br0">&#41;</span> <span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; &nbsp; <span class="br0">&#125;</span><br />
          &nbsp; &nbsp; <span class="br0">&#125;</span><br />
          &nbsp; <span class="br0">&#125;</span><br />
          <span class="br0">&#125;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

</pre>

This is the other option. You could you iterator to modify the list

<pre><div class="codecolorer-container java blackboard" style="overflow:auto;white-space:nowrap;width:100%;height:400px;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />15<br />16<br />17<br />18<br />19<br />20<br />21<br />22<br />23<br />24<br />25<br />26<br />27<br />28<br />29<br />
        </div>
      </td>
      
      <td>
        <div class="java codecolorer">
          <span class="kw1">import</span> <span class="co2">java.util.ArrayList</span><span class="sy0">;</span><br />
          <span class="kw1">import</span> <span class="co2">java.util.Iterator</span><span class="sy0">;</span><br />
          <span class="kw1">import</span> <span class="co2">java.util.List</span><span class="sy0">;</span><br />
          <br />
          <span class="kw1">public</span> <span class="kw1">class</span> TestAddRemoveList<br />
          <span class="br0">&#123;</span><br />
          <br />
          &nbsp; <span class="kw1">public</span> <span class="kw1">static</span> <span class="kw4">void</span> main<span class="br0">&#40;</span> <a href="http://www.google.com/search?hl=en&q=allinurl%3Astring+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">String</span></a> args<span class="br0">&#91;</span><span class="br0">&#93;</span> <span class="br0">&#41;</span><br />
          &nbsp; <span class="br0">&#123;</span><br />
          &nbsp; &nbsp; List<span class="sy0">&lt;</span> <a href="http://www.google.com/search?hl=en&q=allinurl%3Astring+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">String</span></a> <span class="sy0">&gt;</span> list <span class="sy0">=</span> <span class="kw1">new</span> ArrayList<span class="sy0">&lt;</span> <a href="http://www.google.com/search?hl=en&q=allinurl%3Astring+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">String</span></a> <span class="sy0">&gt;</span><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; list.<span class="me1">add</span><span class="br0">&#40;</span><span class="st0">"A"</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; list.<span class="me1">add</span><span class="br0">&#40;</span><span class="st0">"B"</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; list.<span class="me1">add</span><span class="br0">&#40;</span><span class="st0">"C"</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; <br />
          &nbsp; &nbsp; <span class="kw1">for</span><span class="br0">&#40;</span> Iterator<span class="sy0">&lt;</span> <a href="http://www.google.com/search?hl=en&q=allinurl%3Astring+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">String</span></a> <span class="sy0">&gt;</span> it <span class="sy0">=</span> list.<span class="me1">iterator</span><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span> it.<span class="me1">hasNext</span><span class="br0">&#40;</span><span class="br0">&#41;</span> <span class="sy0">;</span> <span class="br0">&#41;</span><br />
          &nbsp; &nbsp; <span class="br0">&#123;</span><br />
          &nbsp; &nbsp; &nbsp; <a href="http://www.google.com/search?hl=en&q=allinurl%3Astring+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">String</span></a> str <span class="sy0">=</span> it.<span class="me1">next</span><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; &nbsp; <span class="kw1">if</span><span class="br0">&#40;</span> str.<span class="me1">equals</span><span class="br0">&#40;</span> <span class="st0">"B"</span> <span class="br0">&#41;</span> <span class="br0">&#41;</span><br />
          &nbsp; &nbsp; &nbsp; <span class="br0">&#123;</span><br />
          &nbsp; &nbsp; &nbsp; &nbsp; it.<span class="me1">remove</span><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; &nbsp; <span class="br0">&#125;</span><br />
          &nbsp; &nbsp; <span class="br0">&#125;</span><br />
          &nbsp; &nbsp; <br />
          &nbsp; &nbsp; <span class="kw1">for</span><span class="br0">&#40;</span> <a href="http://www.google.com/search?hl=en&q=allinurl%3Astring+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">String</span></a> str <span class="sy0">:</span> list <span class="br0">&#41;</span><br />
          &nbsp; &nbsp; <span class="br0">&#123;</span><br />
          &nbsp; &nbsp; &nbsp; <a href="http://www.google.com/search?hl=en&q=allinurl%3Asystem+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">System</span></a>.<span class="me1">out</span>.<span class="me1">println</span><span class="br0">&#40;</span> str <span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; <span class="br0">&#125;</span><br />
          &nbsp; <span class="br0">&#125;</span><br />
          <span class="br0">&#125;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

</pre>

 [1]: http://java.sun.com/javase/6/docs/api/java/util/concurrent/CopyOnWriteArrayList.html