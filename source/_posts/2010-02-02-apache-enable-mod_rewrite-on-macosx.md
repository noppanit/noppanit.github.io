---
title: 'Apache : Enable mod_rewrite on MacOSX'
author: Noppanit Charassinvichai
layout: post
permalink: /apache-enable-mod_rewrite-on-macosx/
jd_tweet_this:
  - yes
wp_jd_bitly:
  - http://bit.ly/9S4vd8
wp_jd_target:
  - http://www.noppanit.com/apache-enable-mod_rewrite-on-macosx/
dsq_thread_id:
  - 183392139
categories:
  - Mac OSX
---
Reference <http://www.deheus.net/petrik/blog/2005/02/11/getting-mod_rewrite-to-work-on-mac-os-x/>

First go to /private/etc/apache2/httpd.conf  
Remove # from

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
          LoadModule rewrite_module &nbsp; &nbsp; libexec/httpd/mod_rewrite.so
        </div>
      </td>
    </tr>
  </table>
</div>

Second go to /private/etc/apache2/user/your-username.conf  
Change AllowOverride None to AllowOverride all

Third restart the apache2

<div class="codecolorer-container bash blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />
        </div>
      </td>
      
      <td>
        <div class="bash codecolorer">
          <span class="kw2">sudo</span> <span class="sy0">/</span>usr<span class="sy0">/</span>sbin<span class="sy0">/</span><span class="kw2">apachectl restart</span>
        </div>
      </td>
    </tr>
  </table>
</div>

If you need to see the log of mod_rewrite in case that something bad happen just go back to /private/etc/apache2/user/you-username.conf

Add these lines

<div class="codecolorer-container text blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />
        </div>
      </td>
      
      <td>
        <div class="text codecolorer">
          RewriteLog "/private/var/log/httpd/rewrite_log" &nbsp; <br /> RewriteLogLevel 9
        </div>
      </td>
    </tr>
  </table>
</div>