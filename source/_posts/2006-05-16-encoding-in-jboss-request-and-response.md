---
title: 'Encoding in JBOSS &#8211; Request and Response'
author: Noppanit Charassinvichai
layout: post
permalink: /encoding-in-jboss-request-and-response/
dsq_thread_id:
  - 243600310
categories:
  - Java
  - JBOSS
---
<p align="left">
  1. Find the server.xml in $JBOSS_HOME/server/$YOUR_SERVER/deployjbossweb-tomcat55.sar
</p>

2. Add URIEncoding=&#8221;UTF-8&#8243;

<pre><div class="codecolorer-container xml blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />
        </div>
      </td>
      
      <td>
        <div class="xml codecolorer">
          <span class="sc3"><span class="re1">&lt;Connector</span> <span class="re0">port</span>=<span class="st0">"8080"</span> <span class="re0">address</span>=<span class="st0">"${jboss.bind.address}"</span></span><br />
          <span class="sc3"> &nbsp; &nbsp; &nbsp; &nbsp; <span class="re0">maxThreads</span>=<span class="st0">"250"</span> <span class="re0">maxHttpHeaderSize</span>=<span class="st0">"8192"</span></span><br />
          <span class="sc3"> &nbsp; &nbsp; &nbsp; &nbsp; <span class="re0">emptySessionPath</span>=<span class="st0">"true"</span> <span class="re0">protocol</span>=<span class="st0">"HTTP/1.1"</span></span><br />
          <span class="sc3"> &nbsp; &nbsp; &nbsp; &nbsp; <span class="re0">enableLookups</span>=<span class="st0">"false"</span> <span class="re0">redirectPort</span>=<span class="st0">"8443"</span> <span class="re0">acceptCount</span>=<span class="st0">"100"</span></span><br />
          <span class="sc3"> &nbsp; &nbsp; &nbsp; &nbsp; <span class="re0">connectionTimeout</span>=<span class="st0">"20000"</span> <span class="re0">disableUploadTimeout</span>=<span class="st0">"true"</span> <span class="re0">URIEncoding</span>=<span class="st0">"UTF-8"</span><span class="re2">/&gt;</span></span><br />
          <br />
          &nbsp; &nbsp;<span class="sc-1">&lt;!-- Define an AJP 1.3 Connector on port 8009 --&gt;</span><br />
          &nbsp; &nbsp; <span class="sc3"><span class="re1">&lt;Connector</span> <span class="re0">port</span>=<span class="st0">"8009"</span> <span class="re0">address</span>=<span class="st0">"${jboss.bind.address}"</span> <span class="re0">protocol</span>=<span class="st0">"AJP/1.3"</span></span><br />
          <span class="sc3"> &nbsp; &nbsp; &nbsp; &nbsp; <span class="re0">emptySessionPath</span>=<span class="st0">"true"</span> <span class="re0">enableLookups</span>=<span class="st0">"false"</span> <span class="re0">redirectPort</span>=<span class="st0">"8443"</span> <span class="re0">URIEncoding</span>=<span class="st0">"UTF-8"</span><span class="re2">/&gt;</span></span>
        </div>
      </td>
    </tr>
  </table>
</div>

</pre>

3. Finished