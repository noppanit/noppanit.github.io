---
title: 'Tutorial : Java stand alone application calls EJBs'
author: Noppanit Charassinvichai
layout: post
permalink: /tutorial-java-stand-alone-application-calls-ejbs/
dsq_thread_id:
  - 222597221
categories:
  - Java
---
After the tutorial about [MyJava][1], I have created this topic for remembering my EJB. Actually, we have to create Servlet and deploy to the J2EE container, so the Servlet can find the EJB. However, if you want to use stand alone application to call the EJB. The PROVIDER\_URL should be defined, hence the application can connect to the EJB. If we didn&#8217;t define the PROVIDER\_URL in application, the application won&#8217;t find the EJB name on JNDI.

<div class="codetop">
  CODE
</div>

<div class="codemain">
  Hashtable env = new Hashtable();
</div>

<p style="text-align: left;">
  <span style="color: #ff0000;">define the PROVIDER_URL and INITIAL_CONTEXT_FACTORY, this setting is for Jboss, you might have to look at your application server document.</p> 
  
  <p>
    </span>
  </p>
  
  <div class="codetop">
    CODE
  </div>
  
  <div class="codemain">
    env.put(Context.INITIAL_CONTEXT_FACTORY, &#34org.jnp.interfaces.NamingContextFactory&#34);<br /> env.put(Context.PROVIDER_URL, &#34jnp://127.0.0.1:1099&#34);</p> 
    
    <p style="text-align: left;">
      Context ct = new InitialContext(env);<br /> Object o = ct.lookup(&#34${Your EJB}&#34);<br /> <span style="color: #ff6600;">YourHomeInterface </span>eh = (<span style="color: #ff9900;">YourHomeInterface</span>) PortableRemoteObject.narrow(o, <span style="color: #ff9900;">YouHomeInterface</span>.class);<br /> <span style="color: #ff00ff;">YourRemoteInterface </span>h = eh.create();<br /> System.out.println(<span style="color: #ff00ff;">YourRemoteInterface</span>.<span style="color: #00ff00;">YourMethod</span>(&#34Hello&#34)); <span style="color: #ff0000;">Invoke the method</span>
    </p></p>
  </div>
  
  <p style="text-align: left;">
    <span style="color: #000000;">This is my file and example</span>
  </p>
  
  <p style="text-align: left;">
    <a href="http://i2.photobucket.com/albums/y41/newbie_toy/13.jpg"><img src="http://i2.photobucket.com/albums/y41/newbie_toy/131.jpg" alt="" /></a>
  </p>

 [1]: http://www.noppanit.com/?p=90