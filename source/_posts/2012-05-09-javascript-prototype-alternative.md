---
title: Javascript prototype alternative.
author: Noppanit Charassinvichai
layout: post
permalink: /javascript-prototype-alternative/
dsq_thread_id:
  - 683017564
categories:
  - Javascript
---
I guess everybody is familiar with the concept of classes in Javascript. For example, 

<pre><div class="codecolorer-container text blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />
        </div>
      </td>
      
      <td>
        <div class="text codecolorer">
          var Adder = function() {<br />
          &nbsp; &nbsp;this.a = "0";<br />
          &nbsp; &nbsp;this.b = "0";<br />
          }<br />
          <br />
          Adder.prototype = {<br />
          &nbsp; &nbsp;add : function(value1, value2) {<br />
          &nbsp; &nbsp; &nbsp; &nbsp;return value1 + value2;<br />
          &nbsp; &nbsp;}<br />
          }<br />
          <br />
          var adder = new Adder();<br />
          adder.add(1,2);
        </div>
      </td>
    </tr>
  </table>
</div>

</pre>

This type is fine in most cases, but the downside of this pattern is that you&#8217;re exposing add function to the outside world via prototype, and it&#8217;s not good for object-oriented concept. You could easily tamper with function add by doing this.

<pre><div class="codecolorer-container text blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />
        </div>
      </td>
      
      <td>
        <div class="text codecolorer">
          adder.__proto__.add = function() { };
        </div>
      </td>
    </tr>
  </table>
</div>

</pre>

And if you run this 

<pre><div class="codecolorer-container text blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />
        </div>
      </td>
      
      <td>
        <div class="text codecolorer">
          adder.add(); // undefined
        </div>
      </td>
    </tr>
  </table>
</div>

</pre>

You will get an error because you&#8217;ve tampered with function add already.

In order to prevent this to happen you could do something like this. Like this we&#8217;re exposing just the function but not via prototype. 

<pre><div class="codecolorer-container text blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />
        </div>
      </td>
      
      <td>
        <div class="text codecolorer">
          var Adder = function() {<br />
          &nbsp; &nbsp; function add(value1, value2) {<br />
          &nbsp; &nbsp; &nbsp; &nbsp; return value1 + value2;<br />
          &nbsp; &nbsp; }<br />
          <br />
          &nbsp; &nbsp; return { <br />
          &nbsp; &nbsp; &nbsp; &nbsp; add : add<br />
          &nbsp; &nbsp; };<br />
          }<br />
          <br />
          var adder = Adder();<br />
          adder.add(1,2); // 3
        </div>
      </td>
    </tr>
  </table>
</div>

</pre>

Reference: http://nodetuts.com/tutorials/28-javascript-classes-prototypes-and-closures.html