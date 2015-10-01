---
title: 'Tutorial : Moving a website permanently with SEO-friendly'
author: Noppanit Charassinvichai
layout: post
permalink: /tutorial-moving-a-website-permanently-with-seo-friendly/
wp_jd_bitly:
  - http://bit.ly/9EFkOh
wp_jd_target:
  - http://www.noppanit.com/tutorial-moving-a-website-permanently-with-seo-friendly/
jd_tweet_this:
  - yes
categories:
  - Knowledges
tags:
  - 301
  - apache
  - mod_rewrite
  - redirect
---
The best way to move a website permanently and SEO-friendly is using 301 redirect. Or if you have two domain names like, example.com and example.co.uk and what you want is, every time user comes to example.co.uk the website should redirect automatically to example.com. The answer is 301 redirect.

1. create a .htaccess file in your root directory of the domain name that you want to move.  
2. place this code

<div class="codecolorer-container text blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />
        </div>
      </td>
      
      <td>
        <div class="text codecolorer">
          Options +FollowSymLinks<br /> RewriteEngine on<br /> RewriteRule (.*) http://www.newdomain.com/$1 [R=301,L]
        </div>
      </td>
    </tr>
  </table>
</div>

Change www.newdomain.com to your new domain name. 

Please be sure that you are using Apache as a web server, because we are using mod_rewrite.