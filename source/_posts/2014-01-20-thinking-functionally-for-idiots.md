---
title: Thinking functionally for idiots.
author: Noppanit Charassinvichai
layout: post
permalink: /thinking-functionally-for-idiots/
dsq_thread_id:
  - 2150341429
categories:
  - Java
tags:
  - functional
  - Java
---
I just want to write this post for myself and lucky people who found this post from Google. The world has come to the era of functional. When I pair with my colleagues I always hear &#8220;That&#8217;s not so functional&#8221; or &#8220;Should we use Guava or functional Java&#8221; or &#8220;Wouldn&#8217;t it be easier if we use Scala&#8221;?. What do these mean? Why should I have to care if my code looks functional and what benefits do I get. This post is going to be a really easy post to follow that&#8217;s why the title &#8220;Thinking functionally for idiots&#8221;. If you want more technical I highly recommend this [post][1] from Neal Ford.

**Why functional programming?**  
There are a few concepts of functional programming but you can find the full concepts [here][2]. I don&#8217;t really want to explain about higher-order or first-class functions because someone else can explain it better than myself. In summary, I really think the benefits of doing functional programming is you tend to avoid bugs and the code might be more readable. These can be achieved by avoiding state and mutable data which most of the sites seem to refer to these two benefits. I would like to show this in a simple example.

<div class="codecolorer-container java blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />
        </div>
      </td>
      
      <td>
        <div class="java codecolorer">
          &nbsp; &nbsp; &nbsp; &nbsp; List<span class="sy0"><</span>Integer<span class="sy0">></span> numbers <span class="sy0">=</span> <a href="http://www.google.com/search?hl=en&q=allinurl%3Aarrays+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">Arrays</span></a>.<span class="me1">asList</span><span class="br0">&#40;</span><span class="nu0">1</span>, <span class="nu0">2</span> ,<span class="nu0">3</span>, <span class="nu0">4</span>, <span class="nu0">5</span>, <span class="nu0">6</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> <br /> &nbsp; &nbsp; &nbsp; &nbsp; ArrayList<span class="sy0"><</span>Integer<span class="sy0">></span> multipledByTwo <span class="sy0">=</span> <span class="kw1">new</span> ArrayList<span class="sy0"><</span>Integer<span class="sy0">></span><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> <br /> &nbsp; &nbsp; &nbsp; &nbsp; <span class="kw1">for</span><span class="br0">&#40;</span><a href="http://www.google.com/search?hl=en&q=allinurl%3Ainteger+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">Integer</span></a> number <span class="sy0">:</span> numbers<span class="br0">&#41;</span> <span class="br0">&#123;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; multipledByTwo.<span class="me1">add</span><span class="br0">&#40;</span>number <span class="sy0">*</span> <span class="nu0">2</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; <span class="br0">&#125;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

You can see that this piece of code is really simple and what it&#8217;s doing is just multiply every element of the list by two. What&#8217;s wrong with this piece of code? First of all, **multipledByTwo** list acts like a temporary list which holds the answer and programmer can do something else with it. 

Let&#8217;s see another example. This is the modified version to be more functional.

<div class="codecolorer-container java blackboard" style="overflow:auto;white-space:nowrap;width:100%;height:400px;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />15<br />16<br />17<br />18<br />19<br />20<br />21<br />22<br />23<br />24<br />25<br />26<br />27<br />28<br />29<br />
        </div>
      </td>
      
      <td>
        <div class="java codecolorer">
          <span class="co1">// Interface</span><br /> <span class="kw1">public</span> <span class="kw1">interface</span> Function<span class="sy0"><</span>S, T<span class="sy0">></span> <span class="br0">&#123;</span><br /> &nbsp; &nbsp; T apply<span class="br0">&#40;</span>S in<span class="br0">&#41;</span><span class="sy0">;</span><br /> <span class="br0">&#125;</span><br /> <br /> <span class="co1">// MappingClass</span><br /> <span class="kw1">public</span> <span class="kw1">abstract</span> <span class="kw1">class</span> MappingClass<span class="sy0"><</span>S, T<span class="sy0">></span> <span class="br0">&#123;</span><br /> &nbsp; &nbsp; <span class="kw1">protected</span> List<span class="sy0"><</span>T<span class="sy0">></span> map<span class="br0">&#40;</span>List<span class="sy0"><</span>S<span class="sy0">></span> list, Function<span class="sy0"><</span>S, T<span class="sy0">></span> fun<span class="br0">&#41;</span> <span class="br0">&#123;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; List<span class="sy0"><</span>T<span class="sy0">></span> result <span class="sy0">=</span> <span class="kw1">new</span> ArrayList<span class="sy0"><</span>T<span class="sy0">></span><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; <span class="kw1">for</span><span class="br0">&#40;</span>S item <span class="sy0">:</span> list<span class="br0">&#41;</span> <span class="br0">&#123;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; result.<span class="me1">add</span><span class="br0">&#40;</span>fun.<span class="me1">apply</span><span class="br0">&#40;</span>item<span class="br0">&#41;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; <span class="br0">&#125;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; <span class="kw1">return</span> result<span class="sy0">;</span><br /> &nbsp; &nbsp; <span class="br0">&#125;</span><br /> <span class="br0">&#125;</span><br /> <br /> <span class="co1">// To Test</span><br /> <br /> &nbsp; &nbsp; <span class="kw1">public</span> List<span class="sy0"><</span>Integer<span class="sy0">></span> test<span class="br0">&#40;</span><span class="br0">&#41;</span> <span class="br0">&#123;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; List<span class="sy0"><</span>Integer<span class="sy0">></span> numbers <span class="sy0">=</span> asList<span class="br0">&#40;</span><span class="nu0">1</span>, <span class="nu0">2</span>, <span class="nu0">3</span>, <span class="nu0">4</span>, <span class="nu0">5</span>, <span class="nu0">6</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; List<span class="sy0"><</span>Integer<span class="sy0">></span> results <span class="sy0">=</span> map<span class="br0">&#40;</span>numbers, <span class="kw1">new</span> Function<span class="sy0"><</span><a href="http://www.google.com/search?hl=en&q=allinurl%3Ainteger+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">Integer</span></a>, Integer<span class="sy0">></span><span class="br0">&#40;</span><span class="br0">&#41;</span> <span class="br0">&#123;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; @Override<br /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span class="kw1">public</span> <a href="http://www.google.com/search?hl=en&q=allinurl%3Ainteger+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">Integer</span></a> apply<span class="br0">&#40;</span><a href="http://www.google.com/search?hl=en&q=allinurl%3Ainteger+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">Integer</span></a> input<span class="br0">&#41;</span> <span class="br0">&#123;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span class="kw1">return</span> input <span class="sy0">*</span> <span class="nu0">2</span><span class="sy0">;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span class="br0">&#125;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; <span class="br0">&#125;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> <br /> &nbsp; &nbsp; &nbsp; &nbsp; <span class="kw1">return</span> results<span class="sy0">;</span><br /> &nbsp; &nbsp; <span class="br0">&#125;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

We create one generic function which is the interface **Function** this will represent higher-order function which we can parse to another method. Then we create a recursive method which will execute the function and put in another list. This way we don&#8217;t create mutable object and we don&#8217;t retain any state. What comes in the function comes out as the results. 

What do you think? Is this better than the other? If it&#8217;s Java I highly doubt that. Java is still not mature enough to do functional programming. But things are looking better in Java 8.

 [1]: http://www.ibm.com/developerworks/java/library/j-ft1/index.html "Thinking functionally Part I"
 [2]: https://en.wikipedia.org/wiki/Functional_programming#Concepts