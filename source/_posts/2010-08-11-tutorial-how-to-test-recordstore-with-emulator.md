---
title: 'Tutorial : J2ME and Netbeans : How to test RecordStore with emulator'
author: Noppanit Charassinvichai
layout: post
permalink: /tutorial-how-to-test-recordstore-with-emulator/
jd_tweet_this:
  - yes
wp_jd_bitly:
  - http://bit.ly/cIFQ7W
wp_jd_target:
  - http://www.noppanit.com/tutorial-how-to-test-recordstore-with-emulator/
dsq_thread_id:
  - 183922810
categories:
  - J2ME
  - Java
---
I&#8217;m using Netbeans 6.9 and implementing RecordStore and I want to test that with emulator. How would I do that? because every time I close the emulator, the state will be deleted or gone in some way. 

This is my way of doing that. Basically, you just have to actually install the application in the emulator and when you exit the application you can enter the application again. Just like in a real phone. 

So, you just have to use OTA install. 

In Netbeans 6.9.  
1. right click on your project and click &#8220;properties&#8221;  
2. In running click at &#8220;Execute through OTA (Over the air provisioning)&#8221;.  
3. That&#8217;s it, so when you start the application, it will be actually installed inside emulator and you can close and open the application anytime you want.