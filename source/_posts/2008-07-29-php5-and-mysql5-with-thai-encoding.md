---
title: PHP5 and MySQL5 With Thai Encoding
author: Noppanit Charassinvichai
layout: post
permalink: /php5-and-mysql5-with-thai-encoding/
jd_tweet_this:
  - yes
dsq_thread_id:
  - 246441080
categories:
  - PHP
tags:
  - mysql5
  - PHP
---
Use this code to enable thai support

<div class="codecolorer-container php blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />15<br />16<br />
        </div>
      </td>
      
      <td>
        <div class="php codecolorer">
          <span class="re0">$dbhost</span> <span class="sy0">=</span> <span class="st_h">'localhost'</span><span class="sy0">;</span><br /> <span class="re0">$dbuser</span> <span class="sy0">=</span> <span class="st_h">'user'</span><span class="sy0">;</span><br /> <span class="re0">$dbpass</span> <span class="sy0">=</span> <span class="st_h">'pass'</span><span class="sy0">;</span><br /> <br /> <span class="re0">$conn</span> <span class="sy0">=</span> <a href="http://www.php.net/mysql_connect"><span class="kw3">mysql_connect</span></a><span class="br0">&#40;</span><span class="re0">$dbhost</span><span class="sy0">,</span> <span class="re0">$dbuser</span><span class="sy0">,</span> <span class="re0">$dbpass</span><span class="br0">&#41;</span> or <a href="http://www.php.net/die"><span class="kw3">die</span></a> <span class="br0">&#40;</span><span class="st_h">'Error connecting to mysql'</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> <br /> <span class="re0">$dbname</span> <span class="sy0">=</span> <span class="st_h">'webboard'</span><span class="sy0">;</span><br /> <br /> <a href="http://www.php.net/mysql_select_db"><span class="kw3">mysql_select_db</span></a><span class="br0">&#40;</span><span class="re0">$dbname</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> <br /> <a href="http://www.php.net/mysql_query"><span class="kw3">mysql_query</span></a><span class="br0">&#40;</span><span class="st0">"SET character_set_results=tis620"</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> <a href="http://www.php.net/mysql_query"><span class="kw3">mysql_query</span></a><span class="br0">&#40;</span><span class="st0">"SET character_set_client='tis620'"</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> <a href="http://www.php.net/mysql_query"><span class="kw3">mysql_query</span></a><span class="br0">&#40;</span><span class="st0">"SET character_set_connection='tis620'"</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> <a href="http://www.php.net/mysql_query"><span class="kw3">mysql_query</span></a><span class="br0">&#40;</span><span class="st0">"collation_connection = tis620_thai_ci"</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> <a href="http://www.php.net/mysql_query"><span class="kw3">mysql_query</span></a><span class="br0">&#40;</span><span class="st0">"collation_database = tis620_thai_ci"</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> <a href="http://www.php.net/mysql_query"><span class="kw3">mysql_query</span></a><span class="br0">&#40;</span><span class="st0">"collation_server = tis620_thai_ci"</span><span class="br0">&#41;</span><span class="sy0">;</span>
        </div>
      </td>
    </tr>
  </table>
</div>