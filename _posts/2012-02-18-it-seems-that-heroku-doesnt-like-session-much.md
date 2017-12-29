---
title: 'It seems that heroku doesn&#8217;t like session much'
comments: true
author: Noppanit Charassinvichai
dsq_thread_id:
  - 581205191
categories:
  - Knowledges
---
Not sure if this only happens to me. But just sometimes heroku just give out &#8220;Application Error&#8221; for no reason on my application. No errors have been logged in the console. So I send a couple email to herouk support but no luck, because there&#8217;s no log. So, I digged further. I found out that using http session on cloud might be a problem, because you don&#8217;t know where you application server will be or will it be scaled somewhere else. So, sometime the session is cut (It just my theory without any reference). So, please let me know if I&#8217;m wrong. 

This is how I solved the problem, I changed everything and used memcache instead and the problem is gone. Memcache is in-memeory cache system which you have store objects as well. And I&#8217;m sure that it&#8217;s scaleable. So, if you have the same problem as me I would suggest using memcache instead it&#8217;s easy. 

Ps. I use Sinatra.