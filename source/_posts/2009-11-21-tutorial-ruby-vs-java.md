---
title: 'Tutorial : Ruby vs. Java'
author: Noppanit Charassinvichai
layout: post
permalink: /tutorial-ruby-vs-java/
jd_tweet_this:
  - yes
wp_jd_bitly:
  - http://bit.ly/5VDQXx
wp_jd_target:
  - http://www.noppanit.com/tutorial-ruby-vs-java/
dsq_thread_id:
  - 188241591
categories:
  - Java
  - Ruby
---
Ruby Instance Variables

Example:

<div class="codecolorer-container ruby blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />
        </div>
      </td>
      
      <td>
        <div class="ruby codecolorer">
          <span class="re1">@foobar</span>
        </div>
      </td>
    </tr>
  </table>
</div>

A variable whose name begins with &#8216;@&#8217; is an instance variable of self. An instance variable belongs to the object itself. Uninitialized instance variables have a value of

Java Instance Variables

Example:

<div class="codecolorer-container java blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />
        </div>
      </td>
      
      <td>
        <div class="java codecolorer">
          A a <span class="sy0">=</span> <span class="kw1">new</span> A<span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> a.<span class="me1">variable</span> <span class="sy0">=</span> <span class="nu0"></span><span class="sy0">;</span> <span class="co1">//<-- instance variable; a variable that belong to each object.</span>
        </div>
      </td>
    </tr>
  </table>
</div>

Instance Variables (Non-Static Fields) Technically speaking, objects store their individual states in &#8220;non-static fields&#8221;, that is, fields declared without the static keyword. Non-static fields are also known as instance variables because their values are unique to each instance of a class (to each object, in other words); the currentSpeed of one bicycle is independent from the currentSpeed of another.  
Reference <http://java.sun.com/docs/books/tutorial/java/nutsandbolts/variables.html>

Ruby Class Variables

Example:

<div class="codecolorer-container ruby blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />
        </div>
      </td>
      
      <td>
        <div class="ruby codecolorer">
          @@foobar
        </div>
      </td>
    </tr>
  </table>
</div>

Java Class Variables  
Example:

<div class="codecolorer-container java blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />
        </div>
      </td>
      
      <td>
        <div class="java codecolorer">
          <span class="kw1">private</span> <span class="kw1">static</span> <span class="kw4">int</span> variable <span class="sy0">=</span> <span class="nu0"></span><span class="sy0">;</span> <span class="co1">// <-- class variable, the variable that belongs to the class</span>
        </div>
      </td>
    </tr>
  </table>
</div>

Class Variables (Static Fields) A class variable is any field declared with the static modifier; this tells the compiler that there is exactly one copy of this variable in existence, regardless of how many times the class has been instantiated. A field defining the number of gears for a particular kind of bicycle could be marked as static since conceptually the same number of gears will apply to all instances. The code static int numGears = 6; would create such a static field. Additionally, the keyword final could be added to indicate that the number of gears will never change.  
Reference <http://java.sun.com/docs/books/tutorial/java/nutsandbolts/variables.html>

Ruby Global Variables

Example:

<div class="codecolorer-container ruby blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />
        </div>
      </td>
      
      <td>
        <div class="ruby codecolorer">
          <span class="re0">$foobar</span>
        </div>
      </td>
    </tr>
  </table>
</div>

A variable whose name begins with &#8216;$&#8217; has a global scope; meaning it can be accessed from anywhere within the program during runtime.

Java Global Variables  
Don&#8217;t have it. It is like a variable that has been declared outside all of the methods.

Ruby Constants  
Example

<div class="codecolorer-container ruby blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />
        </div>
      </td>
      
      <td>
        <div class="ruby codecolorer">
          FOOBAR
        </div>
      </td>
    </tr>
  </table>
</div>

A variable whose name begins with an uppercase letter (A-Z) is a constant. A constant can be reassigned a value after its initialization, but doing so will generate a warning. Every class is a constant.

Trying to substitute the value of a constant or trying to access an uninitialized constant raises the NameError exception.

Java Constants

<div class="codecolorer-container java blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />
        </div>
      </td>
      
      <td>
        <div class="java codecolorer">
          <span class="kw1">private</span> <span class="kw1">final</span> <span class="kw4">int</span> variable <span class="sy0">=</span> <span class="nu0"></span><span class="sy0">;</span> <span class="co1">// <-- final variable, the value of the variable cannot be changed.</span>
        </div>
      </td>
    </tr>
  </table>
</div>