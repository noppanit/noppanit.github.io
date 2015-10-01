---
title: 'Subversion : subversion on ubuntu'
author: Noppanit Charassinvichai
layout: post
permalink: /subversion-subversion-on-ubuntu/
dsq_thread_id:
  - 249957566
categories:
  - Subversion
  - Ubuntu
tags:
  - Subversion
  - svn
  - Ubuntu
---
So, I have just created my googlecode <a href="http://code.google.com/p/teenylibrary/" target="_blank">project</a>. And I have to deal with [subversion][1] which is quite new for me. Anyway, basically, this topic I will present how to create your own repository in ubuntu. I recommended this <a href="http://svnbook.red-bean.com/" target="_blank">book</a> which is very good for anyone who is new to subversion.

Note : I am using ubuntu 8.04. This version is different from the others that it uses **htpasswd** instead of **htpasswd2**.

Step 1, install subversion

<div class="codetop">
  COMMAND
</div>

<div class="codemain">
  $ sudo apt-get install subversion
</div>

Step 2, install Apache2. I&#8217;m using this server to use <a href="http://www.webdav.org/" target="_blank">WEBDAV</a> and because it&#8217;s a very extensible web server.

<div class="codetop">
  COMMAND
</div>

<div class="codemain">
  $ sudo apt-get install apache2 libapache2-svn
</div>

Step 3, make your own repository locally

<div class="codetop">
  COMMAND
</div>

<div class="codemain">
  $ sudo mkdir -p /var/local/svn <&#8211; This is your repository<br /> $ sudo svnadmin create &#8211;fs-type fsfs /var/local/svn <&#8211; Bind it to subversion<br /> $ sudo chown -R www-data:www-data /var/local/svn <&#8211; Change permission
</div>

Step 4, Set configuration for apache2 subversion module. This step, you have to re-configure your apache. It&#8217;s a xml-like config file.

<div class="codetop">
  COMMAND
</div>

<div class="codemain">
  sudo gedit /etc/apache2/mods-enabled/dav_svn.conf
</div>

Modified the file to look like this. Everything you need to know about this file is in the file itself. Just for one thing. If you plan to use multiple repositories use SVNParentPath. But If you have only one repository use SVNPath instead

<div class="codetop">
  /etc/apache2/mods-enabled/dav_svn.conf
</div>

<div class="codemain">
  <Location /svn><br /> DAV svn<br /> SVNParentPath /var/local/svn<br /> </Location>
</div>

Step 5, You have two choices. One is Basic authentication, and SSL access.  
In this topic I use Basic authentication. So, modified the same file dav_svn.conf

<div class="codetop">
  /etc/apache2/mods-enabled/dav_svn.conf
</div>

<div class="codemain">
  <Location /svn><br /> DAV svn<br /> SVNParentPath /var/local/svn<br /> AuthType Basic <&#8211; for basic authentication<br /> AuthName &#8220;Subversion Repository&#8221; <&#8211; name<br /> AuthUserFile /etc/apache2/dav_svn.passwd <&#8211; password file<br /> <LimitExcept GET PROPFIND OPTIONS REPORT><br /> Require valid-user<br /> </LimitExcept><br /> </Location>
</div>

Step 6, Create user and password

<div class="codetop">
  COMMAND
</div>

<div class="codemain">
  & sudo htpasswd -cm /etc/apache2/dav_svn.passwd ${yours username}
</div>

Step 7, Reload the setting

<div class="codetop">
  COMMAND
</div>

<div class="codemain">
  $ sudo /etc/init.d/apache2 reload
</div>

So, now you should be able to access your repository via http://127.0.0.1/svn/${yours repository}  
if you want to change your server name. just edit the file /etc/hosts

Reference : <http://ubuntuforums.org/showthread.php?t=187739>

 [1]: http://subversion.tigris.org/