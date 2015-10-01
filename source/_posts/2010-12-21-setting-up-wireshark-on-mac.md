---
title: Setting up Wireshark on Mac
author: Noppanit Charassinvichai
layout: post
permalink: /setting-up-wireshark-on-mac/
dsq_thread_id:
  - 195382981
categories:
  - Knowledges
---
I know this might sound stupid and somebody might say &#8220;Just double click the DMG file&#8221;. Well, I have so much troubles without reading the ReadMeFile.txt. And I think this website is really helpful if you guys are into tcpdump and want to learn more about Wireshark

How to install properly  
<http://josephhall.org/nqb2/index.php/2009/07/21/wrshrkinstll>

And after you restart your mac, If you get this error &#8220;Insecure Startup Items folder detected.  
Items in the Startup Items folder (&#8220;/Library/  
StartupItems/&#8221;) have not been started because the  
folder does not have the proper security settings&#8221;

Then do this, this is to set permission to /Library/StartupItems

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
          sudo chown -R root:wheel /Library/StartupItems<br /> sudo chmod -R 0755 /Library/StartupItems
        </div>
      </td>
    </tr>
  </table>
</div>

Ref: <http://reviews.cnet.com/8301-13727_7-10439851-263.html>

And that&#8217;s it. You will see your interfaces come up in Wireshark now, if you don&#8217;t set permission properly, the app will give you an error.