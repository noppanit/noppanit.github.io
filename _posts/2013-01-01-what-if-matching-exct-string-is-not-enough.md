---
title: What if matching exact string is not enough, basic fuzzy search that you want to know.
comments: true
author: Noppanit Charassinvichai
layout: post
permalink: /what-if-matching-exct-string-is-not-enough/
dsq_thread_id:
  - 1003351042
categories:
  - Knowledges
tags:
  - levenshtein
  - ruby
---
First of all, I&#8217;m not a researcher what I post here is just my experiment that I do it myself.

I have this problem when I want to match string but not **exact match**. For example, I have this string **&#8220;I really love The Matrix movie because of this quote &#8216;welcome to the real world'&#8221;** and I have a bunch of tags in my database such as **&#8220;The Matrix&#8221;, &#8220;welcome to the real world&#8221;, &#8220;red pill&#8221;, &#8220;blue pill&#8221;**. So, if I want to match the tags with the string I could do regular expression like this or actually I could do the exact match and still get the correct one.


```
/.*world.*/
```

That would give me what I want. However, what if I have another movie **&#8220;The day after tomorrow&#8221;** with tags **&#8220;world&#8221;**. If I search with word that string against the tags I will get two movies. So, what can I do? I did some Google and found [fuzzy search][1] and I picked [&#8220;Levenshtein&#8221;][2]. I&#8217;m not good at maths so I can&#8217;t really explains in technical correctly. But basically, it&#8217;s a technique to look into two strings and count every time you have to <string>&#8220;edit&#8221;</strong> to make the strings exact match. For example,

```
“I love you” # string 1

“I also love you” # string 2
```

The distance would be **1** because it takes **1** edit to make the two strings exact match. We have to add **also** or delete **also** 1 time.

So from the example above.

``` python
# Distance 12
puts Levenshtein.distance("welcome to the real world".split(" "), "I really love The Matrix movie because of this quote 'welcome to the real world'".split(" "))
# Distance 15
puts Levenshtein.distance("world".split(" "), "I really love The Matrix movie because of this quote 'welcome to the real world'".split(" "))

```

So this way, the tag **welcome to the real world** is more likely to match with the string **I really love The Matrix movie because of this quote &#8216;welcome to the real world**

I use this [Gem][3] for this experiment

 [1]: http://en.wikipedia.org/wiki/Approximate_string_matching
 [2]: http://en.wikipedia.org/wiki/Levenshtein_distance
 [3]: http://rubygems.org/gems/levenshtein "levenshtein algorithm"
