---
title: 'ActionScript3 : Get WebCam to use in Flash CS3'
author: Noppanit Charassinvichai
layout: post
permalink: /actionscript3-get-webcam-to-use-in-flash-cs3/
jd_tweet_this:
  - yes
wp_jd_bitly:
  - http://bit.ly/8kSbWh
wp_jd_target:
  - http://www.noppanit.com/actionscript3-get-webcam-to-use-in-flash-cs3/
dsq_thread_id:
  - 184131784
categories:
  - Flash
---
If you want to use camera or webcam in Flash CS3 or Flash CS4 for actionscript3. You can use actionScript3 to get camera and display in video symbol. I will just show the script, because it will be too easy for some expert Flash Developers <img src="http://www.noppanit.com/wp-includes/images/smilies/simple-smile.png" alt=":)" class="wp-smiley" style="height: 1em; max-height: 1em;" />

<div class="codecolorer-container actionscript3 blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />
        </div>
      </td>
      
      <td>
        <div class="actionscript3 codecolorer">
          <span class="kw1">import</span> <span class="kw6">flash.display</span><span class="sy0">.*;</span><br /> <span class="kw1">import</span> <span class="kw6">flash.geom</span><span class="sy0">.*;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

<div class="codecolorer-container actionscript3 blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />
        </div>
      </td>
      
      <td>
        <div class="actionscript3 codecolorer">
          &nbsp;
        </div>
      </td>
    </tr>
  </table>
</div>

<div class="codecolorer-container actionscript3 blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />
        </div>
      </td>
      
      <td>
        <div class="actionscript3 codecolorer">
          <span class="kw2">var</span> cam<span class="sy0">:</span><a href="http://www.google.com/search?q=camera%20inurl:http://livedocs.adobe.com/flex/201/langref/%20inurl:camera.html"><span class="kw5">Camera</span></a> = <a href="http://www.google.com/search?q=camera%20inurl:http://livedocs.adobe.com/flex/201/langref/%20inurl:camera.html"><span class="kw5">Camera</span></a><span class="sy0">.</span><span class="kw7">getCamera</span><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> <span class="kw2">var</span> sizeX = cam<span class="sy0">.</span><span class="kw7">width</span><span class="sy0">;</span><br /> <span class="kw2">var</span> sizeY = cam<span class="sy0">.</span><span class="kw7">height</span><span class="sy0">;</span><br /> <br /> cam<span class="sy0">.</span><span class="kw7">setMode</span><span class="br0">&#40;</span> <span class="nu0">544</span><span class="sy0">,</span> <span class="nu0">396</span><span class="sy0">,</span> <span class="nu0">25</span><span class="br0">&#41;</span><span class="sy0">;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

<div class="codecolorer-container actionscript3 blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />
        </div>
      </td>
      
      <td>
        <div class="actionscript3 codecolorer">
          vid<span class="sy0">.</span><span class="kw7">attachCamera</span><span class="br0">&#40;</span>cam<span class="br0">&#41;</span><span class="sy0">;</span> <span class="co1">// attach the camera to video</span><br /> vid<span class="sy0">.</span><span class="kw7">width</span> = cam<span class="sy0">.</span><span class="kw7">width</span><span class="sy0">;</span><br /> vid<span class="sy0">.</span><span class="kw7">height</span> = cam<span class="sy0">.</span><span class="kw7">height</span><span class="sy0">;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

While vid is your instance name of Video.

Note: For iSight for Mac users like me :). You have to change a little bit in setting of camera in Flash Player. You have to choose USB Video Class Video.

[<img class="alignnone size-thumbnail wp-image-458" title="Screen shot 2010-01-04 at 22.01.48" src="http://www.noppanit.com/wp-content/uploads/2010/01/Screen-shot-2010-01-04-at-22.01.48-150x150.png" alt="iSight setting for Adobe Flash Player" width="150" height="150" />][1]

 [1]: http://www.noppanit.com/wp-content/uploads/2010/01/Screen-shot-2010-01-04-at-22.01.48.png