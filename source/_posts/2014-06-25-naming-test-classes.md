---
title: Naming test classes.
author: Noppanit Charassinvichai
layout: post
permalink: /naming-test-classes/
dsq_thread_id:
  - 2795166339
categories:
  - Knowledges
tags:
  - practices
  - test
---
Normally, you would name your test class like this.

<div class="codecolorer-container java blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />
        </div>
      </td>
      
      <td>
        <div class="java codecolorer">
          <span class="kw1">public</span> Product <span class="br0">&#123;</span><br /> &nbsp; &nbsp;<span class="co1">//some awesome code here!</span><br /> <span class="br0">&#125;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

<div class="codecolorer-container java blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />
        </div>
      </td>
      
      <td>
        <div class="java codecolorer">
          <span class="kw1">public</span> ProductTest<span class="br0">&#123;</span><br /> &nbsp; &nbsp;<span class="co1">//some awesome test code here!</span><br /> <span class="br0">&#125;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

There&#8217;s two reasons why I would do this. First, to let IntelliJ find the test class easily and it&#8217;s easy to spot the test class when you scroll through. 

However, lately inspired by [@JeroenSoeters][1] my colleague which I don&#8217;t know where he got this from. I started naming test class like this.

<div class="codecolorer-container java blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />
        </div>
      </td>
      
      <td>
        <div class="java codecolorer">
          <span class="kw1">public</span> Product <span class="br0">&#123;</span><br /> &nbsp; &nbsp;<span class="co1">//some awesome code here!</span><br /> <span class="br0">&#125;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

<div class="codecolorer-container java blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />
        </div>
      </td>
      
      <td>
        <div class="java codecolorer">
          <span class="kw1">public</span> When_building_a_product <span class="br0">&#123;</span><br /> &nbsp; &nbsp;<span class="co1">//some awesome test code here!</span><br /> <span class="br0">&#125;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

<div class="codecolorer-container java blackboard" style="overflow:auto;white-space:nowrap;width:100%;">
  <table cellspacing="0" cellpadding="0">
    <tr>
      <td class="line-numbers">
        <div>
          1<br />2<br />3<br />
        </div>
      </td>
      
      <td>
        <div class="java codecolorer">
          <span class="kw1">public</span> When_building_a_product_with_some_more_data <span class="br0">&#123;</span><br /> &nbsp; &nbsp;<span class="co1">//some awesome test code here!</span><br /> <span class="br0">&#125;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

There&#8217;s one reason to do this I can think of. You can clearly see the purpose of this class and you can have multiple test classes or **Product** instead of having all the tests in one class and everything is cluttered so you have to scroll up and down

Not everybody likes this convention. I hate it at first but I&#8217;m starting to use it more often and I like it. What do you guys think?

 [1]: https://twitter.com/JeroenSoeters "Jeroen"