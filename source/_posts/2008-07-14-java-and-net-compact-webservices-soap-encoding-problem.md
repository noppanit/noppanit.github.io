---
title: 'Java and .NET Compact WebServices : SOAP Encoding problem'
author: Noppanit Charassinvichai
layout: post
permalink: /java-and-net-compact-webservices-soap-encoding-problem/
dsq_thread_id:
  - 552792962
categories:
  - Web Services
tags:
  - soap
  - Web Services
---
I found this problem three days ago. I was developing java web services to work with .NET Compact framework, WM5. Java web services will return a string which is Thai language, but .NET compact cannot translate into Thai, it showed ?????. I think the problem was SOAP version. I have to downgrade from 1.2 to 1.1. I guess that that WM5 doesn&#8217;t match with SOAP 1.2. It works, at least for me