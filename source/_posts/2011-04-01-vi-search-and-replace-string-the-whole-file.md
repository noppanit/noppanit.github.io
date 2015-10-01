---
title: Vi, search and replace string the whole file
author: Noppanit Charassinvichai
layout: post
permalink: /vi-search-and-replace-string-the-whole-file/
dsq_thread_id:
  - 269046760
categories:
  - Knowledges
---
Well this is actually nothing much, but when I was editing 1MB of sql dump file, mate doesn&#8217;t do a very good job because it&#8217;s very slow. So, I go for vi and use this simple command

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
          :<span class="sy0">%</span>s<span class="sy0">/<</span>find_pattern_string<span class="sy0">>/<</span>new_string<span class="sy0">>/</span>g
        </div>
      </td>
    </tr>
  </table>
</div>

And bam every string in the 1MB file changed in a second.