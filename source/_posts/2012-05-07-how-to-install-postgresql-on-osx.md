---
title: How to install postgresql on OSX
author: Noppanit Charassinvichai
layout: post
permalink: /how-to-install-postgresql-on-osx/
dsq_thread_id:
  - 679575896
categories:
  - Postgres
---
The reason that I wrote this blog is that I&#8217;ve spent over an hour just to learn how to install postgresql on OSX. It should be really easy and straight forward, but actually it&#8217;s not. 

People might say, you just have to use &#8220;brew&#8221; or &#8220;port&#8221;, and that&#8217;s what I use as well. 

So, just use this command. 

<pre><div class="codecolorer-container text blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />
        </div>
      </td>
      
      <td>
        <div class="text codecolorer">
          brew install postgresql
        </div>
      </td>
    </tr>
  </table>
</div>

</pre>

If the installation is ok without any problem, then you&#8217;re the happiest man in the world. Then after that you do what brew tells you to do after the installation. Now, here&#8217;s the gotcha, you might want to do this after everything is done.

<pre><div class="codecolorer-container text blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />
        </div>
      </td>
      
      <td>
        <div class="text codecolorer">
          pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
        </div>
      </td>
    </tr>
  </table>
</div>

</pre>

If you&#8217;re unlucky like me, you might see this.

<pre><div class="codecolorer-container text blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />
        </div>
      </td>
      
      <td>
        <div class="text codecolorer">
          sh: /usr/local/var/postgres/server.log: No such file or directory
        </div>
      </td>
    </tr>
  </table>
</div>

</pre>

Don&#8217;t panic! here&#8217;s one more command that brew didn&#8217;t tell you to do. (You might want to change the owner of /usr/local/var if the next command complains about permission. 

<pre><div class="codecolorer-container text blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />
        </div>
      </td>
      
      <td>
        <div class="text codecolorer">
          initdb /usr/local/var/postgres
        </div>
      </td>
    </tr>
  </table>
</div>

</pre>

That&#8217;s it! And then do this command then you&#8217;re done.

<pre><div class="codecolorer-container text blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />
        </div>
      </td>
      
      <td>
        <div class="text codecolorer">
          pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
        </div>
      </td>
    </tr>
  </table>
</div>

</pre>