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

{% img http://www.noppanit.com/wp-content/uploads/2014/02/Screen-Shot-2014-02-09-at-19.45.38.png %}

And this is the result of non-optimized version. 

{% img http://www.noppanit.com/wp-content/uploads/2014/02/Screen-Shot-2014-02-09-at-19.46.59.png %}

It&#8217;s clear to see that the optimized version takes shorter to load the script, where as the non-optimized version in the files might be smaller but with a lot of calls, it takes longer to load all the scripts.

 [1]: https://github.com/noppanit/requirejs-optimization-example "Require.js optimisation example"
