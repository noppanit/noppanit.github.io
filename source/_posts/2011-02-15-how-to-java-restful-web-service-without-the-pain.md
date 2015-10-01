---
title: 'How to: Java RESTFul Web Service without the pain.'
author: Noppanit Charassinvichai
layout: post
permalink: /how-to-java-restful-web-service-without-the-pain/
dsq_thread_id:
  - 231321151
categories:
  - Java
---
In this article I will explain how to create a Java RESTFul application from scratch. I think I won&#8217;t have to explain what RESTFul web service is, because many websites on the Internet explain better than me. But what I couldn&#8217;t find it on the Internet is how could I build one. I found some websites but they&#8217;re just too complicated to understand at least for me. So, here is the example of Java RESTFul HelloWorld.

What you need to prepare are:

  * Latest Eclipse
  * Apache 6.0
  * [Jersey][1] project. Or you can use Apache CXF. But I personally find that Jersey is easier.

So, first create a Dynamic Web Project as the picture below.

[<img class="alignnone size-full wp-image-658" title="Hello RESTFul" src="http://www.noppanit.com/wp-content/uploads/2011/02/Hello-RESTFul.png" alt="Hello Java RESTFul" width="248" height="188" />][2]

Then copy three files from Jersey project and put them in /WEB-INF/lib and add those jar files to the project: jersey-server.jar ,jersey-core.jar, asm.jar

Now, change web.xml to add one more servlet. This will call the ServletContainer of Jersey every time the project is called.

<div class="codecolorer-container xml blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />15<br />16<br />
        </div>
      </td>
      
      <td>
        <div class="xml codecolorer">
          <span class="sc3"><span class="re1"><?xml</span> <span class="re0">version</span>=<span class="st0">"1.0"</span> <span class="re0">encoding</span>=<span class="st0">"UTF-8"</span><span class="re2">?></span></span><br /> <span class="sc3"><span class="re1"><web-app</span> <span class="re0">xmlns:xsi</span>=<span class="st0">"http://www.w3.org/2001/XMLSchema-instance"</span> <span class="re0">xmlns</span>=<span class="st0">"http://java.sun.com/xml/ns/javaee"</span> <span class="re0">xmlns:web</span>=<span class="st0">"http://java.sun.com/xml/ns/javaee/web-app_2_5.xsd"</span> <span class="re0">xsi:schemaLocation</span>=<span class="st0">"http://java.sun.com/xml/ns/javaee http://java.sun.com/xml/ns/javaee/web-app_2_5.xsd"</span> <span class="re0">id</span>=<span class="st0">"WebApp_ID"</span> <span class="re0">version</span>=<span class="st0">"2.5"</span><span class="re2">></span></span><br /> &nbsp; <span class="sc3"><span class="re1"><display-name<span class="re2">></span></span></span>HelloRESTFul<span class="sc3"><span class="re1"></display-name<span class="re2">></span></span></span><br /> &nbsp; <span class="sc3"><span class="re1"><servlet<span class="re2">></span></span></span><br /> &nbsp; &nbsp; <span class="sc3"><span class="re1"><servlet-name<span class="re2">></span></span></span>JerseyWebService<span class="sc3"><span class="re1"></servlet-name<span class="re2">></span></span></span><br /> &nbsp; &nbsp; <span class="sc3"><span class="re1"><servlet-class<span class="re2">></span></span></span>com.sun.jersey.spi.container.servlet.ServletContainer<span class="sc3"><span class="re1"></servlet-class<span class="re2">></span></span></span><br /> &nbsp; &nbsp; <span class="sc3"><span class="re1"><load-on-startup<span class="re2">></span></span></span>1<span class="sc3"><span class="re1"></load-on-startup<span class="re2">></span></span></span><br /> &nbsp; <span class="sc3"><span class="re1"></servlet<span class="re2">></span></span></span><br /> &nbsp; <span class="sc3"><span class="re1"><servlet-mapping<span class="re2">></span></span></span><br /> &nbsp; &nbsp; <span class="sc3"><span class="re1"><servlet-name<span class="re2">></span></span></span>JerseyWebService<span class="sc3"><span class="re1"></servlet-name<span class="re2">></span></span></span><br /> &nbsp; &nbsp; <span class="sc3"><span class="re1"><url-pattern<span class="re2">></span></span></span>/*<span class="sc3"><span class="re1"></url-pattern<span class="re2">></span></span></span><br /> &nbsp; <span class="sc3"><span class="re1"></servlet-mapping<span class="re2">></span></span></span><br /> &nbsp; <span class="sc3"><span class="re1"><welcome-file-list<span class="re2">></span></span></span><br /> &nbsp; &nbsp; <span class="sc3"><span class="re1"><welcome-file<span class="re2">></span></span></span>index.html<span class="sc3"><span class="re1"></welcome-file<span class="re2">></span></span></span><br /> &nbsp; <span class="sc3"><span class="re1"></welcome-file-list<span class="re2">></span></span></span><br /> <span class="sc3"><span class="re1"></web-app<span class="re2">></span></span></span>
        </div>
      </td>
    </tr>
  </table>
</div>

Now, here is the interesting part. Create one class HelloWorld to be a web service producer.

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
          <span class="kw1">package</span> <span class="co2">com.noppanit</span><span class="sy0">;</span><br /> <br /> <span class="kw1">import</span> <span class="co2">javax.ws.rs.GET</span><span class="sy0">;</span><br /> <span class="kw1">import</span> <span class="co2">javax.ws.rs.Path</span><span class="sy0">;</span><br /> <span class="kw1">import</span> <span class="co2">javax.ws.rs.Produces</span><span class="sy0">;</span><br /> <br /> @Path<span class="br0">&#40;</span>value<span class="sy0">=</span><span class="st0">"/hello"</span><span class="br0">&#41;</span> <span class="co1">// This will be the path where you need to call from the client</span><br /> <span class="kw1">public</span> <span class="kw1">class</span> HelloWorld<br /> <span class="br0">&#123;</span><br /> &nbsp; @GET <span class="co1">// this will be called by GET request</span><br /> &nbsp; @Produces<span class="br0">&#40;</span><span class="st0">"application/xml"</span><span class="br0">&#41;</span> <span class="co1">// And the method will return XML</span><br /> &nbsp; <span class="kw1">public</span> <a href="http://www.google.com/search?hl=en&q=allinurl%3Astring+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">String</span></a> helloWorld<span class="br0">&#40;</span><span class="br0">&#41;</span><br /> &nbsp; <span class="br0">&#123;</span><br /> &nbsp; &nbsp; <span class="kw1">return</span> <span class="st0">"<hello>Hello RESTFul</hello>"</span><span class="sy0">;</span><br /> &nbsp; <span class="br0">&#125;</span><br /> <span class="br0">&#125;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

How easy that is? Now you have a web service ready to be called from any client.  
Then if you deploy the project and run the apache and go to this address. http://localhost:8080/HelloRESTFul/hello. You will see Hello RESTFul as the result. 

This is just the beginning of Java RESTFul. It&#8217;s a good start for anyone interested in creating a RESTFul application.

Now you have a basic understanding, I recommend these two websites to learn more about RESTFul.  
<http://www.ibm.com/developerworks/web/library/wa-aj-tomcat/index.html>  
and  
<http://www.ibm.com/developerworks/webservices/library/wa-jaxrs/index.html>

 [1]: http://jersey.java.net/
 [2]: http://www.noppanit.com/wp-content/uploads/2011/02/Hello-RESTFul.png