---
title: 'Tutorial : PHP Cannot modify header information'
author: Noppanit Charassinvichai
layout: post
permalink: /tutorial-php-cannot-modify-header-information/
dsq_thread_id:
  - 249255197
categories:
  - PHP
---
Reference : PHP Cookbook, O&#8217;REILLY

I don&#8217;t know that some of you have this problem for a long time like me. I have this problem when I want to redirect my PHP to another php page. I get this error. **Warning**: Cannot modify header information &#8211; headers already sent by (output started at / blah blah blah&#8230;

Well, the problem is you trying to redirect page in PHP, the Location goes with the header of the URL. If you also print something out on the page, you will get this error. So, put the header code at the top of the page before anything.

Redirect to a different location

**Problem**  
You want to automatically send a user to a new URL. For example, after successfully saving from data, you want to redirect a user to a page that confirms that the data has been saved.

**Solution**  
Before any output is printed, use [header()][1]. to send a Location header with the new URL and then call exit() so that nothing else if printed.

<div class="codecolorer-container php blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />
        </div>
      </td>
      
      <td>
        <div class="php codecolorer">
          <span class="kw2"><?php</span><br /> &nbsp; <a href="http://www.php.net/header"><span class="kw3">header</span></a><span class="br0">&#40;</span><span class="st_h">'Location: http://www.example.com'</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; <a href="http://www.php.net/exit"><span class="kw3">exit</span></a><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> <span class="sy1">?></span>
        </div>
      </td>
    </tr>
  </table>
</div>

If you are trying to do something like this, you will get the error

<div class="codecolorer-container php blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />
        </div>
      </td>
      
      <td>
        <div class="php codecolorer">
          <span class="kw2"><?php</span><br /> &nbsp; <a href="http://www.php.net/session_start"><span class="kw3">session_start</span></a><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; <span class="kw1">if</span><span class="br0">&#40;</span> <span class="sy0">!</span><a href="http://www.php.net/isset"><span class="kw3">isset</span></a><span class="br0">&#40;</span> <span class="re0">$_SESSION</span><span class="br0">&#91;</span><span class="st0">"username"</span><span class="br0">&#93;</span> <span class="br0">&#41;</span><span class="br0">&#41;</span><br /> &nbsp; <span class="br0">&#123;</span><br /> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span class="kw1">echo</span> <span class="st0">"User : "</span><span class="sy0">.</span><span class="re0">$_SESSION</span><span class="br0">&#91;</span><span class="st_h">'username'</span><span class="br0">&#93;</span><span class="sy0">;</span><br /> &nbsp; &nbsp; <a href="http://www.php.net/header"><span class="kw3">header</span></a><span class="br0">&#40;</span> <span class="st_h">'Location: http://www.example/index.php'</span> <span class="br0">&#41;</span> <span class="sy0">;</span><br /> &nbsp; &nbsp; <a href="http://www.php.net/exit"><span class="kw3">exit</span></a><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp; <span class="br0">&#125;</span><br /> <span class="sy1">?></span>
        </div>
      </td>
    </tr>
  </table>
</div>

Please be aware that Redirect URLs should include the protocol and hostname. They shouldn&#8217;t be just a pathname like this.

<div class="codecolorer-container php blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />
        </div>
      </td>
      
      <td>
        <div class="php codecolorer">
          &nbsp; <span class="co1">// Good redirect</span><br /> &nbsp; <a href="http://www.php.net/header"><span class="kw3">header</span></a><span class="br0">&#40;</span><span class="st_h">'Location: http://www.example.com'</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> <br /> &nbsp; <span class="co1">// Bad redirect</span><br /> &nbsp; <a href="http://www.php.net/header"><span class="kw3">header</span></a><span class="br0">&#40;</span><span class="st_h">'Location: /catalog/food/pemmican.php'</span><span class="br0">&#41;</span><span class="sy0">;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

 [1]: http://php.net/manual/en/function.header.php