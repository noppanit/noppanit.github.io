---
title: 'Crystal Report : Multiple Value In Parameter Field'
author: Noppanit Charassinvichai
layout: post
permalink: /crystal-report-multiple-value-in-parameter-field/
dsq_thread_id:
  - 194944110
categories:
  - Applications
  - Crystal report
  - Programming
  - Techniques
---
I&#8217;ve been develop application concern with crystal report, so I have a little problem with parameter field.  
If I want to send a multiple variable with one parameter field, we must set allow multiple values = true,  
But the problem is when we preview ours report. We&#8217;ll see only the first parameter that we put into it, because multiple values are array.

We must create formula field with this code:

> Local StringVar StringText := &#8220;&#8221;;  
> Local NumberVar i;  
> For i := 1 To Ubound({?<Field Name>}) Do  
> (  
> StringText := StringText + &#8220;, &#8221; + {?<Field Name>}[i] );
> 
> StringText