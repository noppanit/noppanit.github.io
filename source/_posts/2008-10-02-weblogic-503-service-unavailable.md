---
title: 'WebLogic : 503&#8211;Service Unavailable'
author: Noppanit Charassinvichai
layout: post
permalink: /weblogic-503-service-unavailable/
dsq_thread_id:
  - 183380045
categories:
  - WebLogic
---
<span style="font-weight: bold;">Error 503&#8211;Service Unavailable</span>  
<span style="font-weight: bold;">From RFC 2068 Hypertext Transfer Protocol &#8212; HTTP/1.1:</span>  
<span style="font-weight: bold;">10.5.4 503 Service Unavailable</span>

<span style="font-weight: bold; font-style: italic;">The server is currently unable to handle the request due to a temporary overloading or maintenance of the server. The implication is that this is a temporary condition which will be alleviated after some delay. If known, the length of the delay may be indicated in a Retry-After header. If no Retry-After is given, the client SHOULD handle the response as it would for a 500 response.</span>

<span style="font-weight: bold; font-style: italic;">Note: The existence of the 503 status code does not imply that a server must use it when becoming overloaded. Some servers may wish to simply refuse the connection.</span>

The Application has to be started after the deployment. It means whatever you do, you must start the application. And not just start the admin server.