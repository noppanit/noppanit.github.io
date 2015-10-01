---
title: 'Tutorial : Hello EJB3'
author: Noppanit Charassinvichai
layout: post
permalink: /tutorial-hello-ejb3/
dsq_thread_id:
  - 236634864
categories:
  - Java
tags:
  - ejb
  - ejb3
  - Java
---
After I wrote this article <http://www.noppanit.com/?p=90>. It&#8217;s about EJB2. I wrote it from scratch. So, this article I will be writing about EJB3 and I will write it from scratch as well. To compare??EJB3 with EJB2, I found that EJB3 is a lot more comfortable, but it can&#8217;t beat Grails anyway. ^_^. So, let gets start.

First, create a project.

<img src="http://i2.photobucket.com/albums/y41/newbie_toy/1-2.png" alt="" width="227" height="119" />

??It will look like this

<img src="http://i2.photobucket.com/albums/y41/newbie_toy/2-2.png" alt="" width="228" height="185" />

Create an interface like this

<img src="http://i2.photobucket.com/albums/y41/newbie_toy/3-3.png" alt="" width="229" height="254" />

Insert this code inside the interface  
@Remote <&#8211; It&#8217;s an annotation for telling J2EE container that this is RemoteInterface

<div class="codetop">
  CODE JAVA
</div>

<div class="codemain">
  package com.noppanit.ejb.interfaces;<br /> import javax.ejb.Remote;<br /> @Remote<br /> public interface MyBeanFacade {<br /> ???????????????????? public String sayHello(String name);<br /> }
</div>

Insert this code for MyBean.java  
@Stateless <&#8211; is for telling J2EE container that this is stateless bean with mappedName=&#8221;HelloWorld&#8221; this is for Global JNDI <a href="https://glassfish.dev.java.net/javaee5/ejb/EJB_FAQ.html#AppClientDef" target="_blank">For more information</a>

<div class="codetop">
  CODE MyBean.java
</div>

<div class="codemain">
  package com.noppanit.ejb.bean;<br /> import javax.ejb.Stateless;<br /> import com.noppanit.ejb.interfaces.MyBeanFacade;<br /> @Stateless(mappedName=&#8221;HelloWorld&#8221;)<br /> public class MyBean implements MyBeanFacade<br /> {<br /> ???????????????????? @Override<br /> ???????????????????? public String sayHello(String name) {<br /> ?????????????????????????????????????????? return &#8220;Hi &#8220;+name;<br /> ??????????????????????}<br /> }
</div>

That&#8217;s it what you should do so for. The next thing is pack the project to .jar file and deploy it to your favorite J2EE container. For this topic I chose Glassfish, because it comes with J2EE package that I installed. You can see that we don&#8217;t have to create ejb-jar.xml at all, because this job is done by the power of annotation.

**InitialContext context = new InitialContext();** <&#8211; // by default this line will look up in jndi.properties, but I&#8217;m using Global JNDI. So, we don&#8217;t have to create jndi.properties

And this is the code for Stand-alone client

<div class="codetop">
  CODE Client
</div>

<div class="codemain">
  public static void main(String[] args) throws Exception {<br /> ??????InitialContext context = new InitialContext();<br /> ??????MyBeanFacade bean = (MyBeanFacade)context.lookup(&#8220;HelloWorld&#8221;);<br /> ??????System.out.println(bean.sayHello(&#8220;Toy&#8221;));<br /> }
</div>