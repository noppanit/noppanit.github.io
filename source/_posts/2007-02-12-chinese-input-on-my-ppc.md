---
title: Chinese input on my PPC
author: Noppanit Charassinvichai
layout: post
permalink: /chinese-input-on-my-ppc/
dsq_thread_id:
  - 243601883
categories:
  - PPC
---
<p align="left">
  After, I was buy my new Pocket PC for two day. This is a way to do.
</p>

1. [<span style="white-space: nowrap"><img src="http://wiki.xda-developers.com/themes/default/images/http.png" class="linkicon" border="0" />Download</span> CE-Star 2.8 Suits for WM5 here][1]{.namedurl}

2. Extract the zip file and locate the sunglobe.ttf font file

<p class="tightenable">
  3. Copy this to your
</p>

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
          \Windows
        </div>
      </td>
    </tr>
  </table>
</div>

directory on your mobile device

<p class="tightenable">
  4. In your WM5 registry, under
</p>

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
          HKEY_LOCAL_MACHINE\Software\Microsoft\
        </div>
      </td>
    </tr>
  </table>
</div>

add a new key call

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
          FontLink
        </div>
      </td>
    </tr>
  </table>
</div>

. Then, under this newly added

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
          FontLink
        </div>
      </td>
    </tr>
  </table>
</div>

key add another key call

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
          SystemLink
        </div>
      </td>
    </tr>
  </table>
</div>

. Example, you should now have the following in your registry

<blockquote class="tightenable">
  <p class="tightenable top bottom">
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
              HKEY_LOCAL_MACHINE\Software\Microsoft\FontLink\SystemLink
            </div>
          </td>
        </tr>
      </table>
    </div>
  </p>
</blockquote>

<p class="tightenable">
  5. Now add the following 4 &#8220;String&#8221; values to
</p>

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
          HKEY_LOCAL_MACHINE\Software\Microsoft\FontLink\SystemLink
        </div>
      </td>
    </tr>
  </table>
</div>

(or just [<span style="white-space: nowrap"><img src="http://wiki.xda-developers.com/themes/default/images/http.png" class="linkicon" border="0" />download</span> and install this cab][2]{.namedurl})

<blockquote class="tightenable">
  <p class="tightenable top">
    [Name of value] <strong>[Value (in bold)]</strong>
  </p>
  
  <p class="tightenable bottom">
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
              Times New Roman <strong>\Windows\sunglobe.ttf,UniSun</strong>
            </div>
          </td>
        </tr>
      </table>
    </div>
    
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
              Arial <strong>\Windows\sunglobe.ttf,UniSun</strong>
            </div>
          </td>
        </tr>
      </table>
    </div>
    
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
              Courier New <strong>\Windows\sunglobe.ttf,UniSun</strong>
            </div>
          </td>
        </tr>
      </table>
    </div>
    
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
              Tahoma <strong>\Windows\sunglobe.ttf,UniSun</strong>
            </div>
          </td>
        </tr>
      </table>
    </div></blockquote> 
    
    <p class="tightenable">
      6. Do a soft reset and you are done.<br /> Note: WM5 has delayed registry updating, the registry changes may disappear if you soft reset too fast. Try switching off/on (sleep/wake) or try to modify some settings (like ringtone) before you do a soft reset. If things doesn&#8217;t work, probably just because of this. Double check to avoid disappointment.
    </p>
    
    <p class="tightenable">
      Note: Some devices may need the file
    </p>
    
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
              wince.nls
            </div>
          </td>
        </tr>
      </table>
    </div>
    
    <p>
      to able to view Chinese. Refer to `Multi language support` at the Related threads section below.
    </p>
    
    <h4>
      1.1.2 &#8211; Chinese SIP (require approx 1.5MB)
    </h4>
    
    <p class="tightenable">
      1. <a href="http://xdao2.seesaa.net/article/12029203.html" class="namedurl"><span style="white-space: nowrap">Go</span> to Asukal&#8217;s page</a> and look for `Chinese FEP for WM5 Down load 1.5MB` near the bottom of the page<br /> <a href="http://www.asukal.jp/SIP/ChinaFEP_No5en.zip" class="namedurl"><span style="white-space: nowrap">Direct</span> link (ChinaFEP_No5en.zip)</a>
    </p>
    
    <p class="tightenable" align="left">
      Reference from : <a href="http://wiki.xda-developers.com/index.php?pagename=WM5_Tweak_Language_Chinese">http://wiki.xda-developers.com/index.php?pagename=WM5_Tweak_Language_Chinese</a>
    </p>
  </p>

 [1]: http://www.mobem.com/download/index2.php?pro=suitewm5
 [2]: http://forum.xda-developers.com/download.php?id=12134