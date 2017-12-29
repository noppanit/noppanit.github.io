---
title: My thoughts on AngularJs
comments: true
author: Noppanit Charassinvichai
dsq_thread_id:
  - 1481581579
categories:
  - Javascript
tags:
  - angularjs
  - javascript
---
If you work on web development you probably have heard [AngularJs][1] at some point. It&#8217;s a framework created by people at Google. So, we can be sure in some level for people who working behind this project. To summarise this project in short, I&#8217;d say it&#8217;s a framework to help you build a web application in an MVC-style same as [Backbone.js][2] but easier I&#8217;d say. AngularJs extends HTML instead of fighting with the language, so you can easily write your own HTML to manipulate your page. I&#8217;d recommend have a look at the [documentation][3] to understand more of AngularJs.

## Single-page app

I guess this is a really buzz word for 2013. Single-page apps utilises AJAX to build a single page web application. So, user gets the same feeling as using native mobile application. I&#8217;d say this is the strongest point in AngularJs, if you&#8217;re thinking of building a simple single-page app AngularJs is worth to have a look for. However, you can also build a single-page application easily yourself but if you&#8217;re lazy like me, have a look at [angular-seed][4] to get you started quickly. 

## Off-line application

One thing that I really like about AngularJs is, it somehow enforces you to use client-side templating. So, you can make a request to your server and return data in JSON format which you can use AngularJs to manipulate that data to build a webpage. Also, you can cache those data in LocalStorage or use Browser caching so if users&#8217; phone doesn&#8217;t have signal they can still use your application. Of course you can do the same with client-side templating like [mustache][5].

## Learning Curve

I&#8217;d said this is the biggest flaw of AngularJs because the documentation is not quite extensive. However, you can get by by asking people at stackoverflow or google forum. They&#8217;re plenty of people who can support you. Also, if you&#8217;re new to AngularJs it might take sometime to learn how to use AngularJs correctly. AngularJs would allow you to do anything as long as you&#8217;re not doing anything severely bad. AngularJs also won&#8217;t complain anything if you&#8217;re not following the desired design pattern. I&#8217;d strongly suggest you have a look at this [video][6] to learn how to do things in AngularJs from the creators of AngularJs. It took me a while and a lot of trial-and-errors. For example, you can use **$http** instead of **resource**. 

## Performance

If you search this &#8216;performance angularjs&#8217; you&#8217;d find a lot of articles complaining about performance of AngularJs, which I also have encountered myself on my project. AngularJs uses technique called dirty-checking, which will check for changes of each object in your model. If you have a lot of objects in your model it&#8217;d substantially hurt your performance of the application. You have to keep an eye on the performance of your application and I&#8217;d suggest you use [AngularJs-Batarang][7] to find the hot spot. But most cases, it&#8217;s because you&#8217;re loading too many objects or please consider using pagination (I know I hate that too!). Lazy loading is also the technique I use to overcome this issue. Generally speaking, if you&#8217;re not doing something crazy I&#8217;d say angularjs is pretty fast and slick. 

## jQuery

One thing that I&#8217;d avoid as much as possible to do on mobile application is jQuery. It&#8217;s a huge framework for mobile phone. AngularJs comes with jQuery-lite which you can use popular methods like in jQuery without loading the whole jQuery framework in your application. So, if you think you have to use jQuery in your Angualarjs application please think twice. If you need to manipulate DOM you can try plain-old javascript to do that first, if it&#8217;s getting bloated then you can try jQuery but you have to keep an eye on the performance as well.

## Summary

In general, AngularJs is a good framework if you want to do single-page application or normal web-application in MVC style. I tried Backbone.js and I felt it&#8217;s really hard to grasp the concept. I find AngularJs more natural and intuitive. Performance is a big thing in AngularJs so you have to keep an eye on that if you have a lot of objects on your webpage it&#8217;ll hurt the load time because of dirty-checking.

 [1]: http://angularjs.org/ "angularjs"
 [2]: http://backbonejs.org/ "backbone.js"
 [3]: http://docs.angularjs.org/tutorial "angularjs tutorial"
 [4]: https://github.com/angular/angular-seed "angular-seed"
 [5]: http://mustache.github.io/ "mustache"
 [6]: https://www.youtube.com/watch?v=ZhfUv0spHCY "AngularJs Best Practices"
 [7]: https://chrome.google.com/webstore/detail/angularjs-batarang/ighdmehidhipcmcojjgiloacoafjmpfk?hl=en