---
title: 'IntelliJ : Cannot connect to GitHub (OSX) (PublicKey error)'
author: Noppanit Charassinvichai
layout: post
permalink: /intellij-cannot-connect-to-github-osx-publickey-error/
dsq_thread_id:
  - 240497563
categories:
  - Knowledges
---
Have you ever encountered something like this.

<div class="codecolorer-container java blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />
        </div>
      </td>
      
      <td>
        <div class="java codecolorer">
          SSH<span class="sy0">:</span> authentication methods<span class="sy0">:</span> <span class="br0">&#91;</span>publickey, keyboard<span class="sy0">-</span>interactive, password<span class="br0">&#93;</span> last successful method<span class="sy0">:</span> <br /> java.<span class="me1">io</span>.<a href="http://www.google.com/search?hl=en&q=allinurl%3Aioexception+java.sun.com&btnI=I%27m%20Feeling%20Lucky"><span class="kw3">IOException</span></a><span class="sy0">:</span> Authentication failed<span class="sy0">:</span> <br /> &nbsp; at org.<span class="me1">jetbrains</span>.<span class="me1">git4idea</span>.<span class="me1">ssh</span>.<span class="me1">SSHMain</span>.<span class="me1">authenticate</span><span class="br0">&#40;</span>SSHMain.<span class="me1">java</span><span class="sy0">:</span><span class="nu0">280</span><span class="br0">&#41;</span><br /> &nbsp; at org.<span class="me1">jetbrains</span>.<span class="me1">git4idea</span>.<span class="me1">ssh</span>.<span class="me1">SSHMain</span>.<span class="me1">start</span><span class="br0">&#40;</span>SSHMain.<span class="me1">java</span><span class="sy0">:</span><span class="nu0">155</span><span class="br0">&#41;</span><br /> &nbsp; at org.<span class="me1">jetbrains</span>.<span class="me1">git4idea</span>.<span class="me1">ssh</span>.<span class="me1">SSHMain</span>.<span class="me1">main</span><span class="br0">&#40;</span>SSHMain.<span class="me1">java</span><span class="sy0">:</span><span class="nu0">135</span><span class="br0">&#41;</span><br /> fatal<span class="sy0">:</span> The remote end hung up unexpectedly
        </div>
      </td>
    </tr>
  </table>
</div>

And you cannot push you code to GitHub, then you may not register your key with GitHub and it causes that error. 

Please follow these steps. <http://help.github.com/mac-key-setup/>