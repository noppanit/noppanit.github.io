---
title: AngularJs Cookies with Play Framework 2.1.1 Java Session.
comments: true
author: Noppanit Charassinvichai
dsq_thread_id:
  - 1341282716
categories:
  - Java
tags:
  - angularjs
  - play-framework-2-java
---
I have been working with AngularJs and I loved it, but occasionally I ran into some problems and the documentation is not that reliable. So, I&#8217;m helping them to increase the rank. 

Recently, I have this problem when Play saved some session in cookie already, but I can&#8217;t use $cookies from AngularJs to read the cookie. So, I started digging in and I found that those cookies are set with **httpOnly** by default. If you have that flag on any plugins (e.g, AngularJs) cannot read that cookie. So, it Play 1 you can set **application.session.httpOnly=false** but in Play 2.1 they changed to **session.httpOnly=false**

I&#8217;m hoping I can save some people&#8217;s time.