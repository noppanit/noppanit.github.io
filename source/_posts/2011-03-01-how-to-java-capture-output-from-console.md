---
title: 'How to : Java capture output from console'
author: Noppanit Charassinvichai
layout: post
permalink: /how-to-java-capture-output-from-console/
dsq_thread_id:
  - 243225146
categories:
  - Java
---
Well, the topic pretty says everything. So, here&#8217;s the solution.

<div class="codecolorer-container java blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />
        </div>
      </td>
      
      <td>
        <div class="java codecolorer">
          <span class="kw1">final</span> <a href="http://www.google.com/search?hl=en&q=allinurl%3Abytearrayoutputstream+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">ByteArrayOutputStream</span></a> myOut <span class="sy0">=</span> <span class="kw1">new</span> <a href="http://www.google.com/search?hl=en&q=allinurl%3Abytearrayoutputstream+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">ByteArrayOutputStream</span></a><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> <a href="http://www.google.com/search?hl=en&q=allinurl%3Asystem+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">System</span></a>.<span class="me1">setOut</span><span class="br0">&#40;</span><span class="kw1">new</span> <a href="http://www.google.com/search?hl=en&q=allinurl%3Aprintstream+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">PrintStream</span></a><span class="br0">&#40;</span>myOut<span class="br0">&#41;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> <br /> <span class="co1">// test stuff here...</span><br /> <br /> <span class="kw1">final</span> <a href="http://www.google.com/search?hl=en&q=allinurl%3Astring+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">String</span></a> standardOutput <span class="sy0">=</span> myOut.<span class="me1">toString</span><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

The idea is just redirect the System.out to another PrintStream and you can use information in the PrintStream.