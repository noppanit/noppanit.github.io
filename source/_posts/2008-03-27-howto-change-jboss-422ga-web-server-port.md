---
title: 'HowTo : Change Jboss 4.2.2GA web server port'
author: Noppanit Charassinvichai
layout: post
permalink: /howto-change-jboss-422ga-web-server-port/
dsq_thread_id:
  - 262612488
categories:
  - JBOSS
---
<p align="left">
  Locate server.xml file in $JBOSS_HOME\\server\\all\\deploy\\jboss-web.deployer\\server.xml
</p>

Change this line to a port that you want it to be.

<Connector port=&#8221;**8081**&#8221; address=&#8221;${jboss.bind.address}&#8221; &#8230;