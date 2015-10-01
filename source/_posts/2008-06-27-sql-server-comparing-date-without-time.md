---
title: 'SQL Server : Comparing date without time'
author: Noppanit Charassinvichai
layout: post
permalink: /sql-server-comparing-date-without-time/
dsq_thread_id:
  - 432819161
categories:
  - Database
  - SQL Server
---
I&#8217;m facing such problem which is comparing date with full datetime field. So, the problem is when I want to compare full datetime field that contains time. It will return 0 row, because sql server will also compare time too. No matter you have the exact same date, but you have the different time. This is the solution, just convert full datetime file to only date.

<div class="codetop">
  SQL
</div>

<div class="codemain">
  select cast(floor(cast([datetime field] as float)) as datetime) from [your table]
</div>