---
title: 'Ubuntu : use apt-get install behide proxy server'
author: Noppanit Charassinvichai
layout: post
permalink: /ubuntu-use-apt-get-install-behide-proxy-server/
categories:
  - Ubuntu
---
I have a problem with using apt-get while I work at my company, because they use proxy server. Here&#8217;s the solution.

<div class="codetop">
  COMMAND
</div>

<div class="codemain">
  $ http_proxy=http://username:password@host:port/</br><br /> $ export http_proxy
</div>