---
title: 'HowTo : Set loopback on Router (ZyXeL)'
author: Noppanit Charassinvichai
layout: post
permalink: /howto-set-loopback-on-router-zyxel/
dsq_thread_id:
  - 186079219
categories:
  - Techniques
---
Everyone, used to use [Dynamic DNS Server][1], which is use your router and ADSL line setting your PC like a Server.

This topic would all about If you set you PC as a SERVER, but when you access its webpage in your server. You will get &#8220;Weppage not found&#8221;, because your router will browse in the Internet first, it cannot loopback on itself. you must set &#8220;Loopback Command&#8221; on a router.

> <pre>Q: Why can not I access the LAN server from LAN host using its domain name?</pre>
> 
> <pre>A: This is because when NAT is enabled in the NAT router, the domain

   name will be resolved to the WAN IP of the NAT router. This

   causes the traffic stop at the WAN side of the NAT router when the

   request is sent from the host to the internal server. And never

   arrive at the server.

Therefore, if you try to access this server from LAN side also

   using its domain name, we provide an enhanced solution (not for

   all models) to achieve this.

You need to do two settings:

1. Go to Menu 24.8 and type the following CI command

ras &gt; ip nat loopback on

2. Configure Port Forwarding in menu 15.1 by entering the server

      IP and port number.

Otherwise, you can only use the IP address to access the internal

server from any LAN host. While only the remote users can use the

domain name instead.</pre>

 [1]: http://www.dyndns.com/