---
title: How to use java.util.Timer to repeat the task
author: Noppanit Charassinvichai
layout: post
permalink: /how-to-use-java-util-timer-to-repeat-the-task/
dsq_thread_id:
  - 183519978
categories:
  - Java
---
This is how I do it.

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
          <span class="kw1">import</span> <span class="co2">java.util.Timer</span><span class="sy0">;</span><br /> <br /> <span class="kw1">import</span> <span class="co2">java.util.TimerTask</span><span class="sy0">;</span><br /> <br /> <span class="co3">/**<br /> &nbsp;* <br /> &nbsp;* This class uses the java.util.Timer functionality<br /> &nbsp;* The class will repeat itself every second.<br /> &nbsp;* <br /> &nbsp;* @author Toy<br /> &nbsp;*/</span><br /> <br /> <span class="kw1">public</span> <span class="kw1">class</span> Main<br /> <span class="br0">&#123;</span><br /> &nbsp; <span class="kw1">public</span> <span class="kw1">static</span> <span class="kw4">void</span> main<span class="br0">&#40;</span><a href="http://www.google.com/search?hl=en&q=allinurl%3Astring+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">String</span></a><span class="br0">&#91;</span><span class="br0">&#93;</span> args<span class="br0">&#41;</span> <span class="kw1">throws</span> <a href="http://www.google.com/search?hl=en&q=allinurl%3Aexception+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">Exception</span></a><br /> &nbsp; <span class="br0">&#123;</span><br /> &nbsp; &nbsp; <span class="kw4">int</span> delay <span class="sy0">=</span> <span class="nu0">5000</span><span class="sy0">;</span> <span class="co1">// delay for 5 sec.</span><br /> &nbsp; &nbsp; <span class="kw4">int</span> period <span class="sy0">=</span> <span class="nu0">1000</span><span class="sy0">;</span> <span class="co1">// repeat every sec.</span><br /> <br /> &nbsp; &nbsp; <a href="http://www.google.com/search?hl=en&q=allinurl%3Atimer+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">Timer</span></a> timer <span class="sy0">=</span> <span class="kw1">new</span> <a href="http://www.google.com/search?hl=en&q=allinurl%3Atimer+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">Timer</span></a><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; timer.<span class="me1">scheduleAtFixedRate</span><span class="br0">&#40;</span><span class="kw1">new</span> <a href="http://www.google.com/search?hl=en&q=allinurl%3Atimertask+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">TimerTask</span></a><span class="br0">&#40;</span><span class="br0">&#41;</span><br /> &nbsp; &nbsp; &nbsp; <span class="br0">&#123;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; <span class="kw1">public</span> <span class="kw4">void</span> run<span class="br0">&#40;</span><span class="br0">&#41;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; <span class="br0">&#123;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a href="http://www.google.com/search?hl=en&q=allinurl%3Asystem+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">System</span></a>.<span class="me1">out</span>.<span class="me1">println</span><span class="br0">&#40;</span><span class="st0">"done"</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; <span class="br0">&#125;</span><br /> &nbsp; &nbsp; &nbsp; <span class="br0">&#125;</span>, delay, period<span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; <span class="br0">&#125;</span><br /> <span class="br0">&#125;</span>
        </div>
      </td>
    </tr>
  </table>
</div>