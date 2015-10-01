---
title: 'ASP returns &#8220;Operation must use an updateable query&#8221; error'
author: Noppanit Charassinvichai
layout: post
permalink: /asp-returns-operation-must-use-an-updateable-query-error/
jd_tweet_this:
  - yes
wp_jd_bitly:
  - http://bit.ly/4opfZy
wp_jd_target:
  - http://www.noppanit.com/asp-returns-operation-must-use-an-updateable-query-error/
dsq_thread_id:
  - 218685060
categories:
  - .NET
---
Well, I got this error from my ASP application. I spent 2 hours to fix the problem and it is very easy, just grant the permission of the database folder to Internet Guest account (IUSR_MACHINE). 

Reference : <http://support.microsoft.com/kb/175168>