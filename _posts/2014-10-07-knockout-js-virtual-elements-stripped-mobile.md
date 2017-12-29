---
title: Knockout.js virtual elements are being stripped out from mobile.
comments: true
author: Noppanit Charassinvichai
layout: post
permalink: /knockout-js-virtual-elements-stripped-mobile/
dsq_thread_id:
  - 3091512291
categories:
  - Javascript
tags:
  - javascript
  - knockoutjs
  - vodafone
---
This rarely happens and you would be surprised what is the cause of this. Recently, I have just finished a mobile site using knockout.js. I have used a fair amount of Virtual Elements in Knockout.js. But weirdly enough one day my Manager came in and talk to my [tech lead][1] (@sragu) that the site is not working. We quickly checked with our live site and everything was ok yet the site from his phone wasn&#8217;t working at all. 

We spent quite a long time to find out the cause of this. We cleared the cache. We restarted the phone. Tried different browsers. Luckily, then we found out this [thread][2] from Stackoverflow.com. 

The cause of this is that Vodafone corporate network stripped out HTML comments to save and optimise the bandwidth.

The solution is to set Cache-Control to no-transform and the problem solved. If you have the same problem as me then this is the solution.

```
Cache-Control: no-transform
```

 [1]: https://twitter.com/sragu "Srini"
 [2]: http://stackoverflow.com/questions/4113268/how-to-stop-javascript-injection-from-vodafone-proxy
