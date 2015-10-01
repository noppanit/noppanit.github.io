---
title: 'HowTo : SQLServer 2005 : Exclusive access could not be obtained because the database is in use'
author: Noppanit Charassinvichai
layout: post
permalink: /howto-sqlserver-2005-exclusive-access-could-not-be-obtained-because-the-database-is-in-use/
dsq_thread_id:
  - 213803215
categories:
  - Database
  - Knowledges
  - Programming
  - SQL Server
  - Techniques
---
&#8220;Exclusive access could not be obtained because the database is in use&#8221;

I got stuck with this error couple days, so mad. I found this solution in this [topic][1], it works fine for me, anyway here&#8217;s the solution

When you want to restore database in SQLServer you must use &#8216;master&#8217; database run command. If it work fine, so never mind, but if you got stuck in this kind of errors again. This solution may help you.

Use this sql to drop connections

> ALTER DATABASE databasename SET SINGLE_USER WITH ROLLBACK IMMEDIATE

And follow with restore sql

> RESTORE DATABASE databasename FROM &#8230;

The last follow with allow connections

> ALTER DATABASE databasename SET MULTI_USER

 [1]: http://www.thescripts.com/forum/thread605110.html