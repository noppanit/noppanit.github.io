---
title: Naming test classes.
comments: true
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

``` java
public Product {
   //some awesome code here!
}
```

``` java
public ProductTest{
   //some awesome test code here!
}
```

There&#8217;s two reasons why I would do this. First, to let IntelliJ find the test class easily and it&#8217;s easy to spot the test class when you scroll through. 

However, lately inspired by [@JeroenSoeters][1] my colleague which I don&#8217;t know where he got this from. I started naming test class like this.

``` java
public Product {
   //some awesome code here!
}
```

``` java
public When_building_a_product {
   //some awesome test code here!
}
```

``` java
public When_building_a_product_with_some_more_data {
   //some awesome test code here!
}
```

There&#8217;s one reason to do this I can think of. You can clearly see the purpose of this class and you can have multiple test classes or **Product** instead of having all the tests in one class and everything is cluttered so you have to scroll up and down

Not everybody likes this convention. I hate it at first but I&#8217;m starting to use it more often and I like it. What do you guys think?

 [1]: https://twitter.com/JeroenSoeters "Jeroen"
