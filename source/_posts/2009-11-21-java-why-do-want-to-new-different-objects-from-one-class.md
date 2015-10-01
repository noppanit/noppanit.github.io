---
title: 'Java : Why do want to new different objects from one class'
author: Noppanit Charassinvichai
layout: post
permalink: /java-why-do-want-to-new-different-objects-from-one-class/
jd_tweet_this:
  - yes
wp_jd_bitly:
  - http://bit.ly/5dW6Ck
wp_jd_target:
  - http://www.noppanit.com/java-why-do-want-to-new-different-objects-from-one-class/
dsq_thread_id:
  - 249255878
categories:
  - Java
---
I was asked this once. Why do we need to new object every time we want to use it.  
Yes, my first answer is, we need different objects because we need to use them separately because they are on different locations in Heap memory. However, this is not actually the answer. So, why do we need to new object every time we want to use it. 

For instance,

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
          A a <span class="sy0">=</span> <span class="kw1">new</span> A<span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span><br /> A a1 <span class="sy0">=</span> <span class="kw1">new</span> A<span class="br0">&#40;</span><span class="br0">&#41;</span><span class="sy0">;</span>
        </div>
      </td>
    </tr>
  </table>
</div>

What&#8217;s the different between a and a1. They behave exactly the same, because they are A class. The reason is we would like to actually change their attributes or properties inside the class. This is very fundamental Object-oriented principle.