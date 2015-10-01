---
title: 'Linux : Easier way to copy to clipboard in terminal'
author: Noppanit Charassinvichai
layout: post
permalink: /linux-easier-way-to-copy-to-clipboard-in-terminal/
dsq_thread_id:
  - 240430741
categories:
  - Knowledges
---
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
          cat test.txt | pbcopy
        </div>
      </td>
    </tr>
  </table>
</div>

pbcopy is to copy the text before the pipe sign.  
pbpaste it to paste everything in the clipboard.