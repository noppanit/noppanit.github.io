---
title: 'Tips: Move joomla to another domain name'
author: Noppanit Charassinvichai
layout: post
permalink: /tips-move-joomla-to-another-domain-name/
jd_tweet_this:
  - yes
wp_jd_bitly:
  - http://bit.ly/aY8Luv
wp_jd_target:
  - http://www.noppanit.com/tips-move-joomla-to-another-domain-name/
dsq_thread_id:
  - 252394622
categories:
  - PHP
---
I don&#8217;t know if it&#8217;s only me that I like to develop my Joomla and other components in localhost and deploy to the actual server when finished. There are some tips to do that all over Google, so I won&#8217;t be repeating it here.

Just a little tip, when you change your username and password of MySQL database, please don&#8217;t forget to change this variable as well.

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
          var $live_site = 'http://www.youdomainname.com';
        </div>
      </td>
    </tr>
  </table>
</div>

I know some tips would say that this is just an optional, but from my experience I had some issues with some components and some images didn&#8217;t show up. When I change this parameter to my actual domain name. It woks very well. 

I hope this little tip would help somebody.