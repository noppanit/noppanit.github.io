---
title: 'Tutorial : Java Random with scaling'
comments: true
author: Noppanit Charassinvichai
jd_tweet_this:
  - yes
wp_jd_bitly:
  - http://bit.ly/al5fMA
wp_jd_target:
  - http://www.noppanit.com/tutorial-java-random-with-scaling/
jd_wp_twitter:
  - ' My latest post: Tutorial : Java Random with scaling (http://bit.ly/al5fMA) http://bit.ly/al5fMA '
dsq_thread_id:
  - 186419621
categories:
  - Knowledges
---
I have been playing around with Random class in Java. Unfortunately, this class doesn&#8217;t provide us some methods we need. Such as, limit the range between -50,50 or get random double from 1 &#8211; 1000. Something like this we can fine tune. I copied some good practice from this [website][1]. 

Here are some examples of these operations:

* Suppose you are writing a game program that simulates throwing dice, and so need a random integer in the range 1 to 6. &#8220;nextInt&#8221; can give you one in the range 0 to 5, and you can translate this to the range you need:

int throw = generator.nextInt(6) + 1;

* In drawing a pattern made up of random lines, you want to pick a random angle between 0 and 360 degrees at which to draw a line. The angle can be any real number. The &#8220;nextDouble&#8221; message will give you a random real number, but between 0 and 1. You can use scaling to turn this into a real number between 0 and 360:

double angle = generator.nextDouble() * 360.0;

* Suppose the same pattern-drawing program also needs to pick random lengths for the lines, but that the lines should never be shorter than 10 units, nor longer than 50. Line lengths can be any real number between these limits. Thus you need random lengths from a 40-unit range starting at 10. You can use scaling and translation together to generate these numbers from &#8220;nextDouble&#8221;:

double length = generator.nextDouble() * 40.0 + 10.0;

 [1]: http://www.cs.geneseo.edu/~baldwin/reference/random.html