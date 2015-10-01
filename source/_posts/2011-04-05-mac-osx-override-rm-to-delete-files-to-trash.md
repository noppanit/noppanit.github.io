---
title: 'Mac OSX: override rm to delete files to .Trash'
author: Noppanit Charassinvichai
layout: post
permalink: /mac-osx-override-rm-to-delete-files-to-trash/
dsq_thread_id:
  - 271869184
categories:
  - Mac OSX
---
So silly of me I have just &#8220;accidentally&#8221; deleted my home directory T_T. There is a way to help that by override rm command to move file to .Trash. 

Just copy this code to ~/.bash_profile and restart your terminal.

<div class="codecolorer-container text blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />15<br />
        </div>
      </td>
      
      <td>
        <div class="text codecolorer">
          function rm () {<br /> &nbsp; local path<br /> &nbsp; for path in "$@"; do<br /> &nbsp; &nbsp; # ignore any arguments<br /> &nbsp; &nbsp; if [[ "$path" = -* ]]; then :<br /> &nbsp; &nbsp; else<br /> &nbsp; &nbsp; &nbsp; local dst=${path##*/}<br /> &nbsp; &nbsp; &nbsp; # append the time if necessary<br /> &nbsp; &nbsp; &nbsp; while [ -e ~/.Trash/"$dst" ]; do<br /> &nbsp; &nbsp; &nbsp; &nbsp; dst="$dst "$(date +%H-%M-%S)<br /> &nbsp; &nbsp; &nbsp; done<br /> &nbsp; &nbsp; &nbsp; mv "$path" ~/.Trash/"$dst"<br /> &nbsp; &nbsp; fi<br /> &nbsp; done<br /> }
        </div>
      </td>
    </tr>
  </table>
</div>