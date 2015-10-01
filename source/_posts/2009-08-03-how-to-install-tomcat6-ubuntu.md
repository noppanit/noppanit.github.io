---
title: 'How-to : Install tomcat6 Ubuntu'
author: Noppanit Charassinvichai
layout: post
permalink: /how-to-install-tomcat6-ubuntu/
dsq_thread_id:
  - 608523623
categories:
  - Knowledge
---
1.

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
          <span class="kw2">sudo</span> <span class="kw2">apt-get install</span> tomcat6
        </div>
      </td>
    </tr>
  </table>
</div>

2. Insert this lines into /var/lib/tomcat6/conf/tomcat-users.xml

<pre><div class="codecolorer-container xml blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />
        </div>
      </td>
      
      <td>
        <div class="xml codecolorer">
          <span class="sc3"><span class="re1">&lt;tomcat-users<span class="re2">&gt;</span></span></span><br />
          &nbsp; <span class="sc3"><span class="re1">&lt;role</span> <span class="re0">rolename</span>=<span class="st0">"admin"</span><span class="re2">/&gt;</span></span><br />
          &nbsp; <span class="sc3"><span class="re1">&lt;role</span> <span class="re0">rolename</span>=<span class="st0">"manager"</span><span class="re2">/&gt;</span></span><br />
          &nbsp; <span class="sc3"><span class="re1">&lt;role</span> <span class="re0">rolename</span>=<span class="st0">"tomcat"</span><span class="re2">/&gt;</span></span><br />
          &nbsp; <span class="sc3"><span class="re1">&lt;role</span> <span class="re0">rolename</span>=<span class="st0">"role1"</span><span class="re2">/&gt;</span></span><br />
          &nbsp; <span class="sc3"><span class="re1">&lt;user</span> <span class="re0">username</span>=<span class="st0">"admin"</span> <span class="re0">password</span>=<span class="st0">"your_password"</span> <span class="re0">roles</span>=<span class="st0">"manager,admin"</span><span class="re2">/&gt;</span></span><br />
          &nbsp; <span class="sc3"><span class="re1">&lt;user</span> <span class="re0">username</span>=<span class="st0">"tomcat"</span> <span class="re0">password</span>=<span class="st0">"tomcat"</span> <span class="re0">roles</span>=<span class="st0">"tomcat"</span><span class="re2">/&gt;</span></span><br />
          &nbsp; <span class="sc3"><span class="re1">&lt;user</span> <span class="re0">username</span>=<span class="st0">"role1"</span> <span class="re0">password</span>=<span class="st0">"tomcat"</span> <span class="re0">roles</span>=<span class="st0">"role1"</span><span class="re2">/&gt;</span></span><br />
          &nbsp; <span class="sc3"><span class="re1">&lt;user</span> <span class="re0">username</span>=<span class="st0">"both"</span> <span class="re0">password</span>=<span class="st0">"tomcat"</span> <span class="re0">roles</span>=<span class="st0">"tomcat,role1"</span><span class="re2">/&gt;</span></span><br />
          <span class="sc3"><span class="re1">&lt;/tomcat-users<span class="re2">&gt;</span></span></span>
        </div>
      </td>
    </tr>
  </table>
</div>

</pre>

3. Restart tomcat

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
          <span class="kw2">sudo</span> <span class="sy0">/</span>etc<span class="sy0">/</span>init.d<span class="sy0">/</span>tomcat6 restart
        </div>
      </td>
    </tr>
  </table>
</div>