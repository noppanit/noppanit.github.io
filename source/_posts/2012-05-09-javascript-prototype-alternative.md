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

``` javascript
var Adder = function() {
   this.a = "0";
   this.b = "0";
}

Adder.prototype = {
   add : function(value1, value2) {
       return value1 + value2;
   }
}

var adder = new Adder();
adder.add(1,2);
```

This type is fine in most cases, but the downside of this pattern is that you&#8217;re exposing add function to the outside world via prototype, and it&#8217;s not good for object-oriented concept. You could easily tamper with function add by doing this.

``` javascript
adder.__proto__.add = function() { };
```

And if you run this 

``` javascript
adder.add(); // undefined
```

You will get an error because you&#8217;ve tampered with function add already.

In order to prevent this to happen you could do something like this. Like this we&#8217;re exposing just the function but not via prototype. 

``` javascript
var Adder = function() {
    function add(value1, value2) {
        return value1 + value2;
    }

    return { 
        add : add
    };
}

var adder = Adder();
adder.add(1,2); // 3
```

Reference: http://nodetuts.com/tutorials/28-javascript-classes-prototypes-and-closures.html
