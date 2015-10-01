---
title: 'How to : Searching for opening ports'
author: Noppanit Charassinvichai
layout: post
permalink: /how-to-searching-for-opening-ports/
categories:
  - Windows
---
I found this topic which is quite useful for security concerns. <http://www.zdnetasia.com/techguide/>

<div class="codetop">
  COMMAND LINE
</div>

<div class="codemain">
  $ netstat -a | find "LISTENING"??
</div>

<div class="codetop">
  COMMAND LINE LINUX
</div>

<div class="codemain">
  $ netstat -an | grep "LISTENING"
</div>