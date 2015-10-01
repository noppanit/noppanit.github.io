---
title: My little example of Aspect-Oriented Programming
author: Noppanit Charassinvichai
layout: post
permalink: /my-little-example-of-aspect-oriented-programming/
dsq_thread_id:
  - 241835091
categories:
  - AOP
---
I have been reading the SpringFramework for like 2 days and AOP. I just want to give out an example of AOP. I don&#8217;t want to use and technical words, such as Point-cut, or advice, etc, because It&#8217;s too hard to define those words for me. ^_^

I will present the easiest example. If developers want to add more function to a class, like logging. The code in classes will be like mess. Like these

// codes for logging  
// your codes //transaction code  
// another code

It&#8217;s too mess for production. Here the AOP would help you. You can add logging method to your production and create a XML or configuration (AOP configuration) and let the method you just created execute before or after your execution point or even around. This solution would not affect you production at all, because the logging code runs across your production not with your production. If developers feel bad about the new code, they can just drop it out of the production. It would not affect your production at all. It&#8217;s like the new code run across the old code.

<img src="http://i2.photobucket.com/albums/y41/newbie_toy/AOP1.gif" alt="" width="296" height="145" />  
Here&#8217;s your transaction service, and you would like to add logging service to your production.

<img src="http://i2.photobucket.com/albums/y41/newbie_toy/AOP2.gif" alt="" width="285" height="238" />  
an OOP would be like this. The logging service would run along with the transaction service. Developers have to decode the production or might have to redeploy the production again. What if you cannot drop the production, because it&#8217;s running?  
<img src="http://i2.photobucket.com/albums/y41/newbie_toy/AOP3.gif" alt="" width="387" height="258" />  
Here&#8217;s the AOP comes and helps developers. Developers create logging service without to decode the production or even drop the production off. They just create a logging service and deploy the logging service which runs across with the production. It&#8217;s called Cross-cutting concerns. The production would not be affected at all.