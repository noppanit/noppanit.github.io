---
title: 'Grails run-app doesn&#8217;t pick up Filters, TagLib or even Controller'
author: Noppanit Charassinvichai
layout: post
permalink: /grails-run-app-doesnt-pick-up-filters-taglib-or-even-controller/
dsq_thread_id:
  - 361951458
categories:
  - Knowledges
---
Have you every come across a situation that &#8220;grails run-app&#8221; dones&#8217;t work with new TagLib, Controller or even Filter. You might wonder why my Filters doesn&#8217;t fire. Or why grails throws Controller not found exception. 

Solution:  
You might want to check grails.xml in web-app folder, whether the new resources are included in the grails.xml file. Otherwise, grails won&#8217;t pick them up. But grails run-war will still be working.