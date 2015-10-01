---
title: 'HowTo : Crystal report XI with Data source'
author: Noppanit Charassinvichai
layout: post
permalink: /howto-crystal-report-xi-with-data-source/
dsq_thread_id:
  - 243616377
categories:
  - Applications
  - Crystal report
---
<p style="text-align: left;">
  I don&#8217;t know everyone used to encounter with this problem, but I was. When I using crystal report connected with SQLServer 2005 using Microsoft OLE DB connector. I cannot use &#8220;localhost\sqlexpress&#8221; as a Data Source Name, I don&#8217;t know why? but I can use &#8220;localhost\sqlexpress&#8221; when I using sqlcmd to connect database. So my solution is using &#8220;.\sqlexpress&#8221; instead &#8220;localhost&#8221;. At least it&#8217;s work for me.
</p>