---
title: Event delegation in JavaScript is fast but how fast?
comments: true
author: Noppanit Charassinvichai
layout: post
permalink: /event-delegation-javascript-fast-fast/
dsq_thread_id:
  - 3250313472
categories:
  - Javascript
tags:
  - javascript
  - performance
---
People say always use event delegation for adding event because it&#8217;s faster. But how fast exactly? I really want to create a test case for this, but I couldn&#8217;t figure out how to run B[enchmark.js][1] in browser. So, I thought we could just use Chrome Developer Tool to achieve this. 

## What are we measuring?

As I said in the beginning, we want to know how fast event delegation is compared to direct binding that most people do. For example, I&#8217;ve always seen people do this

``` javascript
$('#ul li').on('click', function() {
  // doing something amazing.
});
```

What is actually doing is, jQuery will add the event to each of the **li** in the DOM. If you have 3-4 lis, then I don&#8217;t think it&#8217;s going to make a big difference. However, if you have a thousand lis, you will see some difference. I&#8217;ll show you by using Chrome Developer Tool. 

## What do we need?

We need some basic HTML 

It&#8217;s going to be something like this

``` html
<ul id="parent">
  <li></li>
  // 999 more <li>
</ul>
```

Then we will have JavaScript like this

``` html
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<script>
    $('#parent li').on('click', function() {
        console.log('you clicked me!');
    });

</script>
```

If you open your html page on Chrome you should see something like this.  
{% img https://www.noppanit.com/wp-content/uploads/2014/11/Screen-Shot-2014-11-21-at-7.06.19-PM.png %}

If you go down to where JavaScript is executed You will see it takes around **37ms** to execute the snippet.  

{% img https://www.noppanit.com/wp-content/uploads/2014/11/Screen-Shot-2014-11-21-at-7.07.18-PM.png %}

Now change your snippet to be event delegation

``` html
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<script>
    $('#parent').on('click', 'li', function() {
        console.log('you clicked me!');
    });

</script>
```

And refresh the page you should see something like this.  

{% img https://www.noppanit.com/wp-content/uploads/2014/11/Screen-Shot-2014-11-21-at-7.12.02-PM.png %}

Now it will only take **2ms** to execute the snippet. It&#8217;s because the event is added to one element not 1000 of them. 

This is just an easy example that you can do it yourself to improve your performance.

 [1]: http://benchmarkjs.com/ "benchmark.js"
 [2]: https://www.noppanit.com/wp-content/uploads/2014/11/Screen-Shot-2014-11-21-at-7.06.19-PM.png
 [3]: https://www.noppanit.com/wp-content/uploads/2014/11/Screen-Shot-2014-11-21-at-7.07.18-PM.png
 [4]: https://www.noppanit.com/wp-content/uploads/2014/11/Screen-Shot-2014-11-21-at-7.12.02-PM.png
