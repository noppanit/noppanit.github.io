---
title: 'Problem : CakePHP gets ugly in apache2 with mod_rewrite problem'
author: Noppanit Charassinvichai
layout: post
permalink: /problem-cakephp-gets-ugly-in-apache2-with-mod_rewrite-problem/
jd_tweet_this:
  - yes
dsq_thread_id:
  - 189634851
categories:
  - PHP
---
I have just gone for a new toy, cakePHP, which I have a little problem with the installation. I have a problem with the style in the first page, because It has no colour no style, just plain text. So, the problem is mod_rewrite in apache2. Well, I do simple three things to fix the problem. I hope every one could fix this problem in the same way.

1. First, add the rewrite.load to /etc/apache2/mods-enabled/

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
          sudo ln -s /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/
        </div>
      </td>
    </tr>
  </table>
</div>

2. Edit the apache configuration for my virtualhosting. For example, in my computer I only have one virtual hosting (/var/www) that is default from installation, so I make some adjustment for that (In my case I have to edit this file /etc/apache2/sites-enabled/000-default)

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
          sudo vi /etc/apache2/sites-enabled/000-default
        </div>
      </td>
    </tr>
  </table>
</div>

Change the Allowoverride value to all for the document root directory  
For example, I made change to this part of the configuration:

<pre><div class="codecolorer-container xml blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />
        </div>
      </td>
      
      <td>
        <div class="xml codecolorer">
          <span class="sc3"><span class="re1">&lt;Directory</span> /var/www<span class="re2">/&gt;</span></span><br />
          &nbsp; Options Indexes FollowSymLinks MultiViews<br />
          &nbsp; AllowOverride all<br />
          &nbsp; Order allow,deny<br />
          &nbsp; allow from all<br />
          &nbsp; # This directive allows us to have apache2's default start page<br />
          &nbsp; # in /apache2-default/, but still have / go to the right place<br />
          &nbsp; # Commented out for Ubuntu<br />
          &nbsp; #RedirectMatch ^/$ /apache2-default/<br />
          <span class="sc3"><span class="re1">&lt;/Directory<span class="re2">&gt;</span></span></span>
        </div>
      </td>
    </tr>
  </table>
</div>

</pre>

Finnaly, just restart the apache

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
          sudo /etc/init.d/apache2 restart
        </div>
      </td>
    </tr>
  </table>
</div>