---
title: 'Javascript : A very simple modal form with a return value'
author: Noppanit Charassinvichai
layout: post
permalink: /javascript-a-very-simple-modal-form-with-a-return-value/
dsq_thread_id:
  - 188062034
categories:
  - Javascript
tags:
  - javascript
  - modal form
---
To build a modal form web page. You can use this java script.

<div class="codetop">
  JAVASCRIPT
</div>

<div class="codemain">
  window.showModalDialog(&#8216;popup.html&#8217;)
</div>

And set the return value by doing this  
</br>

<div class="codetop">
  JAVASCRIPT
</div>

<div class="codemain">
  function doOk()<br /> {<br /> &nbsp;&nbsp;window.returnValue = &#8216;hello&#8217;;<br /> &nbsp;&nbsp;window.close();<br /> }
</div>