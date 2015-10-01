---
title: Apache2 only serves the first virtual host
author: Noppanit Charassinvichai
layout: post
permalink: /apache2-only-serves-the-first-virtual-host/
dsq_thread_id:
  - 290948211
categories:
  - Techniques
---
I&#8217;m trying to add another virtual host, but for som reason. Apache2 only points to the first virtual host.  
The easiest way to fix this problem is to include

<div class="codecolorer-container text blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />
        </div>
      </td>
      
      <td>
        <div class="text codecolorer">
          NameVirtualHost * # Include this line. <br /> <br /> <VirtualHost *><br /> DocumentRoot /path/to/site<br /> ServerName www.yoursite.com<br /> </VirtualHost>
        </div>
      </td>
    </tr>
  </table>
</div>

in the conf file of apache2

Reference: <http://alexking.org/blog/2007/11/01/apache-2-only-serves-first-virtual-host>