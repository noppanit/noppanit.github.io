---
title: The difference between apply and call method in javascript
author: Noppanit Charassinvichai
layout: post
permalink: /the-difference-between-apply-and-call-method-in-javascript/
dsq_thread_id:
  - 183472972
categories:
  - Javascript
tags:
  - javascript
---
Well, I have just an issue from my friend who have a problem with arguments passed in the extended method. This topic I will show the difference between apply and call method.

First, what is call and apply method. This is a hard question for me to explain this kind of question in English. Haha. But I will try. Instead of explain myself I decided to lift somebody&#8217;s context up from [This][1]

**apply**

**Syntax**

functionreference.apply(thisArg, argArray)

**Parameters**

thisArg (parameter for the calling object)

argArray (an optional parameter of an argument array for the object)

**Description**

apply allows you to apply a method of another object in the context of a different object (the calling object). You can assign a different this object when calling an existing function. this refers to the current object, the calling object. With apply, you can write a method once and then inherit it in another object, without having to rewrite the method for the new object.

**call**

**Syntax**

functionreference.call(thisArg, arg1, arg2, &#8230;)

**Parameters**

thisArg (parameter for the calling object)

arg1, arg2, &#8230; (an optional parameters of arguments for the object)

**Description**

call allows you to call (executes) a method of another object in the context of a different object (the calling object). You can assign a different this object when calling an existing function. this refers to the current object, the calling object. With call, you can write a method once and then inherit it in another object, without having to rewrite the method for the new object.

This is an example.

<pre><div class="codecolorer-container javascript blackboard" style="overflow:auto;white-space:nowrap;width:100%;height:400px;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />4<br />5<br />6<br />7<br />8<br />9<br />10<br />11<br />12<br />13<br />14<br />15<br />16<br />17<br />18<br />19<br />20<br />21<br />22<br />23<br />24<br />25<br />26<br />27<br />28<br />29<br />30<br />31<br />
        </div>
      </td>
      
      <td>
        <div class="javascript codecolorer">
          <span class="kw2">function</span> Person<span class="br0">&#40;</span><span class="kw3">name</span><span class="br0">&#41;</span> <br />
          <span class="br0">&#123;</span><br />
          &nbsp; <span class="kw2">var</span> total <span class="sy0">=</span> <span class="nu0"></span><span class="sy0">;</span><br />
          &nbsp; &nbsp; <span class="kw1">for</span> <span class="br0">&#40;</span> <span class="kw2">var</span> i<span class="sy0">=</span><span class="nu0"></span><span class="sy0">;</span> i<span class="sy0">&lt;</span>arguments.<span class="me1">length</span><span class="sy0">;</span> i<span class="sy0">++</span> <span class="br0">&#41;</span> <br />
          &nbsp; &nbsp; <span class="br0">&#123;</span><br />
          &nbsp; &nbsp; total <span class="sy0">+=</span> arguments<span class="br0">&#91;</span>i<span class="br0">&#93;</span><span class="sy0">;</span><br />
          &nbsp; <span class="br0">&#125;</span><br />
          &nbsp; &nbsp; <br />
          &nbsp; console.<span class="me1">log</span><span class="br0">&#40;</span> <span class="st0">"length of arguments"</span><span class="sy0">,</span> arguments.<span class="me1">length</span> <span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; console.<span class="me1">log</span><span class="br0">&#40;</span> <span class="st0">"arg0"</span> <span class="sy0">,</span> arguments<span class="br0">&#91;</span><span class="nu0"></span><span class="br0">&#93;</span> <span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; console.<span class="me1">log</span><span class="br0">&#40;</span> <span class="st0">"arg1"</span> <span class="sy0">,</span> arguments<span class="br0">&#91;</span><span class="nu0">1</span><span class="br0">&#93;</span> <span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; <br />
          &nbsp; &nbsp; <span class="kw1">this</span>.<span class="kw3">name</span> <span class="sy0">=</span> <span class="kw3">name</span><span class="sy0">;</span><br />
          <span class="br0">&#125;</span><br />
          <br />
          Person.<span class="me1">prototype</span>.<span class="me1">getName</span> <span class="sy0">=</span> <span class="kw2">function</span><span class="br0">&#40;</span><span class="br0">&#41;</span> <br />
          <span class="br0">&#123;</span><br />
          &nbsp; &nbsp; <span class="kw1">return</span> <span class="kw1">this</span>.<span class="kw3">name</span><span class="sy0">;</span><br />
          <span class="br0">&#125;</span><br />
          <br />
          <span class="co1">// class User (will be subclassing Person)</span><br />
          <span class="kw2">function</span> User<span class="br0">&#40;</span><span class="kw3">name</span><span class="sy0">,</span> pwd<span class="br0">&#41;</span> <br />
          <span class="br0">&#123;</span><br />
          &nbsp; &nbsp; <span class="co1">// Constructor Chaining (calling superclass constructor)</span><br />
          &nbsp; &nbsp; Person.<span class="me1">apply</span><span class="br0">&#40;</span><span class="kw1">this</span><span class="sy0">,</span> arguments<span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; Person.<span class="me1">call</span><span class="br0">&#40;</span><span class="kw1">this</span><span class="sy0">,</span><span class="kw3">name</span><span class="sy0">,</span>pwd<span class="br0">&#41;</span><span class="sy0">;</span><br />
          &nbsp; &nbsp; <br />
          &nbsp; &nbsp; <span class="kw1">this</span>.<span class="me1">pwd</span> <span class="sy0">=</span> pwd<span class="sy0">;</span><br />
          <span class="br0">&#125;</span><br />
          <br />
          <span class="kw2">var</span> user <span class="sy0">=</span> <span class="kw2">new</span> User<span class="br0">&#40;</span> <span class="st0">"Toy"</span><span class="sy0">,</span> <span class="st0">"Toy1"</span> <span class="br0">&#41;</span><span class="sy0">;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

</pre>

 [1]: http://blog.metawrap.com/blog/TheVeryUsefulJavaScriptCallAndApplyFunctionsForOverridingThisForAGivenFunction.aspx