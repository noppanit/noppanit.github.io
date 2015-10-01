---
title: How to create a custom Function for JSTL
author: Noppanit Charassinvichai
layout: post
permalink: /how-to-create-a-custom-function-for-jstl/
jd_tweet_this:
  - yes
wp_jd_bitly:
  - http://bit.ly/99RjSd
wp_jd_target:
  - http://bit.ly/99RjSd
dsq_thread_id:
  - 183389142
categories:
  - Java
---
So just a quick post. How do we create a custom function for JSTL.

Let&#8217;s begin.

1. Create a .tld file under /WEB-INF

<div class="codecolorer-container xml blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />
        </div>
      </td>
      
      <td>
        <div class="xml codecolorer">
          <span class="sc3"><span class="re1"><?xml</span> <span class="re0">version</span>=<span class="st0">"1.0"</span> <span class="re0">encoding</span>=<span class="st0">"UTF-8"</span><span class="re2">?></span></span><br /> <span class="sc3"><span class="re1"><taglib</span> <span class="re0">version</span>=<span class="st0">"2.1"</span> <span class="re0">xmlns</span>=<span class="st0">"http://java.sun.com/xml/ns/javaee"</span> <span class="re0">xmlns:xsi</span>=<span class="st0">"http://www.w3.org/2001/XMLSchema-instance"</span> <span class="re0">xsi:schemaLocation</span>=<span class="st0">"http://java.sun.com/xml/ns/javaee http://java.sun.com/xml/ns/javaee/web-jsptaglibrary_2_1.xsd"</span><span class="re2">></span></span><br /> &nbsp; &nbsp; <span class="sc3"><span class="re1"><tlib-version<span class="re2">></span></span></span>1.0<span class="sc3"><span class="re1"></tlib-version<span class="re2">></span></span></span><br /> &nbsp; &nbsp; <span class="sc3"><span class="re1"><short-name<span class="re2">></span></span></span>mytlds<span class="sc3"><span class="re1"></short-name<span class="re2">></span></span></span><br /> &nbsp; &nbsp; <span class="sc3"><span class="re1"><uri<span class="re2">></span></span></span>http://www.noppanit.com/myTlds<span class="sc3"><span class="re1"></uri<span class="re2">></span></span></span><br /> &nbsp; &nbsp; <span class="sc3"><span class="re1"><function<span class="re2">></span></span></span><br /> &nbsp; &nbsp; &nbsp; &nbsp; <span class="sc3"><span class="re1"><name<span class="re2">></span></span></span>charAt<span class="sc3"><span class="re1"></name<span class="re2">></span></span></span><br /> &nbsp; &nbsp; &nbsp; &nbsp; <span class="sc3"><span class="re1"><function-class<span class="re2">></span></span></span>com.nc98.expressions.Functions<span class="sc3"><span class="re1"></function-class<span class="re2">></span></span></span><br /> &nbsp; &nbsp; &nbsp; &nbsp; <span class="sc3"><span class="re1"><function-signature<span class="re2">></span></span></span>char charAt(java.lang.String, int)<span class="sc3"><span class="re1"></function-signature<span class="re2">></span></span></span><br /> &nbsp; &nbsp; <span class="sc3"><span class="re1"></function<span class="re2">></span></span></span><br /> <span class="sc3"><span class="re1"></taglib<span class="re2">></span></span></span>
        </div>
      </td>
    </tr>
  </table>
</div>

2. Create a class

<div class="codecolorer-container java blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />
        </div>
      </td>
      
      <td>
        <div class="java codecolorer">
          <span class="kw1">package</span> <span class="co2">com.nc98.expressions</span><span class="sy0">;</span><br /> <br /> <span class="co3">/**<br /> &nbsp;*<br /> &nbsp;* @author freaking_crack<br /> &nbsp;*/</span><br /> <span class="kw1">public</span> <span class="kw1">class</span> Functions<br /> <span class="br0">&#123;</span><br /> &nbsp; &nbsp; <span class="kw1">public</span> <span class="kw1">static</span> <span class="kw4">char</span> charAt<span class="br0">&#40;</span><a href="http://www.google.com/search?hl=en&q=allinurl%3Astring+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">String</span></a> input, <span class="kw4">int</span> index<span class="br0">&#41;</span><br /> &nbsp; &nbsp; <span class="br0">&#123;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; <span class="kw1">return</span> input.<span class="me1">charAt</span><span class="br0">&#40;</span>index<span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; <span class="br0">&#125;</span><br /> <span class="br0">&#125;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

3. And then use it.

<div class="codecolorer-container html4strict blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />
        </div>
      </td>
      
      <td>
        <div class="html4strict codecolorer">
          <span class="sc2"><%@page contentType<span class="sy0">=</span><span class="st0">"text/html"</span> pageEncoding<span class="sy0">=</span><span class="st0">"UTF-8"</span>%></span><br /> <span class="sc0"><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"</span><br /> <span class="sc0"> &nbsp; &nbsp;"http://www.w3.org/TR/html4/loose.dtd"></span><br /> <span class="sc2"><%@taglib uri<span class="sy0">=</span><span class="st0">"http://java.sun.com/jsp/jstl/core"</span> prefix<span class="sy0">=</span><span class="st0">"c"</span> %></span><br /> <span class="sc2"><%@taglib uri<span class="sy0">=</span><span class="st0">"http://www.noppanit.com/myTlds"</span> prefix<span class="sy0">=</span><span class="st0">"mt"</span> %></span><br /> <span class="sc2"><<a href="http://december.com/html/4/element/html.html"><span class="kw2">html</span></a>></span><br /> &nbsp; &nbsp; <span class="sc2"><<a href="http://december.com/html/4/element/head.html"><span class="kw2">head</span></a>></span><br /> &nbsp; &nbsp; &nbsp; &nbsp; <span class="sc2"><<a href="http://december.com/html/4/element/meta.html"><span class="kw2">meta</span></a> <span class="kw3">http-equiv</span><span class="sy0">=</span><span class="st0">"Content-Type"</span> <span class="kw3">content</span><span class="sy0">=</span><span class="st0">"text/html; charset=UTF-8"</span>></span><br /> &nbsp; &nbsp; &nbsp; &nbsp; <span class="sc2"><<a href="http://december.com/html/4/element/title.html"><span class="kw2">title</span></a>></span>JSP Page<span class="sc2"><<span class="sy0">/</span><a href="http://december.com/html/4/element/title.html"><span class="kw2">title</span></a>></span><br /> &nbsp; &nbsp; <span class="sc2"><<span class="sy0">/</span><a href="http://december.com/html/4/element/head.html"><span class="kw2">head</span></a>></span><br /> &nbsp; &nbsp; <span class="sc2"><<a href="http://december.com/html/4/element/body.html"><span class="kw2">body</span></a>></span><br /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ${mt:charAt("AB",0)} <span class="sc-1"><!-- It will give you A--></span><br /> &nbsp; &nbsp; <span class="sc2"><<span class="sy0">/</span><a href="http://december.com/html/4/element/body.html"><span class="kw2">body</span></a>></span><br /> <span class="sc2"><<span class="sy0">/</span><a href="http://december.com/html/4/element/html.html"><span class="kw2">html</span></a>></span>
        </div>
      </td>
    </tr>
  </table>
</div>