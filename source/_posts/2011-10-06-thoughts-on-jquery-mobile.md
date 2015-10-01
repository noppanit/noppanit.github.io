---
title: Thoughts on jQuery Mobile
author: Noppanit Charassinvichai
layout: post
permalink: /thoughts-on-jquery-mobile/
dsq_thread_id:
  - 435793681
categories:
  - Rails
tags:
  - jquery-mobile
  - rails
---
Last week I helped out my friends [Eewei][1] and [Jill][2] in [Future of web app conference][3] in London. Unfortunately, I couldn&#8217;t be in the conference. They presented this really amazing called [jQuery Mobile][4]

So, you&#8217;re allowed to transform a simple html website to be operational in modern mobile devies, such as iPhone, BB or Android phones. What you need to do it just add a javascript file and a css file from jQueryMobile site and that&#8217;s it. Bam! you have a ready to go mobile website in a min. Interesting to point out is that it&#8217;s still in a development stage and the latest release when I&#8217;m writing this is just a RC1. So, if you try it now you might be getting some bugs or some unresponsive actions when clicking buttons. Also, when you include the javascript src file and the css version, the version of the two files need to be corresponded, otherwise it might not be working correctly. 

You can say that these days more and more people are browsing websites from mobile devices. Also, it can be said that IE6 has been holding our back on development of javascript or css on desktop for years now (You might have to include a number of different versions of CSS files for different browsers). Whilst on mobile devices IE doesn&#8217;t have any effects on development. Furthermore, developing native apps for just iPhone or Android might be a daunting task for most people who don&#8217;t have any background on Objective-C. Therefore, I think HTML5 for mobile devices might be a better idea to go than starting to build a native app these days. 

I have also built a simple webapp from Rails3 and jQuery Mobile deployed on Heroku. If anybody&#8217;s interested. <https://github.com/noppanit/jquery-mobile-example>

 [1]: http://www.eewei.com "Eewei"
 [2]: http://www.fab.co.uk
 [3]: http://futureofwebapps.com/london-2011/
 [4]: http://jquerymobile.com/