---
title: Dependency Injection with Spring by example
author: Noppanit Charassinvichai
layout: post
permalink: /dependency-injection-with-spring-by-example/
dsq_thread_id:
  - 212399493
categories:
  - Java
---
I think every developer these days have heard this term &#8220;Dependency Injection&#8221; or &#8220;Inversion of Control&#8221; before Martin Fowler coined the term &#8220;Dependency Injection&#8221;. And how many people are confused by that? Or may be I&#8217;m the only one who does not know what it means by injecting something into something and every developer should be happy about it.

I really recommend you to read this article first by [Martin Folwer][1], he has explained it in a very simple way and easy to understand. Additionally, I cannot think of any simpler example to explain than of Martin&#8217;s article. So, please do read Martin&#8217;s article and Spring in Action for more information.

So, in my example and this is purely from my understanding.

A class student that needs to go to school. You can see that student class is tightly coupled with the class FindARouteToSchool. You can&#8217;t have Student without FindARouteToSchool. This is not so bad, but many developers find it not flexible enough. We need to promote loosely coupled.

<div class="codecolorer-container java blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />15<br />16<br />
        </div>
      </td>
      
      <td>
        <div class="java codecolorer">
          <span class="kw1">public</span> <span class="kw1">class</span> Student<br /> <span class="br0">&#123;</span><br /> &nbsp; FindARouteToSchool findARoute<span class="sy0">;</span><br /> &nbsp; <br /> &nbsp; <span class="kw1">public</span> <span class="kw4">void</span> goToSchool<span class="br0">&#40;</span><span class="br0">&#41;</span><br /> &nbsp; <span class="br0">&#123;</span><br /> &nbsp; &nbsp; findARoute <span class="sy0">=</span> <span class="kw1">new</span> GoByBus<span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; findARoute.<span class="me1">go</span><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; <span class="br0">&#125;</span><br /> &nbsp; <br /> &nbsp; <span class="kw1">public</span> <span class="kw1">static</span> <span class="kw4">void</span> main <span class="br0">&#40;</span> <a href="http://www.google.com/search?hl=en&q=allinurl%3Astring+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">String</span></a> args<span class="br0">&#91;</span><span class="br0">&#93;</span> <span class="br0">&#41;</span><br /> &nbsp; <span class="br0">&#123;</span><br /> &nbsp; &nbsp; <span class="kw1">new</span> Student<span class="br0">&#40;</span><span class="br0">&#41;</span>.<span class="me1">goToSchool</span><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; <span class="br0">&#125;</span><br /> &nbsp; <br /> <span class="br0">&#125;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

So, we need something that can inject something into the Student class, so the class is not dependent to FindARouteToSchool. I have chosen Spring to solve the problem and create a setter object to set a reference of the class FindARouteToSchool.

This is the new Student class which has one more method to set FindARouteToSchool reference.

<div class="codecolorer-container java blackboard" style="overflow:auto;white-space:nowrap;width:100%;height:400px;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />15<br />16<br />17<br />18<br />19<br />20<br />21<br />
        </div>
      </td>
      
      <td>
        <div class="java codecolorer">
          <span class="kw1">public</span> <span class="kw1">class</span> Student<br /> <span class="br0">&#123;</span><br /> &nbsp; FindARouteToSchool findARoute<span class="sy0">;</span><br /> &nbsp; <br /> &nbsp; <span class="kw1">public</span> <span class="kw4">void</span> setFindARoute<span class="br0">&#40;</span>FindARouteToSchool findARoute<span class="br0">&#41;</span><br /> &nbsp; <span class="br0">&#123;</span><br /> &nbsp; &nbsp; <span class="kw1">this</span>.<span class="me1">findARoute</span> <span class="sy0">=</span> findARoute<span class="sy0">;</span><br /> &nbsp; <span class="br0">&#125;</span><br /> <br /> &nbsp; <span class="kw1">public</span> <span class="kw4">void</span> goToSchool<span class="br0">&#40;</span><span class="br0">&#41;</span><br /> &nbsp; <span class="br0">&#123;</span><br /> &nbsp; &nbsp; findARoute.<span class="me1">go</span><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; <span class="br0">&#125;</span><br /> &nbsp; <br /> &nbsp; <span class="kw1">public</span> <span class="kw1">static</span> <span class="kw4">void</span> main <span class="br0">&#40;</span> <a href="http://www.google.com/search?hl=en&q=allinurl%3Astring+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">String</span></a> args<span class="br0">&#91;</span><span class="br0">&#93;</span> <span class="br0">&#41;</span><br /> &nbsp; <span class="br0">&#123;</span><br /> &nbsp; &nbsp; ApplicationContext ctx <span class="sy0">=</span> <span class="kw1">new</span> ClassPathXmlApplicationContext<span class="br0">&#40;</span><span class="st0">"spring-idol.xml"</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; Student student <span class="sy0">=</span> <span class="br0">&#40;</span>Student<span class="br0">&#41;</span> ctx.<span class="me1">getBean</span><span class="br0">&#40;</span><span class="st0">"student"</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; student.<span class="me1">goToSchool</span><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; <span class="br0">&#125;</span><br /> <span class="br0">&#125;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

This is the XML configure file of Spring

<div class="codecolorer-container xml blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />
        </div>
      </td>
      
      <td>
        <div class="xml codecolorer">
          <span class="sc3"><span class="re1"><?xml</span> <span class="re0">version</span>=<span class="st0">"1.0"</span> <span class="re0">encoding</span>=<span class="st0">"UTF-8"</span><span class="re2">?></span></span><br /> <span class="sc3"><span class="re1"><beans</span> <span class="re0">xmlns</span>=<span class="st0">"http://www.springframework.org/schema/beans"</span></span><br /> <span class="sc3">&nbsp; <span class="re0">xmlns:xsi</span>=<span class="st0">"http://www.w3.org/2001/XMLSchema-instance"</span></span><br /> <span class="sc3">&nbsp; <span class="re0">xsi:schemaLocation</span>=<span class="st0">"http://www.springframework.org/schema/beans </span><br /> <span class="sc3">&nbsp; http://www.springframework.org/schema/beans/spring-beans-2.0.xsd"</span><span class="re2">></span></span><br /> &nbsp; <br /> &nbsp; <span class="sc3"><span class="re1"><bean</span> <span class="re0">id</span>=<span class="st0">"goByTube"</span></span><br /> <span class="sc3">&nbsp; &nbsp; <span class="re0">class</span>=<span class="st0">"com.noppanit.GoByTube"</span><span class="re2">/></span></span><br /> <br /> &nbsp; <span class="sc3"><span class="re1"><bean</span> <span class="re0">id</span>=<span class="st0">"student"</span> <span class="re0">class</span>=<span class="st0">"com.noppanit.Student"</span> <span class="re2">></span></span><br /> &nbsp; &nbsp; <span class="sc3"><span class="re1"><property</span> <span class="re0">name</span>=<span class="st0">"findARoute"</span> <span class="re0">ref</span>=<span class="st0">"goByTube"</span><span class="re2">></span><span class="re1"></property<span class="re2">></span></span></span><br /> &nbsp; <span class="sc3"><span class="re1"></bean<span class="re2">></span></span></span><br /> <span class="sc3"><span class="re1"></beans<span class="re2">></span></span></span>
        </div>
      </td>
    </tr>
  </table>
</div>

 [1]: http://www.martinfowler.com/articles/injection.html