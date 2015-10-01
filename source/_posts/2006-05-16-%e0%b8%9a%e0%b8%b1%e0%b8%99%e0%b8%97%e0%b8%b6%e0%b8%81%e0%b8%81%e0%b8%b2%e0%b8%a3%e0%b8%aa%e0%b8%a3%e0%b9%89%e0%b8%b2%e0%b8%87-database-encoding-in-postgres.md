---
title: 'Database Encoding for Postgres &#8211; UTF-8'
author: Noppanit Charassinvichai
layout: post
permalink: /%e0%b8%9a%e0%b8%b1%e0%b8%99%e0%b8%97%e0%b8%b6%e0%b8%81%e0%b8%81%e0%b8%b2%e0%b8%a3%e0%b8%aa%e0%b8%a3%e0%b9%89%e0%b8%b2%e0%b8%87-database-encoding-in-postgres/
dsq_thread_id:
  - 243600272
categories:
  - Database
  - Postgres
---
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
          createdb -E UTF-8 $db_name<br /> createlang plpgsql $db_name
        </div>
      </td>
    </tr>
  </table>
</div>