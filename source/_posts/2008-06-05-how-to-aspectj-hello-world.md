---
title: 'How to: AspectJ Hello World'
author: Noppanit Charassinvichai
layout: post
permalink: /how-to-aspectj-hello-world/
dsq_thread_id:
  - 188302790
categories:
  - Knowledges
---
Actually, this topic has been it my draft for quite a long time. So, I decided to complete it now. AOP, it Aspect-Oriented Programming, I could not explain its meaning as good as Wikipedia. So, [please read this first][1]. This topic is just to remind me that how to write a very simple Aspect program.

First Let&#8217;s create a simple HelloWorld program.

<img src="http://i2.photobucket.com/albums/y41/newbie_toy/1-3.png" alt="" width="358" height="194" />

The result would be easy.

So, This is my aspect

<img src="http://i2.photobucket.com/albums/y41/newbie_toy/2-4.png" alt="" width="432" height="157" />

What my aspect will do is. I created one pointcut which is greeting() and the jointpoint is Hello.sayHello(..). I won&#8217;t explain what those thing is, because I can&#8217;t do. I recommed anybody to buy a book of AOP. It&#8217;s better. Second, I created one advice which will excetue after my pointcut has been called. And I chose post-compile??weaving to??weave those files together. Next topic I will be presenting how to use Load-time weaving. Needless to say, the resule will be Hello World.

 [1]: http://en.wikipedia.org/wiki/Aspect-oriented_programming