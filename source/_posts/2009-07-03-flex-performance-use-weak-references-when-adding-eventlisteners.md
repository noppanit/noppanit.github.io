---
title: 'Flex Performance &#8211; Use Weak References When Adding EventListeners'
author: Noppanit Charassinvichai
layout: post
permalink: /flex-performance-use-weak-references-when-adding-eventlisteners/
dsq_thread_id:
  - 231826300
categories:
  - Flex
---
Garbage collection is good. Blocking garbage collection is bad. Event listeners, when they&#8217;re not added with care, can be a barrier to garbage collection, because they make it look like unused objects are still needed. A Flex best practice is to set the 5th parameter in addEventListener to true, as the example below shows:

component.addEventListener( MOUSE.ACTION , onMonthChange, false, 0, true );

Implicit in this is also the idea that you should add your event listeners in ActionScript, rather than MXML. Our initial prototype does not follow this practice, but we should try to follow it going forward.