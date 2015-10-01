---
title: Grails have a little problem with Eclipse
author: Noppanit Charassinvichai
layout: post
permalink: /grails-have-a-little-problem-with-eclipse/
dsq_thread_id:
  - 294940323
categories:
  - Grails
---
While I was developing an grails application with Eclipse, I found that I cannot save the object to the memory, So I tried a couple things and I found this web site

<http://groups.google.com/group/thai-grails-user/web/grails>??

It did solved my problem. Because Eclipse will generate .class files to distrub grails function, so we have to tell Eclipse that do not create them&#8230;

By going to perference menu in Eclipse, **Windows -> Preferences -> Groovy, tick the checkbox &#8220;Disable Groovy Generating Class Files&#8221;  
**