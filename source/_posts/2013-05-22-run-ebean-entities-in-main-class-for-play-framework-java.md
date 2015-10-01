---
title: Run Ebean entities in main class for Play Framework Java
author: Noppanit Charassinvichai
layout: post
permalink: /run-ebean-entities-in-main-class-for-play-framework-java/
dsq_thread_id:
  - 1308022754
categories:
  - Java
tags:
  - ebean
  - Java
  - play framwork
---
I guess the title of this blog is kinda wired and I don&#8217;t know how to make it better. People might be wondering why would you want to do that. So, on the current project we have a little requirement to seed the data for the designers to mock the data into the database but they don&#8217;t want to open IDE and run a program. And we would like to use EBean Entities because that should be the models of the application. Let&#8217;s look at the code.

<div class="codecolorer-container java blackboard" style="overflow:auto;white-space:nowrap;width:100%;height:400px;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />15<br />16<br />17<br />18<br />19<br />20<br />21<br />22<br />23<br />24<br />25<br />26<br />27<br />28<br />29<br />30<br />31<br />32<br />33<br />34<br />35<br />36<br />37<br />38<br />39<br />40<br />41<br />42<br />43<br />44<br />45<br />46<br />47<br />48<br />49<br />
        </div>
      </td>
      
      <td>
        <div class="java codecolorer">
          <span class="kw1">public</span> <span class="kw1">class</span> Seeder <span class="br0">&#123;</span><br /> <br /> &nbsp; &nbsp; <span class="kw1">public</span> <span class="kw1">static</span> <span class="kw4">void</span> main<span class="br0">&#40;</span><a href="http://www.google.com/search?hl=en&q=allinurl%3Astring+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">String</span></a> args<span class="br0">&#91;</span><span class="br0">&#93;</span><span class="br0">&#41;</span> <span class="kw1">throws</span> <a href="http://www.google.com/search?hl=en&q=allinurl%3Asqlexception+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">SQLException</span></a> <span class="br0">&#123;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; EbeanServer server <span class="sy0">=</span> setupEBeanServer<span class="br0">&#40;</span>args<span class="br0">&#41;</span><span class="sy0">;</span><br /> <br /> &nbsp; &nbsp; &nbsp; &nbsp; cleanData<span class="br0">&#40;</span>server<span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; <span class="kw1">for</span> <span class="br0">&#40;</span><span class="kw4">int</span> i <span class="sy0">=</span> <span class="nu0"></span><span class="sy0">;</span> i <span class="sy0"><</span> <span class="nu0">10</span><span class="sy0">;</span> i<span class="sy0">++</span><span class="br0">&#41;</span> <span class="br0">&#123;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; setupData<span class="br0">&#40;</span>server<span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; <span class="br0">&#125;</span><br /> &nbsp; &nbsp; <span class="br0">&#125;</span><br /> <br /> &nbsp; &nbsp; <span class="kw1">private</span> <span class="kw1">static</span> EbeanServer setupEBeanServer<span class="br0">&#40;</span><a href="http://www.google.com/search?hl=en&q=allinurl%3Astring+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">String</span></a><span class="br0">&#91;</span><span class="br0">&#93;</span> args<span class="br0">&#41;</span> <span class="br0">&#123;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; <a href="http://www.google.com/search?hl=en&q=allinurl%3Astring+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">String</span></a> username <span class="sy0">=</span> args<span class="br0">&#91;</span><span class="nu0"></span><span class="br0">&#93;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; <a href="http://www.google.com/search?hl=en&q=allinurl%3Astring+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">String</span></a> password <span class="sy0">=</span> args<span class="br0">&#91;</span><span class="nu0">1</span><span class="br0">&#93;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; <a href="http://www.google.com/search?hl=en&q=allinurl%3Astring+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">String</span></a> connectionString <span class="sy0">=</span> args<span class="br0">&#91;</span><span class="nu0">2</span><span class="br0">&#93;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; <a href="http://www.google.com/search?hl=en&q=allinurl%3Astring+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">String</span></a> dbDriver <span class="sy0">=</span> args<span class="br0">&#91;</span><span class="nu0">3</span><span class="br0">&#93;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; <span class="co1">// You can use ebean.properties instead of programatically configure it. &nbsp;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; DataSourceConfig toadlaneDB <span class="sy0">=</span> <span class="kw1">new</span> DataSourceConfig<span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; ServerConfig config <span class="sy0">=</span> <span class="kw1">new</span> ServerConfig<span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; config.<span class="me1">setName</span><span class="br0">&#40;</span><span class="st0">"mysql"</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; toadlaneDB.<span class="me1">setDriver</span><span class="br0">&#40;</span>dbDriver<span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; toadlaneDB.<span class="me1">setUsername</span><span class="br0">&#40;</span>username<span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; toadlaneDB.<span class="me1">setPassword</span><span class="br0">&#40;</span>password<span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; toadlaneDB.<span class="me1">setUrl</span><span class="br0">&#40;</span>connectionString<span class="br0">&#41;</span><span class="sy0">;</span><br /> <br /> &nbsp; &nbsp; &nbsp; &nbsp; config.<span class="me1">setDataSourceConfig</span><span class="br0">&#40;</span>toadlaneDB<span class="br0">&#41;</span><span class="sy0">;</span><br /> <br /> &nbsp; &nbsp; &nbsp; &nbsp; config.<span class="me1">setDefaultServer</span><span class="br0">&#40;</span><span class="kw2">false</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; config.<span class="me1">setRegister</span><span class="br0">&#40;</span><span class="kw2">false</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> <br /> &nbsp; &nbsp; &nbsp; &nbsp; <span class="kw1">return</span> EbeanServerFactory.<span class="me1">create</span><span class="br0">&#40;</span>config<span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; <span class="br0">&#125;</span><br /> <br /> &nbsp; &nbsp; <span class="kw1">private</span> <span class="kw1">static</span> <span class="kw4">void</span> cleanData<span class="br0">&#40;</span>EbeanServer connection<span class="br0">&#41;</span> <span class="kw1">throws</span> <a href="http://www.google.com/search?hl=en&q=allinurl%3Asqlexception+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">SQLException</span></a> <span class="br0">&#123;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; connection.<span class="me1">createSqlUpdate</span><span class="br0">&#40;</span><span class="st0">"DELETE FROM PRODUCTS"</span><span class="br0">&#41;</span>.<span class="me1">execute</span><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; <span class="br0">&#125;</span><br /> <br /> &nbsp; &nbsp; <span class="kw1">private</span> <span class="kw1">static</span> <span class="kw4">void</span> setupData<span class="br0">&#40;</span>EbeanServer server<span class="br0">&#41;</span> <span class="br0">&#123;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; Product product <span class="sy0">=</span> <span class="kw1">new</span> Product<span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; <span class="co1">// setup properties</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; server.<span class="me1">save</span><span class="br0">&#40;</span>product<span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; <br /> &nbsp; &nbsp; <span class="br0">&#125;</span><br /> <span class="br0">&#125;</span><br /> <br /> @<a href="http://www.google.com/search?hl=en&q=allinurl%3Aentity+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">Entity</span></a><br /> <span class="kw1">public</span> <span class="kw1">class</span> Product <span class="kw1">extends</span> Model <span class="br0">&#123;</span><br /> &nbsp; &nbsp; <span class="co1">// Properties</span><br /> <span class="br0">&#125;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

People might be wondering it should be difficult because Play comes with EBean already but when you run this class from the main class you are outside of Play world and it becomes a little problem. First, EBean will complain about

<div class="codecolorer-container java blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />
        </div>
      </td>
      
      <td>
        <div class="java codecolorer">
          @<a href="http://www.google.com/search?hl=en&q=allinurl%3Aentity+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">Entity</span></a><br /> <span class="kw1">public</span> <span class="kw1">class</span> Product <span class="kw1">extends</span> Model <span class="br0">&#123;</span><br /> &nbsp; &nbsp; <span class="co1">// Properties</span><br /> <span class="br0">&#125;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

Because Product has been marked @Entity already but we also extends that with Model for other magic methods again. Here&#8217;s the trick which I use -javaagent:/${PROJECT_HOME}/lib/ebean-2.7.7-agent.jar

Here&#8217;s what I have done in Ant script

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
          &nbsp; &nbsp; &nbsp; &nbsp; <span class="sc3"><span class="re1"><java</span> <span class="re0">classname</span>=<span class="st0">"seeder.Seeder"</span> <span class="re0">dir</span>=<span class="st0">"${play.test.build.dir}"</span> <span class="re0">fork</span>=<span class="st0">"true"</span></span><br /> <span class="sc3"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<span class="re0">failonerror</span>=<span class="st0">"true"</span><span class="re2">></span></span><br /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span class="sc3"><span class="re1"><arg</span> <span class="re0">value</span>=<span class="st0">"${username}"</span><span class="re2">/></span></span><br /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span class="sc3"><span class="re1"><arg</span> <span class="re0">value</span>=<span class="st0">"${password}"</span><span class="re2">/></span></span><br /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span class="sc3"><span class="re1"><arg</span> <span class="re0">value</span>=<span class="st0">"${db.url}"</span><span class="re2">/></span></span><br /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span class="sc3"><span class="re1"><arg</span> <span class="re0">value</span>=<span class="st0">"${db.driver}"</span><span class="re2">/></span></span><br /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span class="sc3"><span class="re1"><jvmarg</span> <span class="re0">value</span>=<span class="st0">"-javaagent:/${PROJECT_HOME}/lib/ebean-2.7.7-agent.jar"</span> <span class="re2">/></span></span><br /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span class="sc3"><span class="re1"><classpath<span class="re2">></span></span></span><br /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span class="sc3"><span class="re1"><path</span> <span class="re0">refid</span>=<span class="st0">"seeder-classpath"</span><span class="re2">/></span></span><br /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span class="sc3"><span class="re1"></classpath<span class="re2">></span></span></span><br /> &nbsp; &nbsp; &nbsp; &nbsp; <span class="sc3"><span class="re1"></java<span class="re2">></span></span></span>
        </div>
      </td>
    </tr>
  </table>
</div>

I was inspired by this [guy][1]

 [1]: http://blog.matthieuguillermin.fr/2012/03/unit-testing-tricks-for-play-2-0-and-ebean/