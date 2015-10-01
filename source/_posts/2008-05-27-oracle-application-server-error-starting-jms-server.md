---
title: 'Oracle Application Server : Error starting JMS-Server'
author: Noppanit Charassinvichai
layout: post
permalink: /oracle-application-server-error-starting-jms-server/
dsq_thread_id:
  - 273638087
categories:
  - Application Server
tags:
  - application
  - ompn
  - Oracle
  - server
---
Well, one day I just finished my work. I shutdown the computer. Everything looked nice. But when I came home, and I tried to start my OC4J. It threw me an error, so I couldn&#8217;t start my OC4J. I searched through My.Google. And find something that might useful. 

If the server has been shutdown properly. Everything works just fine, but if not, the server will write some lock files in the ${ORACLE_HOME}\j2ee\home\persistence\ And the starting process won&#8217;t work. So, needless to say, just delete all those files and everything might work so well. At least it did work for me.