---
title: 'Tutorial : Move WordPress blog to new domain or location'
author: Noppanit Charassinvichai
layout: post
permalink: /tutorial-move-wordpress-blog-to-new-domain-or-location/
jd_tweet_this:
  - yes
wp_jd_bitly:
  - http://bit.ly/9RCbWn
wp_jd_target:
  - http://www.noppanit.com/tutorial-move-wordpress-blog-to-new-domain-or-location/
dsq_thread_id:
  - 194410627
categories:
  - Knowledges
---
I was going to move my wordpress blog. How the hell I&#8217;m supposed to do. Is that gonna affect me so much.  
Unfortunately, yes, because WordPress uses absolute path to access each page, that means if the URL changes everything will be affected. Apart from re-configure wp-config.php and move everything to the new location. Database needs to be changed as well. 

I have found this code from [http://www.mydigitallife.info/2007/10/01/how-to-move-wordpress-blog-to-new-domain-or-location/ ][1]

Just bang those three sqls into your wordpress sql. It works like magic!.

<div class="codecolorer-container sql blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />
        </div>
      </td>
      
      <td>
        <div class="sql codecolorer">
          <span class="kw1">UPDATE</span> wp_options <span class="kw1">SET</span> option_value <span class="sy0">=</span> <span class="kw1">REPLACE</span><span class="br0">&#40;</span>option_value<span class="sy0">,</span> <span class="st0">'http://www.old-domain.com'</span><span class="sy0">,</span> <span class="st0">'http://www.new-domain.com'</span><span class="br0">&#41;</span> <span class="kw1">WHERE</span> option_name <span class="sy0">=</span> <span class="st0">'home'</span> <span class="kw1">OR</span> option_name <span class="sy0">=</span> <span class="st0">'siteurl'</span>;
        </div>
      </td>
    </tr>
  </table>
</div>

<div class="codecolorer-container sql blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />
        </div>
      </td>
      
      <td>
        <div class="sql codecolorer">
          <span class="kw1">UPDATE</span> wp_posts <span class="kw1">SET</span> guid <span class="sy0">=</span> <span class="kw1">REPLACE</span><span class="br0">&#40;</span>guid<span class="sy0">,</span> <span class="st0">'http://www.old-domain.com'</span><span class="sy0">,</span><span class="st0">'http://www.new-domain.com'</span><span class="br0">&#41;</span>;
        </div>
      </td>
    </tr>
  </table>
</div>

<div class="codecolorer-container sql blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />
        </div>
      </td>
      
      <td>
        <div class="sql codecolorer">
          <span class="kw1">UPDATE</span> wp_posts <span class="kw1">SET</span> post_content <span class="sy0">=</span> <span class="kw1">REPLACE</span><span class="br0">&#40;</span>post_content<span class="sy0">,</span> <span class="st0">'http://www.old-domain.com'</span><span class="sy0">,</span> <span class="st0">'http://www.new-domain.com'</span><span class="br0">&#41;</span>;
        </div>
      </td>
    </tr>
  </table>
</div>

That should do it.

If you need more information. Please visit <http://codex.wordpress.org/Moving_WordPress>

 [1]: http://www.mydigitallife.info/2007/10/01/how-to-move-wordpress-blog-to-new-domain-or-location/