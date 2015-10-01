---
title: 'Ruby on Rails: Disable database connection'
author: Noppanit Charassinvichai
layout: post
permalink: /ruby-on-rails-disable-database-connection/
jd_tweet_this:
  - yes
wp_jd_bitly:
  - http://bit.ly/6OGBFA
wp_jd_target:
  - http://www.noppanit.com/ruby-on-rails-disable-database-connection/
dsq_thread_id:
  - 183380286
categories:
  - Rails
---
Well, I have just entered to the world of ruby. After walked through a demo application. I suddenly encountered a little problem. I created a demo application and it required to use database connection to mysql, or simply Active Record, which I don&#8217;t want to because it&#8217;s just a demo application. And every time I refresh my application, WebBrick will give me a error about database connection failed. Here&#8217;s how to shutdown the Active Record system

In environment.rb looking for the line

<div class="codecolorer-container ruby blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />
        </div>
      </td>
      
      <td>
        <div class="ruby codecolorer">
          <span class="co1"># Skip frameworks you're not going to use. To use Rails without a database,</span><br /> <span class="co1"># you must remove the Active Record framework.</span><br /> <span class="co1">#config.frameworks -= [ :active_record, :active_resource, :action_mailer ]</span>
        </div>
      </td>
    </tr>
  </table>
</div>

Uncomment the line config.frameworks&#8230; to be

<div class="codecolorer-container ruby blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />
        </div>
      </td>
      
      <td>
        <div class="ruby codecolorer">
          <span class="co1"># Skip frameworks you're not going to use. To use Rails without a database,</span><br /> <span class="co1"># you must remove the Active Record framework.</span><br /> config.<span class="me1">frameworks</span> <span class="sy0">-</span>= <span class="br0">&#91;</span> <span class="re3">:active_record</span>, <span class="re3">:active_resource</span>, <span class="re3">:action_mailer</span> <span class="br0">&#93;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

Simply just that!.