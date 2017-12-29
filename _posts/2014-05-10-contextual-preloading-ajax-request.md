---
title: Contextual Preloading for Ajax request.
comments: true
author: Noppanit Charassinvichai
dsq_thread_id:
  - 2675297282
categories:
  - Javascript
tags:
  - ajax
  - javascript
  - zepto
---
I have just heard this from my friend [@rajveerr][1] about pre-loading at the global level, this concept is not new but I have just learned it.. Usually and I think everyone has done it before. People would do something like this.

``` javascript
$('#link1').on('click', function (e) {
    // Do some funky spinning wheel
    $.ajax({
        url: '/echo/json',
        success : function (data) {
            // Cancel that funky spinning wheel
        }
    });
});
```

And you have to do this for every single ajax request. So, here&#8217;s how you would do that in a contextual level. 

<iframe width="100%" height="300" src="//jsfiddle.net/noppanit/y63n5/embedded/" allowfullscreen="allowfullscreen" frameborder="0"></iframe>

The trick is that in each ajax request you need to add context option. I used zepto as an example but jquery should work the same. The reason is that is **e.target** behaves differently each browser. Also, usually Ajax request would be fired from **#document** level that means your **e.target** would be your </p> 

``` javascript
$('#link1').on('click', function (e) {
    $.ajax({
        url: '/echo/json',
        <strong>context: e.target</strong>,
        success : function (data) {
            console.log(data);
        }
    });
});
```

By doing this if you want your pre-loader you just need to add **.ajaxContainer** class to your container.

 [1]: https://twitter.com/rajveerr "rajveerr twitter"
