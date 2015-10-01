---
title: Example of Require.js optimizer.
author: Noppanit Charassinvichai
layout: post
permalink: /example-require-js-optimizer/
dsq_thread_id:
  - 2242928658
categories:
  - Javascript
---
I decided to write this blog post to show how easy it is to setup require.js optimizer and how many bytes it saves. 

To make it as simple as possible, I created this repository on [github][1] to show the real example. 

This is the results of optimisation.

<div id="attachment_1283" style="width: 1284px" class="wp-caption aligncenter">
  <a href="http://www.noppanit.com/wp-content/uploads/2014/02/Screen-Shot-2014-02-09-at-19.45.38.png"><img src="http://www.noppanit.com/wp-content/uploads/2014/02/Screen-Shot-2014-02-09-at-19.45.38.png" alt="optimized version." width="1274" height="131" class="size-full wp-image-1283" /></a>
  
  <p class="wp-caption-text">
    optimized version.
  </p>
</div>

And this is the result of non-optimized version. 

[<img src="http://www.noppanit.com/wp-content/uploads/2014/02/Screen-Shot-2014-02-09-at-19.46.59.png" alt="Require.js " width="1438" height="254" class="aligncenter size-full wp-image-1284" />][2]

It&#8217;s clear to see that the optimized version takes shorter to load the script, where as the non-optimized version in the files might be smaller but with a lot of calls, it takes longer to load all the scripts.

 [1]: https://github.com/noppanit/requirejs-optimization-example "Require.js optimisation example"
 [2]: http://www.noppanit.com/wp-content/uploads/2014/02/Screen-Shot-2014-02-09-at-19.46.59.png