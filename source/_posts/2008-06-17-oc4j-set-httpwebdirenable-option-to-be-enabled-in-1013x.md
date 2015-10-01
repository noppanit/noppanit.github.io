---
title: 'OC4J : set http.webdir.enable option to be enabled in 10.1.3.x'
author: Noppanit Charassinvichai
layout: post
permalink: /oc4j-set-httpwebdirenable-option-to-be-enabled-in-1013x/
dsq_thread_id:
  - 186245932
categories:
  - Application Server
---
in Oracle Application Server 10.1.2.x this option is enabled, but in 10.1.3.x this option is disabled. So, the way to enable this option is to put the java option to OC4J. This is for OC4J standalone

<div class="codetop">
  COMMAND
</div>

<div class="codemain">
  java -Dhttp.webdir.enable=true -jar oc4j.jar
</div>

But if you are using embedded-oc4j, look at <a href="http://www.noppanit.com/?p=142" target="_blank">this topic</a>