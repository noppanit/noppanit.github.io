---
title: Ant debugging classpath
author: Noppanit Charassinvichai
layout: post
permalink: /ant-debugging-classpath/
dsq_thread_id:
  - 263929035
categories:
  - ANT
---
Have you ever written an build.xml? Is that a little annoying while ANT keeps saying that ClassNotFoundException or something that you missed to include, whilst you knew that they actually there. So, I google and found something that might be useful.

<div class="codetop">
  CODE
</div>

<div class="codemain">
  <target name="debug&#34 ></p> 
  
  <p>
    ???? <property name=&#34myclasspath&#34 refid=&#34classpath&#34/>
  </p>
  
  <p>
    ???? <echo message=&#34Classpath = ${myclasspath}&#34/>
  </p>
  
  <p>
    </target>
  </p>
</div>