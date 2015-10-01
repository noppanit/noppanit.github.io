---
title: 'NHibernate : Improving performance'
author: Noppanit Charassinvichai
layout: post
permalink: /nhibernate-improving-performance/
dsq_thread_id:
  - 268172020
categories:
  - NHibernate
tags:
  - NHibernate
---
Just add the key into App.config

<div class="codetop">
  CODE
</div>

<div class="codemain">
  <add key=&#8221;hibernate.default_schema&#8221; value=&#8221;trinop.dbo&#8221;/>
</div>

This key will help NHibernate not to look which is the schema of the database again.