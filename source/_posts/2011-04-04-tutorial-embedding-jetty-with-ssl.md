---
title: 'Tutorial: Embedding Jetty with SSL'
author: Noppanit Charassinvichai
layout: post
permalink: /tutorial-embedding-jetty-with-ssl/
dsq_thread_id:
  - 270914914
categories:
  - Java
---
I think everybody knows what SSL is and probable knows what Jetty is. [Jetty][1] is basically a container which receives requests and generate responses. I choose Jetty because it&#8217;s really small and can be deployed in just one jar file. Without further ado. here is the code to add SSL connector to embedding jetty.

<div class="codecolorer-container java blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />
        </div>
      </td>
      
      <td>
        <div class="java codecolorer">
          &nbsp;Server server <span class="sy0">=</span> <span class="kw1">new</span> Server<span class="br0">&#40;</span>httpPort<span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp;SslSocketConnector sslConnector <span class="sy0">=</span> <span class="kw1">new</span> SslSocketConnector<span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp;sslConnector.<span class="me1">setPort</span><span class="br0">&#40;</span><span class="nu0">8443</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp;sslConnector.<span class="me1">setPassword</span><span class="br0">&#40;</span>keystorePassword<span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp;sslConnector.<span class="me1">setKeyPassword</span><span class="br0">&#40;</span>keystorePassword<span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp;sslConnector.<span class="me1">setTrustPassword</span><span class="br0">&#40;</span>keystorePassword<span class="br0">&#41;</span><span class="sy0">;</span><br /> <br /> &nbsp;SelectChannelConnector selectChannelConnector <span class="sy0">=</span> <span class="kw1">new</span> SelectChannelConnector<span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp;selectChannelConnector.<span class="me1">setPort</span><span class="br0">&#40;</span>httpPort<span class="br0">&#41;</span><span class="sy0">;</span> <span class="co1">// To accept connection from 8080, otherwise the normal connection cannot be passed into 8080</span><br /> &nbsp;server.<span class="me1">setConnectors</span><span class="br0">&#40;</span> <span class="kw1">new</span> Connector<span class="br0">&#91;</span><span class="br0">&#93;</span><span class="br0">&#123;</span> sslConnector, selectChannelConnector <span class="br0">&#125;</span> <span class="br0">&#41;</span><span class="sy0">;</span><br /> &nbsp;server.<span class="me1">start</span><span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

But you need to [generate you public/private key][2] to you home directory for Jetty to read.

Or simply just use this command that comes with Java.

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
          keytool <span class="re5">-alias</span> jetty <span class="re5">-genkey</span> <span class="re5">-keyalg</span> RSA
        </div>
      </td>
    </tr>
  </table>
</div>

 [1]: http://wiki.eclipse.org/Jetty
 [2]: http://docs.codehaus.org/display/JETTY/How+to+configure+SSL