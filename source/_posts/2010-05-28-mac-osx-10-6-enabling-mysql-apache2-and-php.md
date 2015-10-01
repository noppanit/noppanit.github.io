---
title: Mac OSX 10.6 Enabling MySQL, Apache2 and PHP.
author: Noppanit Charassinvichai
layout: post
permalink: /mac-osx-10-6-enabling-mysql-apache2-and-php/
jd_tweet_this:
  - yes
wp_jd_bitly:
  - http://bit.ly/cTT7v7
wp_jd_target:
  - http://bit.ly/cTT7v7
categories:
  - Mac OSX
  - PHP
---
Well I don&#8217;t know that I&#8217;m the only person on earth who has this problem. But I have some troubles to get MySQl, PHP and Apache2 work on my Macbook. Since I have been a windows user for 10 years, switch to Mac user is quite new for me. I use to install everything with .exe files and it&#8217;s dame easy!.

However, after a few months, Mac rocks and also dame easy.

Well, Let&#8217;s get started.

First of all, If you installed Mac Server, It&#8217;s already bundled with everything, PHP, Apache and MySQL. But If you&#8217;re not. Mac Snow Leopard already comes with Apache already you just have to enable it.

# Apache



<p style="text-align: left;">
  1. First go to System Preferences.<br /> 2. And then go to Sharing.<br /> <a href="http://www.noppanit.com/wp-content/uploads/2010/05/Screen-shot-2010-05-28-at-09.31.56.png"><img class="size-medium wp-image-534 aligncenter" title="Enable PHP in Mac Snow" src="http://www.noppanit.com/wp-content/uploads/2010/05/Screen-shot-2010-05-28-at-09.31.56-215x300.png" alt="Enable PHP in Mac Snow" width="215" height="300" /></a><br /> 3. And click at Web Sharing, the indicator light will go green. That means your apache is now ready to use.<br /> 4. You can try this link at your browser http://localhost/~yourusername. If you see the page like below image, that means your Apache is now ready to use.<br /> <a href="http://www.noppanit.com/wp-content/uploads/2010/05/Screen-shot-2010-05-28-at-09.36.05.png"><img class="size-medium wp-image-536 aligncenter" title="Apache 2 Mac Snow" src="http://www.noppanit.com/wp-content/uploads/2010/05/Screen-shot-2010-05-28-at-09.36.05-300x214.png" alt="Apache 2 Mac Snow" width="300" height="214" /></a>
</p>

Pretty Easy Isn&#8217;t it? now next step is PHP, You have just enabled apache, but that doesn&#8217;t mean you enable PHP already. Well Mac also integrated with PHP already. You just have to enable it, but in a different way. 

# PHP

1. Go to terminal  
2. Type

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
          <span class="kw3">cd</span> <span class="sy0">/</span>private<span class="sy0">/</span>etc<span class="sy0">/</span>apache2
        </div>
      </td>
    </tr>
  </table>
</div>

3. Then

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
          <span class="kw2">sudo</span> mate httpd.conf
        </div>
      </td>
    </tr>
  </table>
</div>

4. If you don&#8217;t have TextMate you can use TextEdit instead. Or any editor you like  
5. Go to line 115 that says

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
          #LoadModule php5_module &nbsp; &nbsp; &nbsp; &nbsp;libexec/apache2/libphp5.so
        </div>
      </td>
    </tr>
  </table>
</div>

6. Uncomment it, so it will be

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
          LoadModule php5_module &nbsp; &nbsp; &nbsp; &nbsp;libexec/apache2/libphp5.so
        </div>
      </td>
    </tr>
  </table>
</div>

7. This will enable PHP in your computer.  
8. Almost there, now go to terminal again, type

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
          <span class="kw3">cd</span> <span class="sy0">/</span>private<span class="sy0">/</span>etc
        </div>
      </td>
    </tr>
  </table>
</div>

9. Just in case that you&#8217;re not in the etc folder  
10. PHP is configured by php.ini, and you need that. But, now you have php.ini.default, you just have to change the file name to php.ini. Now type

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
          <span class="kw2">sudo</span> <span class="kw2">cp</span> php.ini.default php.ini
        </div>
      </td>
    </tr>
  </table>
</div>

11. You can now start Apache by going to System Preferences. Click Sharing in Internet & Network. Then place a checkmark in Web Sharing. When Apache starts up, System Preferences should display Web Sharing: On.  
12. Create a page called test.php, and type in the following code: <?php phpinfo(); ?> Save it in Macintosh ~username/Sites

  
13. And then test it. http://localhost/~yourusername/test.php.  
14. You should get the php info page.

Reference:  
<http://foundationphp.com/tutorials/php_leopard.php>

# MySQL

1. Well, I suggest you to download .dmg file of MySQL, because it&#8217;s easier to install and it comes with System Preferences panel where you can start and stop MySQL in a click.  
2. Install 3 files of MySQL and go to System Preferences, you should see a MySQL icon under section &#8220;Other&#8221; and open it.  
3. Click Start MySQL Server, you should get a green indicator light.  
4. Now, your MySQL is ready to use, but it&#8217;s not finished yet.  
5. Go to terminal and type

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
          <span class="sy0">/</span>usr<span class="sy0">/</span>local<span class="sy0">/</span>mysql<span class="sy0">/</span>bin<span class="sy0">/</span>mysqladmin <span class="re5">-u</span> root password yourpassword
        </div>
      </td>
    </tr>
  </table>
</div>

6. This will setup your root password  
6. And I also suggest you to create a symbolic link to your the bin directory.  
7. Go to terminal again and type. This command will take you to your home user directory.

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
          <span class="kw3">cd</span>
        </div>
      </td>
    </tr>
  </table>
</div>

8. Type

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
          mate .profile
        </div>
      </td>
    </tr>
  </table>
</div>

9. Insert this line of code

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
          export PATH=/usr/local/mysql/bin:$PATH
        </div>
      </td>
    </tr>
  </table>
</div>

Reference [http://www.tech-recipes.com/rx/2621/os\_x\_change\_path\_environment_variable][1]  
10. Now the final touch.  
One thing changed with Leopard is the socket for Mysql. It moved to /private/tmp, so you may need to configure your php.ini file to point it to the new location.

To do so, open the file ‘/private/etc/php.ini‘, (if no such file exists, then make a copy of ‘/private/etc/php.ini.default‘ naming it ‘php.ini‘) and edit that.

You have two lines to modify:

mysql.default_socket =

becomes:

mysql.default_socket = /private/tmp/mysql.sock

and mysqli.default_socket =

becomes:

mysqli.default_socket = /private/tmp/mysql.sock

of course, from the sharing pref pane, stop the server and restart it and voila!  
Reference: <http://mymacinations.com/2007/10/28/apache-php-and-mysql-on-leopard/>

 [1]: http://www.tech-recipes.com/rx/2621/os_x_change_path_environment_variable/