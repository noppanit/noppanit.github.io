---
title: Recursively delete file or folder from sub-directory
author: Noppanit Charassinvichai
layout: post
permalink: /recursively-delete-file-or-folder-from-sub-directory/
jd_tweet_this:
  - yes
wp_jd_bitly:
  - http://bit.ly/99BcAY
wp_jd_target:
  - http://www.noppanit.com/recursively-delete-file-or-folder-from-sub-directory/
dsq_thread_id:
  - 305846821
categories:
  - Mac OSX
  - Ubuntu
---
I used an example from deleting all .svn from sub-directory.

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
          <span class="kw2">rm</span> <span class="re5">-rf</span> <span class="sy0">`</span><span class="kw2">find</span> . <span class="re5">-type</span> d <span class="re5">-name</span> .svn<span class="sy0">`</span>
        </div>
      </td>
    </tr>
  </table>
</div>