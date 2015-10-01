---
title: How to stop repainting your sticky bar on scroll?
author: Noppanit Charassinvichai
layout: post
permalink: /how-to-stop-repainting-your-sticky-bar-on-scroll/
dsq_thread_id:
  - 3679835020
categories:
  - Knowledges
tags:
  - html
  - performance
---
Everybody loves sticky bar. Or I should say every UX loves sticky bar. You probable have seen that from almost all major websites. Twitter or Facebook all has the top nav bar which sticks to the top and follows you when you scroll down the page. However, there&#8217;s one thing that I have noticed if you use Google Chrome Dev Tool to see the paint area. You will see that the nav bar gets repaint every time you scroll up and down. 

[<img src="http://www.noppanit.com/wp-content/uploads/2015/04/Screenshot_2015-04-14_01_13_55.png" alt="Screenshot_2015-04-14_01_13_55" width="2304" height="803" class="aligncenter size-full wp-image-1383" />][1]

Also, if you use Timeline to record the activity you will notice a lot of Repaint happening which leads to bad scrolling performance. 

The easy fix would be to put

<div class="codecolorer-container text blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />
        </div>
      </td>
      
      <td>
        <div class="text codecolorer">
          backface-visibility: hidden;
        </div>
      </td>
    </tr>
  </table>
</div>

on your navbar which will stop the repaint on scroll. 

### Why that fixes it?

I don&#8217;t want to try answer this myself as this [article][2] answers everything.

### Try it yourself

http://noppanit.com/navbar-repaint.html If you put

<div class="codecolorer-container text blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />
        </div>
      </td>
      
      <td>
        <div class="text codecolorer">
          backface-visibility: hidden;
        </div>
      </td>
    </tr>
  </table>
</div>

to the navbar and you can measure the performance by using Timeline again you will notice the difference. 

[<img src="http://www.noppanit.com/wp-content/uploads/2015/04/Screenshot-2015-04-14-01.20.04.png" alt="Screenshot 2015-04-14 01.20.04" width="2297" height="805" class="aligncenter size-full wp-image-1384" />][3]

 [1]: http://www.noppanit.com/wp-content/uploads/2015/04/Screenshot_2015-04-14_01_13_55.png
 [2]: http://benfrain.com/improving-css-performance-fixed-position-elements/
 [3]: http://www.noppanit.com/wp-content/uploads/2015/04/Screenshot-2015-04-14-01.20.04.png