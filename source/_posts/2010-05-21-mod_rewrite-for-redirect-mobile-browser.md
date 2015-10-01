---
title: 'mod_rewrite for redirect mobile browser&#8221;'
author: Noppanit Charassinvichai
layout: post
permalink: /mod_rewrite-for-redirect-mobile-browser/
dsq_thread_id:
  - 186002884
---
<div class="codecolorer-container apache blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />15<br />
        </div>
      </td>
      
      <td>
        <div class="apache codecolorer">
          <span class="kw1">RewriteEngine</span> <span class="kw2">On</span><br /> <span class="kw1">RewriteCond</span> %{REQUEST_URI} !^/m/.*$<br /> <span class="kw1">RewriteCond</span> %{REQUEST_URI} !^/blog/.*$<br /> <span class="kw1">RewriteCond</span> %{HTTP_ACCEPT} <span class="st0">"text/vnd.wap.wml|application/vnd.wap.xhtml+xml"</span> [NC,OR]<br /> <span class="kw1">RewriteCond</span> %{HTTP_USER_AGENT} <span class="st0">"acs|alav|alca|amoi|audi|aste|avan|benq|bird|blac|blaz|brew|cell|cldc|cmd-"</span> [NC,OR]<br /> <span class="kw1">RewriteCond</span> %{HTTP_USER_AGENT} <span class="st0">"dang|doco|erics|hipt|inno|ipaq|java|jigs|kddi|keji|leno|lg-c|lg-d|lg-g|lge-"</span> [NC,OR]<br /> <span class="kw1">RewriteCond</span> %{HTTP_USER_AGENT} <span class="st0">"maui|maxo|midp|mits|mmef|mobi|mot-|moto|mwbp|nec-|newt|noki|opwv"</span> [NC,OR]<br /> <span class="kw1">RewriteCond</span> %{HTTP_USER_AGENT} <span class="st0">"palm|pana|pant|pdxg|phil|play|pluc|port|prox|qtek|qwap|sage|sams|sany"</span> [NC,OR]<br /> <span class="kw1">RewriteCond</span> %{HTTP_USER_AGENT} <span class="st0">"sch-|sec-|send|seri|sgh-|shar|sie-|siem|smal|smar|sony|sph-|symb|t-mo"</span> [NC,OR]<br /> <span class="kw1">RewriteCond</span> %{HTTP_USER_AGENT} <span class="st0">"teli|tim-|tosh|tsm-|upg1|upsi|vk-v|voda|w3cs|wap-|wapa|wapi"</span> [NC,OR]<br /> <span class="kw1">RewriteCond</span> %{HTTP_USER_AGENT} <span class="st0">"wapp|wapr|webc|winw|winw|xda|xda-"</span> [NC,OR]<br /> <span class="kw1">RewriteCond</span> %{HTTP_USER_AGENT} <span class="st0">"up.browser|up.link|windowssce|iemobile|mini|mmp"</span> [NC,OR]<br /> <span class="kw1">RewriteCond</span> %{HTTP_USER_AGENT} <span class="st0">"blackberry|symbian|midp|wap|phone|pocket|mobile|pda|psp"</span> [NC]<br /> <span class="kw1">RewriteCond</span> %{HTTP_USER_AGENT} !macintosh [NC]<br /> <span class="kw1">RewriteRule</span> ^(.*)$ /m/ [L,R=<span class="nu0">302</span>]
        </div>
      </td>
    </tr>
  </table>
</div>

New device need to be added.

Ref: <http://www.projectronin.com/blog/?p=10>