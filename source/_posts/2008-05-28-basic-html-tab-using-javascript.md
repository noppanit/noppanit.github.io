---
title: Basic HTML tab, using javascript
author: Noppanit Charassinvichai
layout: post
permalink: /basic-html-tab-using-javascript/
dsq_thread_id:
  - 260085588
categories:
  - Web Sites
tags:
  - html
  - javascript
  - tab
  - web
---
This will show how to create tabs control in HTML.

<div class="codetop">
  CODE JAVASCRIPT
</div>

<div class="codemain">
  var ids = new Array(&#8216;tab1&#8242;,&#8217;tab2&#8217;) // declare array of tabs
</div>

??

<div class="codetop">
  CODE JAVASCRIPT
</div>

<div class="codemain">
  function switchID(id) // function for switch between tabs<br /> {<br /> hideAllID(); // hide all the tabs<br /> showDivID(id); // show the selected tab<br /> }
</div>

??

<div class="codetop">
  CODE JAVASCRIPT
</div>

<div class="codemain">
  function hideAllID() // function for hide all tabs in the page<br /> {<br /> for(var i=0;i {<br /> hideDivID(ids[i]);<br /> }<br /> }
</div>

??

<div class="codetop">
  CODE JAVASCRIPT
</div>

<div class="codemain">
  function hideDivID(id) // function for hiding the selected tab<br /> {<br /> if(document.getElementById)<br /> {<br /> document.getElementById(id).style.display = &#8216;none&#8217;;<br /> }<br /> }
</div>

??

<div class="codetop">
  CODE JAVASCRIPT
</div>

<div class="codemain">
  function showDivID(id) // function for showing the selected tab<br /> {<br /> if(document.getElementById)<br /> {<br /> document.getElementById(id).style.display = &#8216;block&#8217;;<br /> }<br /> }
</div>

This is how you are going to create in html files

<div class="codetop">
  CODE HTML
</div>

<div class="codemain">
  <a href=&#8217;javascript:switchID(&#8216;tab1&#8242;);&#8217;>Something1</a><br /> <a href=&#8217;javascript:switchID(&#8216;tab2&#8242;);&#8217;>Something2</a>
</div>

??

<div class="codetop">
  CODE HTML
</div>

<div class="codemain">
  <div id=&#8217;tab1&#8242; style=&#8217;display:block;&#8217;>Content1</div><br /> <div id=&#8217;tab2&#8242; style=&#8217;display:none;&#8217;> Content2</div>
</div>