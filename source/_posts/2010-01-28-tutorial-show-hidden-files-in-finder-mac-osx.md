---
title: 'Tutorial : Show hidden files in Finder Mac OSX'
author: Noppanit Charassinvichai
layout: post
permalink: /tutorial-show-hidden-files-in-finder-mac-osx/
jd_tweet_this:
  - yes
wp_jd_bitly:
  - http://bit.ly/cpY0CT
wp_jd_target:
  - http://www.noppanit.com/tutorial-show-hidden-files-in-finder-mac-osx/
dsq_thread_id:
  - 256854057
categories:
  - Mac OSX
---
Unlike windows, Mac OSX has a different to show hidden files. We just can&#8217;t right click and show all files. 

So, in Mac OSX we need to go to Terminal and put this command.  
To open show all files

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
          defaults <span class="kw2">write</span> com.apple.finder AppleShowAllFiles TRUE
        </div>
      </td>
    </tr>
  </table>
</div>

To disable show all files

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
          defaults <span class="kw2">write</span> com.apple.finder AppleShowAllFiles FLASE
        </div>
      </td>
    </tr>
  </table>
</div>

And then kill all the Finder apps and start it up again.

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
          <span class="kw2">killall</span> Finder
        </div>
      </td>
    </tr>
  </table>
</div>