---
title: How to display php error on the web page
author: Noppanit Charassinvichai
layout: post
permalink: /how-to-display-php-error-on-the-web-page/
jd_tweet_this:
  - yes
wp_jd_bitly:
  - http://bit.ly/aiHO6E
wp_jd_target:
  - http://www.noppanit.com/how-to-display-php-error-on-the-web-page/
dsq_thread_id:
  - 264150968
categories:
  - PHP
---
Has anybody been curious about why my error on .php file is display on error\_log in apache2? Why my error doesn&#8217;t print on the screen. So that I don&#8217;t have to go to the error\_log and tail all the time. Or it&#8217;s just me. I am a total newbie in PHP and apache2. 

Here&#8217;s the thing.

Put that code on top of your first php file and the scariest thing will appear on your screen

<div class="codecolorer-container php blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />
        </div>
      </td>
      
      <td>
        <div class="php codecolorer">
          <a href="http://www.php.net/ini_set"><span class="kw3">ini_set</span></a><span class="br0">&#40;</span><span class="st_h">'display_errors'</span><span class="sy0">,</span> <span class="nu0">1</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> <a href="http://www.php.net/ini_set"><span class="kw3">ini_set</span></a><span class="br0">&#40;</span><span class="st_h">'log_errors'</span><span class="sy0">,</span> <span class="nu0">1</span><span class="br0">&#41;</span><span class="sy0">;</span>
        </div>
      </td>
    </tr>
  </table>
</div>