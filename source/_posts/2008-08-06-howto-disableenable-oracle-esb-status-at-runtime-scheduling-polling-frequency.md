---
title: 'HowTo : Disable/Enable Oracle ESB status at runtime: Scheduling polling frequency'
author: Noppanit Charassinvichai
layout: post
permalink: /howto-disableenable-oracle-esb-status-at-runtime-scheduling-polling-frequency/
dsq_thread_id:
  - 187077889
categories:
  - ESB
  - Oracle
---
I&#8217;m being assigned a task which is Scheduling polling frequency in File adapter. Typically, File Adapter will collect the files from specified folder at the polling frequency time parameter, such as every 1 second or 1 min. What about specified time, every 6pm or every morning? How?? This is my solution. [Quartz][1].

But one thing led to another. How do we invoke the File adapter programmatically? The answer is [Oracle ESB API Client][2]. This client will invoke the file adapter and change the status to enabled/disabled at the specified time. [Reference][3]

Oracle ESB API can also be invoked via HTTP protocol. You can try this [http://localhost:8888/esb/esbConfiguration/executeCommand?action=ExploreServices.][4] This URL will return an XML metadata where you can explore the services in ESB, such as guid and status.

**Note: This URL will work for Basic installation, but may be not Advance installation.**

And this is how we create quartz to work with OC4J  
<http://radio.weblogs.com/0135826/2004/04/02.html>

This is the example of how we communicate with Oracle ESB API Client

<div class="codetop">
  JAVA CODE
</div>

<div class="codemain">
  ConsoleClient client = ConsoleClientFactory.getConsoleClient(HOST, PORT, USER_NAME,PASSWORD);<br /> client.perform(&#8220;UpdateServiceStatus&#8221;, requestProps);
</div>

</br>  
[The example code][5]

 [1]: http://www.opensymphony.com/quartz/
 [2]: http://download.oracle.com/docs/cd/E10291_01/doc.1013/e10295/esb_api.htm
 [3]: http://forums.oracle.com/forums/thread.jspa?messageID=1959915
 [4]: http://sesserv:8889/esb/esbConfiguration/executeCommand?action=ExploreServices
 [5]: http://www.noppanit.com/code/SchedulerESBFileImporterApplication.zip