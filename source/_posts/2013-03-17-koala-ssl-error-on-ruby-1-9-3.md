---
title: Koala SSL error on Ruby 1.9.3.
author: Noppanit Charassinvichai
layout: post
permalink: /koala-ssl-error-on-ruby-1-9-3/
dsq_thread_id:
  - 1144025231
categories:
  - Ruby
---
Actually, this error is not just for Koala but I was using Koala for my Facebook application and after I moved to a new laptop I started seeing this error. 

So, what is happening. I&#8217;ve just installed my new machine on Mountain Lion with a shiny new RVM and ruby 1.9.3. Everything went fine until I started my work to continue hacking from my old laptop. I got this error while I&#8217;m trying to login via Facebook via Koala. **SSL_connect returned=1 errno=0 state=SSLv3 read server certificate B: certificate verify failed**. What is wrong? It worked before. 

After a couple of rant search on Google I found [this][1]. It seemed a bit hacky to me. It suggested me to download a correct CA certificate and put it into the right place. But after a few more search I found [this][2]. It turned out I have to install RVM with OpelSSL which somehow is not installed. I think this solution is a lot cleaner then just copying something to a folder and pray.

This is what I did

<pre><div class="codecolorer-container ruby blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />
        </div>
      </td>
      
      <td>
        <div class="ruby codecolorer">
          rvm pkg install openssl <span class="co1">#installed openssl from RVM</span><br />
          rvm reinstall 1.9.3<span class="sy0">-</span>head <span class="sy0">--</span>with<span class="sy0">-</span>openssl<span class="sy0">-</span>dir=$rvm_path<span class="sy0">/</span>usr <span class="co1">#configure your rvm to use openssl</span>
        </div>
      </td>
    </tr>
  </table>
</div>

</pre>

And then everything went ok after these two magical commands.

 [1]: http://stackoverflow.com/questions/5711190/how-to-get-rid-of-opensslsslsslerror
 [2]: https://rvm.io/packages/openssl/