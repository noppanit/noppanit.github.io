---
title: 'Java : Why do want to new different objects from one class'
comments: true
author: Noppanit Charassinvichai
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

``` java
A a = new A();
A a1 = new A();
```

What&#8217;s the different between a and a1. They behave exactly the same, because they are A class. The reason is we would like to actually change their attributes or properties inside the class. This is very fundamental Object-oriented principle.
